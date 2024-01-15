Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
$xamlfile="ACADGUI\MainWindow.xaml" 
$inputXAML=Get-Content -Path $xamlFile -Raw
$inputXAML=$inputXAML -replace 'mc:Ignorable="d"','' -replace "x:N","N" -replace '^<Win.*','<Window'
[XML]$XAML=$inputXAML
$reader = New-Object System.Xml.XmlNodeReader $XAML
try{
    $global:psform=[Windows.Markup.XamlReader]::Load($reader)
}catch{
    Write-Host $_.Exception
    throw
}
$xaml.SelectNodes("//*[@Name]") | ForEach-Object {
    try{
        Set-Variable -Name "var_$($_.Name)" -Value $global:psform.FindName($_.Name) -ErrorAction Stop
    }catch{
    }
}
$xamlfile1="ACADGUI\progressWindow.xaml" 
$inputXAML1=Get-Content -Path $xamlFile1 -Raw
$inputXAML1=$inputXAML1 -replace 'mc:Ignorable="d"','' -replace "x:N","N" -replace '^<Win.*','<Window'
[XML]$XAML1=$inputXAML1
$reader1 = New-Object System.Xml.XmlNodeReader $XAML1
try{
    $global:psform1=[Windows.Markup.XamlReader]::Load($reader1)
}catch{
    Write-Host $_.Exception
    throw
}
$xaml1.SelectNodes("//*[@Name]") | ForEach-Object {
    try{
        Set-Variable -Name "var_$($_.Name)" -Value $global:psform1.FindName($_.Name) -ErrorAction Stop
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
$global:scriptPath
$global:dwgsPath = @()
$global:isStartClicked = $false
# Array to store process objects
$global:processArray = @()
function ComboBox_SelectionChanged($sender, $e) {
    clearCommandPreview
    $selectedItem = $var_ddlacadversion.SelectedIndex
    fullCommandPreview
}
$global:scriptFilePaths = @()

function ComboBox_scriptSelectionChanged {
    param (
        [string]$searchPath
    )
    # Populate ComboBox with files from the script library if not already done
    if ($var_ddlScriptLibrary.Items.Count -eq 0) {
        $scrFiles = Get-ChildItem -Path $searchPath -Filter "*.scr"
        foreach ($scr in $scrFiles) {
            $var_ddlScriptLibrary.Items.Add($scr.Name)
            $global:scriptFilePaths += $scr.FullName
        }
    }
    $var_ddlScriptLibrary.add_SelectionChanged({
        $selectedIndex = $var_ddlScriptLibrary.SelectedIndex
        $selectedFilePath = $global:scriptFilePaths[$selectedIndex]
        $global:scriptPath = $selectedFilePath
        if (Test-Path $global:scriptPath) {
            $scriptContents = Get-Content -Path $global:scriptPath -Raw
            $var_scriptPreview.Text = $scriptContents
        } else {
            $var_scriptPreview.Text = "Selected file not found."
        }
        fullCommandPreview
    })
}
# When called clears the preview window
function clearCommandPreview(){
    $var_previewWindow.text=""
}
function clearCommandVariables(){
    $var_ddlacadversion.SelectedIndex = -1
    $var_ddlScriptLibrary.SelectedIndex = -1
    # $var_progressBar.Value = 0
    $global:dwgsPath = @()
    $global:scriptPath = ""
    clearCommandPreview
    clearDwgPreview
    clearScriptPreview
}
function clearDwgPreview(){
    $var_listbox.Items.Clear()
}
function clearScriptPreview(){
    $var_scriptPreview.Text = ""
}
# This function is to dynamically generate the command that starts the scripting process for the AutoCAD files.
function fullCommandPreview(){
    # updateCommandPreview -inputString "Make a Selection on the Left:" Work the following into this function so it is text that gets overwritten once selection is made
    $examplePath = "$($paths[$var_ddlacadversion.SelectedIndex].FullPath) /i $($global:dwgsPath[0]) /s $global:scriptPath"
    $var_previewWindow.text= $examplePath
}
# Updates the drawing list when called with inputstring parameter
function updateDrawingList(){
    param (
        [string]$inputString
    )
    foreach ($fileName in $fileNames) {
        # Create a new ListBoxItem
        $listBoxItem = New-Object System.Windows.Controls.ListBoxItem
        $listBoxItem.Content = $fileName  # Set the filename as the content of the ListBoxItem
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
    } 
    printDrawingNames
}
function printDrawingNames(){
    $counter = 1
    foreach ($item in $var_listbox.Items) {
        $item.content
        Write-Host $counter ": " $item.content " | " $var_listbox.GetType()
        $counter = $counter +1
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
ComboBox_scriptSelectionChanged -searchPath ".\ScriptLibrary"
$var_ddlacadversion.add_SelectionChanged({ ComboBox_SelectionChanged $_ })
# Global variables so they can be used within functions
# Button click function that opens a windows file explorer dialog box, writes the path, and updates the command preview window
$var_scrfile.Add_Click({
    $scriptFilePathDialog = New-Object System.Windows.Forms.OpenFileDialog
    $scriptFilePathDialog.Filter = "SCR (*.scr)|*.scr"
    if ($scriptFilePathDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $selectedScriptPath = $scriptFilePathDialog.FileName
        $global:scriptPath = $selectedScriptPath
        Write-Host "Selected script path: $global:scriptPath"
        if (Test-Path $global:scriptPath) {
            $scriptContents = Get-Content -Path $global:scriptPath -Raw
            $var_scriptPreview.Text = $scriptContents
        } else {
            $var_scriptPreview.Text = "Selected file not found."
        }
        fullCommandPreview
    }
})
# Button click function that opens a file explorer dialog box, populates global variable with file paths chosen, 
$var_dwgsfile.Add_Click({
    # $global:dwgsPath = "" || You don't need to initialize it, but if you're going to
    # $global:dwgsPath = @()
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
# Button delete currently added drawings, clears global:dwgsPath, Full Command Preview, and Drawing List Preview
$var_dwgsDelete.ToolTip = 
$var_dwgsDelete.Add_Click({
    Write-Host "I am a working button :)"
    $global:dwgsPath = ""
    clearDwgPreview
    fullCommandPreview
})
$var_resetScript.Add_Click({

    Write-Host "I am a working button :)"
    clearCommandVariables
})
# Button click to start script and generate a text output of errors
$var_start.Add_Click({
    $global:isStartClicked = $true
    # $totalFiles = $global:dwgsPath.count
    $currentIndex = 0
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
    $global:psform1.Show()
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
        $currentIndex++
        $var_progressBar.Value = ($currentIndex / $global:dwgsPath.count) * 100
        Write-host $var_progressBar.Value
        $global:psform1.InvalidateVisual()
        $global:psform1.Update()
        $global:psform1.UpdateLayout()
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

$global:psform.ShowDialog()
write-host $global:psform.GetType()

# Original Batch: FOR %%F IN (C:\BATCH\*.dwg, this will be array) DO "$pathtocoreconsole" /i "%%F" /s "c:\BATCH\namethatfile.scr, variable for script" /l en-US
}else{Write-Host "No AutoCAD found"}



function Update-UI {
    [System.Windows.Forms.Application]::DoEvents()
}
$backgroundWorker = New-Object System.ComponentModel.BackgroundWorker
$backgroundWorker.WorkerReportsProgress = $true
$backgroundWorker.DoWork += {
    param($sender, $e)
    foreach ($file in $global:dwgsPath) {
        # ... Your existing processing logic ...
        # Report progress
        $currentIndex++
        $progress = ($currentIndex / $global:dwgsPath.count) * 100
        $backgroundWorker.ReportProgress($progress)
    }
}
$backgroundWorker.ProgressChanged += {
    param($sender, $e)
    $var_progressBar.Value = $e.ProgressPercentage
    Update-UI
}
$backgroundWorker.RunWorkerCompleted += {
    param($sender, $e)
    # Code to execute when the background worker has completed its task
}
$global:psform1.Show()
$backgroundWorker.RunWorkerAsync()


##### BACKUP######
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
$xamlfile="ACADGUI\MainWindow.xaml" 
$inputXAML=Get-Content -Path $xamlFile -Raw
$inputXAML=$inputXAML -replace 'mc:Ignorable="d"','' -replace "x:N","N" -replace '^<Win.*','<Window'
[XML]$XAML=$inputXAML
$reader = New-Object System.Xml.XmlNodeReader $XAML
try{
    $global:psform=[Windows.Markup.XamlReader]::Load($reader)
}catch{
    Write-Host $_.Exception
    throw
}
$xaml.SelectNodes("//*[@Name]") | ForEach-Object {
    try{
        Set-Variable -Name "var_$($_.Name)" -Value $global:psform.FindName($_.Name) -ErrorAction Stop
    }catch{
    }
}
$xamlfile1="ACADGUI\progressWindow.xaml" 
$inputXAML1=Get-Content -Path $xamlFile1 -Raw
$inputXAML1=$inputXAML1 -replace 'mc:Ignorable="d"','' -replace "x:N","N" -replace '^<Win.*','<Window'
[XML]$XAML1=$inputXAML1
$reader1 = New-Object System.Xml.XmlNodeReader $XAML1
try{
    $global:psform1=[Windows.Markup.XamlReader]::Load($reader1)
}catch{
    Write-Host $_.Exception
    throw
}
$xaml1.SelectNodes("//*[@Name]") | ForEach-Object {
    try{
        Set-Variable -Name "var_$($_.Name)" -Value $global:psform1.FindName($_.Name) -ErrorAction Stop
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
$global:scriptPath
$global:dwgsPath = @()
$global:isStartClicked = $false
# Array to store process objects
$global:processArray = @()
$global:fileList = @()
function ComboBox_SelectionChanged($sender, $e) {
    clearCommandPreview
    $selectedItem = $var_ddlacadversion.SelectedIndex
    fullCommandPreview
}
$global:scriptFilePaths = @()
function ComboBox_scriptSelectionChanged {
    param (
        [string]$searchPath
    )
    # Populate ComboBox with files from the script library if not already done
    if ($var_ddlScriptLibrary.Items.Count -eq 0) {
        $scrFiles = Get-ChildItem -Path $searchPath -Filter "*.scr"
        foreach ($scr in $scrFiles) {
            $var_ddlScriptLibrary.Items.Add($scr.Name.Substring(0, $scr.Name.Length - 4))
            $global:scriptFilePaths += $scr.FullName
        }
    }
    $var_ddlScriptLibrary.add_SelectionChanged({
        $selectedIndex = $var_ddlScriptLibrary.SelectedIndex
        $selectedFilePath = $global:scriptFilePaths[$selectedIndex]
        $global:scriptPath = $selectedFilePath
        if (Test-Path $global:scriptPath) {
            $scriptContents = Get-Content -Path $global:scriptPath -Raw
            $var_scriptPreview.Text = $scriptContents
        } else {
            $var_scriptPreview.Text = "Selected file not found."
        }
        fullCommandPreview
    })
}
# When called clears the preview window
function clearCommandPreview(){
    $var_previewWindow.text=""
}
function clearCommandVariables(){
    $var_ddlacadversion.SelectedIndex = -1
    $var_ddlScriptLibrary.SelectedIndex = -1
    # $var_progressBar.Value = 0
    $global:dwgsPath = @()
    $global:scriptPath = ""
    clearCommandPreview
    clearDwgPreview
    clearScriptPreview
}
function clearDwgPreview(){
    $var_listbox.Items.Clear()
}
function clearScriptPreview(){
    $var_scriptPreview.Text = ""
}
# This function is to dynamically generate the command that starts the scripting process for the AutoCAD files.
function fullCommandPreview(){
    # updateCommandPreview -inputString "Make a Selection on the Left:" Work the following into this function so it is text that gets overwritten once selection is made
    $examplePath = "$($paths[$var_ddlacadversion.SelectedIndex].FullPath) /i $($global:dwgsPath[0]) /s $global:scriptPath"
    $var_previewWindow.text= $examplePath
}
# Updates the drawing list when called with inputstring parameter
function updateDrawingList(){
    param (
        [string]$inputString
    )
    foreach ($fileName in $fileNames) {
        # Create a new ListBoxItem
        $listBoxItem = New-Object System.Windows.Controls.ListBoxItem
        $listBoxItem.Content = $fileName  # Set the filename as the content of the ListBoxItem
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
    } 
    printDrawingNames
}
function SetupListBoxAndButtonHandlers() {
    # Variable to store the last selected index
    $global:lastSelectedIndex = -1
    # Event handler for ListBox item click
    $var_listbox.Add_MouseUp({
        # Get the selected item
        $selectedItem = $var_listbox.SelectedItem
        # Find the index of the selected item
        $index = $var_listbox.Items.IndexOf($selectedItem)
        if ($index -ne -1) {
            $global:lastSelectedIndex = $index
            Write-Host "Item clicked at index: $index"
        }
    })
    # Event handler for Button click
    $var_clearDrawing.Add_Click({
        if ($global:lastSelectedIndex -ne -1) {
            # Remove the selected item from the list box
            $var_listbox.Items.RemoveAt($global:lastSelectedIndex)
            $global:dwgsPath = $global:dwgsPath[0..($global:lastSelectedIndex-1)] + $global:dwgsPath[($global:lastSelectedIndex+1)..($global:dwgsPath.Count-1)]
            Write-Host "Removed item at index: $global:lastSelectedIndex"
            # Reset the lastSelectedIndex as the item is now removed
            $global:lastSelectedIndex = -1
            fullCommandPreview
            $global:dwgsPath | Write-Host
        } else {
            Write-Host "No item selected or already removed"
        }
    })
}
# Call the function to set up the handlers
SetupListBoxAndButtonHandlers
function InitializeProgressBar(){

    $global:progressForm = New-Object System.Windows.Forms.Form
    $global:progressForm.Text = "Running Script Progress"
    # Create a Group Box
    $global:progressForm_groupBox = New-Object System.Windows.Forms.GroupBox
    # $psform1_groupBox.Margin = "3,3,3,3"
    # $psform1_groupBox.Padding = "3,3,3,3"
    $global:progressForm_groupBox.Location = New-Object System.Drawing.Point(10,10)
    $global:progressForm_groupBox.Size = New-Object System.Drawing.Size(450,90)

    # Adding controls or settings within the GroupBox
    # For example, adding a label within the GroupBox
    $global:progressForm_label = New-Object System.Windows.Forms.Label
    $global:progressForm_label.Width = 350
    $global:progressForm_label.Text = "Processing : " 
    $global:progressForm_label.Location = New-Object System.Drawing.Point(20, 20)
    $global:progressForm_label.Size = New-Object System.Drawing.Size(350,20)
    

    # Create a progress bar
    $global:progressForm_progressBar = New-Object System.Windows.Forms.ProgressBar
    $global:progressForm_progressBar.Maximum = 100
    $global:progressForm_progressBar.Value = 0
    $global:progressForm_progressBar.Location = New-Object System.Drawing.Point(25, 50)
    $global:progressForm_progressBar.Size = New-Object System.Drawing.Size(400, 20)

    $global:progressForm_groupBox.Controls.Add($global:progressForm_label)
    $global:progressForm_groupBox.Controls.Add($global:progressForm_progressBar)
    $global:progressForm.Controls.Add($global:progressForm_groupBox)

    # Show the form
    $global:progressForm.Add_Shown({ $global:progressForm.Activate() })
    $global:progressForm.Width = 500
    $global:progressForm.Height = 200
    $global:progressForm.Show()
}
function updateProgressBar(){
    param (
        $completeNum,
        $updateText
    )
    $global:progressForm_progressBar.Value = $completeNum
    $temp = "Processing: $($updateText.ToString())"
    write-host $temp
    $global:progressForm_label.Text = $temp
    $global:progressForm.Refresh()
}
function printDrawingNames(){
    $counter = 1
    foreach ($item in $var_listbox.Items) {
        $item.content
        Write-Host $counter ": " $item.content " | " $var_listbox.GetType()
        $counter = $counter +1
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
ComboBox_scriptSelectionChanged -searchPath ".\ScriptLibrary"
$var_ddlacadversion.add_SelectionChanged({ ComboBox_SelectionChanged $_ })
# Global variables so they can be used within functions
# Button click function that opens a windows file explorer dialog box, writes the path, and updates the command preview window
$var_scrfile.Add_Click({
    $scriptFilePathDialog = New-Object System.Windows.Forms.OpenFileDialog
    $scriptFilePathDialog.Filter = "SCR (*.scr)|*.scr"
    if ($scriptFilePathDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        $selectedScriptPath = $scriptFilePathDialog.FileName
        $global:scriptPath = $selectedScriptPath
        Write-Host "Selected script path: $global:scriptPath"
        if (Test-Path $global:scriptPath) {
            $scriptContents = Get-Content -Path $global:scriptPath -Raw
            Write-Host $selectedScript
            $selectedScript.GetType()
            $var_scriptPreview.Text = $scriptContents
        } else {
            $var_scriptPreview.Text = "Selected file not found."
        }
        fullCommandPreview
    }
})
# Button click function that opens a file explorer dialog box, populates global variable with file paths chosen, 
$var_dwgsfile.Add_Click({
    $dwgsfilepath=New-Object System.Windows.Forms.OpenFileDialog
    $dwgsfilepath.Multiselect=$true
    $dwgsfilepath.Filter= "DWG (*.dwg) | *.dwg"
    $dwgsfilepath.ShowDialog()
    $global:dwgsPath += $dwgsfilepath.FileNames
    $fileNames=@()
    foreach ($dwgfile in $dwgsfilepath.FileNames) {
        $fileNameOnly = [System.IO.Path]::GetFileName($dwgfile)
        $fileNames += $fileNameOnly
    }
    updateDrawingList -inputString ($fileNames -join "`r`n")
    fullCommandPreview
})
$var_drawingObject.Add_Click({
    $dwgsfilepath=New-Object System.Windows.Forms.OpenFileDialog
    $dwgsfilepath.Multiselect=$true
    $dwgsfilepath.Filter= "DWG (*.dwg) | *.dwg"
    $dwgsfilepath.ShowDialog()
    foreach ($dwgfile in $dwgsfilepath.FileNames) {
        $fileNameOnly = [System.IO.Path]::GetFileName($dwgfile)
        $fileNames += $fileNameOnly

        $fileInfo = gci $dwgfile | Select-Object -Property *
        $customObject = New-Object PSObject -Property @{
            BaseName = $fileinfo.BaseName
            Name = $fileinfo.Name
            Directory = $fileinfo.Directory
            Path = $fileinfo.FullName
            LastWriteTime = $fileinfo.LastWriteTime
        }
    $global:fileList += $customObject    
    Write-Host "My custom object is named : " $customObject.Path
    }
    updateFileBox
})
function updateFileBox (){
    foreach ( $object in  $global:fileList) {
        Write-host "updateFIleBox debug : " $object.Name 
        # Create a new ListBoxItem
        $listBoxItem = New-Object System.Windows.Controls.ListBoxItem
        $listBoxItem.Content = $object.Name  # Set the filename as the content of the ListBoxItem
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
            } 
            else {
                Write-host "Start Button has not been clicked yet"
            }
        })
        $var_listbox.Items.Add($listBoxItem)
    }
}
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
# Button delete currently added drawings, clears global:dwgsPath, Full Command Preview, and Drawing List Preview
$var_dwgsDelete.ToolTip = "I am a toop tip :)"
$var_dwgsDelete.Add_Click({
    Write-Host "I am a working button :)"
    $global:dwgsPath = ""
    clearDwgPreview
    fullCommandPreview
})
$var_clearDrawing.Add_Click({

})
$var_resetScript.Add_Click({

    Write-Host "I am a working button :)"
    clearCommandVariables
})
# Button click to start script and generate a text output of errors
$var_start.Add_Click({
    $global:isStartClicked = $true
    # $totalFiles = $global:dwgsPath.count
    $currentIndex = 0
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
    # $global:psform1.Show()
    InitializeProgressBar
    $global:dwgsPath | Write-Host
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
        $currentIndex++
        $var_progressBar.Value = ($currentIndex / $global:dwgsPath.count) * 100
        updateProgressBar -completeNum (($currentIndex / $global:dwgsPath.count) * 100) -updateText $file
        Start-Sleep -Milliseconds 25
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
    $global:progressForm.close()
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


$global:psform.ShowDialog()
write-host $global:psform.GetType()

# Original Batch: FOR %%F IN (C:\BATCH\*.dwg, this will be array) DO "$pathtocoreconsole" /i "%%F" /s "c:\BATCH\namethatfile.scr, variable for script" /l en-US
}else{Write-Host "No AutoCAD found"}
