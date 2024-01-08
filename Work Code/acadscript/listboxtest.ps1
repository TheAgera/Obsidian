Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
$xamlfile="ACADGUI\MainWindow.xaml" 
$inputXAML=Get-Content -Path $xamlFile -Raw
$inputXAML=$inputXAML -replace 'mc:Ignorable="d"','' -replace "x:N","N" -replace '^<Win.*','<Window'
[XML]$XAML=$inputXAML
$reader = New-Object System.Xml.XmlNodeReader $XAML
try{
    $psform=[Windows.Markup.XamlReader]::Load($reader)
}catch{
    Write-Host $_.Exception
    throw
}
$xaml.SelectNodes("//*[@Name]") | ForEach-Object {
    try{
        Set-Variable -Name "var_$($_.Name)" -Value $psform.FindName($_.Name) -ErrorAction Stop
    }catch{
    }
}
Get-Variable var_*
$autocadinstallpath = "C:\Program Files\Autodesk"
$global:scriptPath = ""
$global:dwgsPath = ""

if(test-path $autocadinstallpath){
    # Get folders in the install directory matching the pattern
$autocadfolders = Get-ChildItem -Path $autocadinstallpath -Directory | Where-Object { $_.Name -match 'AutoCAD \d{4}' }
$ltfolders = Get-ChildItem -Path $autocadinstallpath -Directory | Where-Object { $_.Name -match 'AutoCAD LT \d{4}' }
# Function to get an array of paths for accoreconsole.exe in a given folder
function Get-accoreconsolePaths($folder, $product) {
    $accorePaths = Get-ChildItem -Path $folder.FullName -Filter "accoreconsole.exe" -Recurse | Select-Object -ExpandProperty FullName
    $result = @()
    $result += foreach ($path in $accorePaths) {
        [PSCustomObject]@{
            ProductAndYear = "$product $($folder.Name -replace '\D','')"
            FullPath = $path
        }
    }
    return $result
}
# Iterate through AutoCAD folders and get accoreconsole.exe paths
$autocadPaths = foreach ($folder in $autocadfolders) {
    Get-accoreconsolePaths $folder "AutoCAD"
}
# Iterate through AutoCAD LT folders and get accoreconsole.exe paths
$ltPaths = foreach ($folder in $ltfolders) {
    Get-accoreconsolePaths $folder "AutoCAD LT"
}
$paths = $autocadPaths + $ltPaths
write-host $paths
$paths | ForEach-Object { $var_ddlacadversion.Items.Add($_.ProductAndYear) }
# Function to handle combo box selection change event
function ComboBox_SelectionChanged($sender, $e) {
    clearCommandPreview
    $selectedItem = $var_ddlacadversion.SelectedIndex
    updateCommandPreview -inputString $paths[$selectedItem].FullPath
    fullCommandPreview
}
# When called clears the preview window
function clearCommandPreview(){
    $var_previewWindow.text=""
}
# When called, the preview window gets updated with the input string
function updateCommandPreview(){
    param (
        [string]$inputString
    )
    $var_previewWindow.text=$inputString
}
# This function is to dynamically generate the command that starts the scripting process for the AutoCAD files.
function fullCommandPreview(){
    $examplePath = "$($paths[$var_ddlacadversion.SelectedIndex].FullPath) /i $($global:dwgsPath[0]) /s $global:scriptPath"
    $var_previewWindow.text= $examplePath
}

# Updates the drawing list when called with inputstring parameter
function updateDrawingList(){
    param (
        [string]$inputString
    )
    $counter = 0
    foreach ($fileName in $fileNames) {
        # Create a new ListBoxItem
        $listBoxItem = New-Object System.Windows.Controls.ListBoxItem
        $listBoxItem.Content = $fileName  # Set the filename as the content of the ListBoxItem

        # Set other properties on the ListBoxItem, if needed
        # For example, setting the background color
        # $listBoxItem.Background = 'Red'

        # Add an event handler for the DoubleClick event
        $listBoxItem.Add_MouseDoubleClick({
            if ($global:isStartClicked) {
            # This script block is executed when the ListBoxItem is double-clicked
            $item = $_.Source.Content
            $baseItemName = $item -replace '\.dwg$', ''
            $doubleClickPath = ".\temp\" + $baseItemName + "-combined.txt"
            # Read and output the content of the combined file
            $fileContent = Get-Content -Path $doubleClickPath -Raw -Encoding unicode
            
            # Create a new WPF Window
            Add-Type -AssemblyName PresentationFramework
            $window = New-Object System.Windows.Window
            $window.Title = "File Content"
            $window.Width = 600
            $window.Height = 700
            $window.WindowStartupLocation = [System.Windows.WindowStartupLocation]::CenterScreen

            # Add a TextBox to the Window to display the content
            $textBox = New-Object System.Windows.Controls.TextBox
            $textBox.VerticalScrollBarVisibility = 'Visible'
            $textBox.HorizontalScrollBarVisibility = 'Auto'
            $textBox.AcceptsReturn = $true
            $textBox.TextWrapping = 'Wrap'
            $textBox.Text = $fileContent

            # Using a Grid as the layout container
            $grid = New-Object System.Windows.Controls.Grid
            $grid.Children.Add($textBox)
            $window.Content = $grid

            # Show the Window
            $window.ShowDialog()
            Write-Host "Content of $doubleClickPath"
            Write-Host $fileContent
            } else {
                Write-host "Start Button has not been clicked yet"
            }
        })

        # Add the ListBoxItem to the ListBox
        $var_listbox.Items.Add($listBoxItem)

        # Debug output
        Write-Host $listBoxItem.Content
        Write-Host "The type of this item is" $listBoxItem.GetType()
        Write-host "The value of counter is: $counter"
        $counter = $counter + 1
    }
}

# New function to update the list box after $var_start is clicked
function updateListBoxAfterStart() {
    foreach ($item in $var_listbox.Items) {
        $itemName = $item.Content
        $baseItemName = $itemName -replace '\.dwg$', ''
        $doubleClickPath = ".\temp\" + $baseItemName + "-combined.txt"
        if (Test-Path $doubleClickPath) {
            $item.Background = [System.Windows.Media.Brushes]::Green
        } else {
            $item.Background = [System.Windows.Media.Brushes]::Red
        }
    }
}

# When a selection is made in the drop-down box, the function to give the full path and update the command preview is called.
$var_ddlacadversion.add_SelectionChanged({ ComboBox_SelectionChanged $_ })
updateCommandPreview -inputString "Make a Selection on the Left:"
# Global variables so they can be used within functions
$global:scriptPath
$global:dwgsPath
$global:isStartClicked = $false
# Array to store process objects
$global:processArray = @()
# Button click function that opens a windows file explorer dialog box, writes the path, and updates the command preview window
$var_scrfile.Add_Click({
    $global:scriptPath = ""
    $scriptfilepath=New-Object System.Windows.Forms.OpenFileDialog
    $scriptfilepath.Filter= "SCR (*.scr) | *.scr"
    $scriptfilepath.ShowDialog()
    $global:scriptPath = $scriptfilepath.FileName
    Write-Host $global:scriptPath
    $scriptContents = Get-Content -Path $global:scriptPath -Raw
    $var_scriptPreview.Text = $scriptContents
    updateCommandPreview -inputString $global:scriptPath
    fullCommandPreview
})
# Button click function that opens a file explorer dialog box, populates global variable with file paths chosen, 
$var_dwgsfile.Add_Click({
    # $global:dwgsPath = "" || You don't need to initialize it, but if you're going to
    $global:dwgsPath = @()
    $dwgsfilepath=New-Object System.Windows.Forms.OpenFileDialog
    $dwgsfilepath.Multiselect=$true
    $dwgsfilepath.Filter= "DWG (*.dwg) | *.dwg"
    $dwgsfilepath.ShowDialog()
    $global:dwgsPath += $dwgsfilepath.FileNames
    $fileNames=@()
    foreach ($dwgfile in $dwgsfilepath.FileNames) {
        $fileNameOnly = [System.IO.Path]::GetFileName($dwgfile)
        $fileNames += $fileNameOnly
        # Write-Host $fileNameOnly
    }
    updateDrawingList -inputString ($fileNames -join "`r`n")
    fullCommandPreview
})
# Second button click that allows user to add drawings from as many different folders as they want
$var_splitdwgs.Add_Click({
    $extraDwgs=New-Object System.Windows.Forms.OpenFileDialog
    $extraDwgs.Multiselect=$true
    $extraDwgs.Filter= "DWG (*.dwg) | *.dwg"
    $extraDwgs.ShowDialog()
    $global:dwgsPath += $extraDwgs.FileNames
    $fileNames = @()
    foreach ($extraDwgFile in $extraDwgs.FileNames) {
        $fileNameOnly = [System.IO.Path]::GetFileName($extraDwgFile)
        $fileNames += $fileNameOnly
        # Write-Host $fileNameOnly
    }
    updateDrawingList -inputString ($fileNames -join "`r`n")
    fullCommandPreview
})
# Button click to start script and generate a text output of errors
$var_start.Add_Click({
    $global:isStartClicked = $true
    $accorePath = $paths[$var_ddlacadversion.SelectedIndex].FullPath
    Write-Host $global:scriptPath
    Write-Host $accorePath
    # ASCII Art for output and error sections
    $asciiArtOutput = @"
************************************
*********** OUTPUT TEXT ************
************************************
"@
    $asciiArtError = @"
************************************
*********** ERROR TEXT *************
************************************
"@
    foreach ($file in $global:dwgsPath){
        write-host $file
        $process = $null
        $baseFileName = [System.IO.Path]::GetFileNameWithoutExtension($file)
        $errorFileName = "$baseFileName-error.txt"
        $errorPath = Join-Path ".\temp\" $errorFileName
        $outputFileName = "$baseFileName-output.txt"
        $outputPath = Join-Path ".\temp\" $outputFileName
        $combinedFileName = "$baseFileName-combined.txt"
        $combinedFilePath = Join-Path ".\temp\" $combinedFileName
        $process = Start-Process -FilePath "$accorePath" -ArgumentList "/i", "$file", "/s", "$global:scriptPath" -PassThru -RedirectStandardError $errorPath -RedirectStandardOutput $outputPath -WindowStyle Hidden
        $global:processArray += $process
        # Wait for the process to exit
        $process.WaitForExit()
        # Combine error and output into a single file
        $asciiArtError | Out-File $combinedFilePath -Encoding unicode
        Get-Content $errorPath | Out-File $combinedFilePath -Append -Encoding unicode
        $asciiArtOutput | Out-File $combinedFilePath -Append -Encoding unicode
        Get-Content $outputPath | Out-File $combinedFilePath -Append -Encoding unicode
        # Optional: Remove individual error and output files
        Remove-Item $errorPath, $outputPath -ErrorAction SilentlyContinue
    }    
    $global:scriptPath = ""
    $global:dwgsPath = ""
    # Check process status
    foreach ($proc in $global:processArray) {
        if ($proc.HasExited) {
            Write-Host "Process $($proc.Id) has exited"
        } else {
            Write-Host "Process $($proc.Id) is still running"
        }
    }
    updateListBoxAfterStart
})
$psform.ShowDialog()
# Original Batch: FOR %%F IN (C:\BATCH\*.dwg, this will be array) DO "$pathtocoreconsole" /i "%%F" /s "c:\BATCH\namethatfile.scr, variable for script" /l en-US
}else{Write-Host "No AutoCAD found"}
