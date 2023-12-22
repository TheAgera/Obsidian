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
    $var_dwgslist.text=$inputString
}
# When a selection is made in the drop-down box, the function to give the full path and update the command preview is called.
$var_ddlacadversion.add_SelectionChanged({ ComboBox_SelectionChanged $_ })
updateCommandPreview -inputString "Make a Selection on the Left:"
# Global variables so they can be used within functions
$global:scriptPath
$global:dwgsPath
# Button click function that opens a windows file explorer dialog box, writes the path, and updates the command preview window
$var_scrfile.Add_Click({
    $global:scriptPath = ""
    $scriptfilepath=New-Object System.Windows.Forms.OpenFileDialog
    $scriptfilepath.Filter= "SCR (*.scr) | *.scr"
    $scriptfilepath.ShowDialog()
    $global:scriptPath = $scriptfilepath.FileName
    Write-Host $global:scriptPath
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
        $fileNames = $fileNameOnly
        $global:dwgsPath += $fileNameOnly
        Write-Host $fileNameOnly
    }
    updateDrawingList -inputString ($fileNames -join "`r`n")
    fullCommandPreview
})
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
        Write-Host $fileNameOnly
    }
    updateDrawingList -inputString ($fileNames -join "`r`n")
    fullCommandPreview
})
$var_start.Add_Click({
    $accorePath = $paths[$var_ddlacadversion.SelectedIndex].FullPath
    Write-Host $global:scriptPath
    Write-Host $accorePath
     foreach ($file in $global:dwgsPath){
        write-host $file
        Start-Process -FilePath "$accorePath" -ArgumentList "/i", "$file", "/s", "$global:scriptPath"
     }    
    $global:scriptPath = ""
    $global:dwgsPath = ""
})
$psform.ShowDialog()
# Original Batch: FOR %%F IN (C:\BATCH\*.dwg, this will be array) DO "$pathtocoreconsole" /i "%%F" /s "c:\BATCH\namethatfile.scr, variable for script" /l en-US
}else{Write-Host "No AutoCAD found"}

