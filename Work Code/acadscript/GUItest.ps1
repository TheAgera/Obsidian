Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
$xamlfile="C:\Users\ksuess\Documents\Obsidian\Work Code\acadscript\ACADGUI\MainWindow.xaml"
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
    fullCommandPreview -accorePath $paths[$selectedItem].FullPath -selectedScript $global:scriptPath -selectedFiles $global:dwgsPath
}

function clearCommandPreview(){
    $var_previewWindow.text=""
}
function updateCommandPreview($inputStrings){
    $var_previewWindow.text = $inputStrings -join "`r`n"
}

function fullCommandPreview($accorePath, $selectedScript, $selectedFiles){
    $fullCommand = "$accorePath /i $($selectedFiles -join ' /i ') /s $selectedScript"
    updateCommandPreview -inputString $fullCommand
}

function updateDrawingList(){
    param (
        [string]$inputString
    )
    $var_dwgslist.text=$inputString
}
# Attach the event handler to the SelectionChanged event of your combo box
$var_ddlacadversion.add_SelectionChanged({ ComboBox_SelectionChanged $_ })
updateCommandPreview -inputString "Make a Selection on the Left:"
$global:scriptPath
$global:dwgsPath
$var_scrfile.Add_Click({
    $scriptfilepath=New-Object System.Windows.Forms.OpenFileDialog
    $scriptfilepath.Filter= "SCR (*.scr) | *.scr"
    $scriptfilepath.ShowDialog()
    $global:scriptPath = $scriptfilepath.FileName
    Write-Host $global:scriptPath
    updateCommandPreview -inputString $global:scriptPath
})
$var_dwgsfile.Add_Click({
    $dwgsfilepath=New-Object System.Windows.Forms.OpenFileDialog
    $dwgsfilepath.Multiselect=$true
    $dwgsfilepath.Filter= "DWG (*.dwg) | *.dwg"
    $dwgsfilepath.ShowDialog()
    $global:dwgsPath = $dwgsfilepath.FileNames
    $fileNames=@()
    foreach ($dwgfile in $dwgsfilepath.FileNames) {
        $fileNameOnly = [System.IO.Path]::GetFileName($dwgfile)
        $fileNames += $fileNameOnly
        Write-Host $fileNameOnly
    }
    updateDrawingList -inputString ($fileNames -join "`r`n")
})
$var_start.Add_Click({
    $accorePath = $paths[$var_ddlacadversion.SelectedIndex].FullPath
    Write-Host $global:scriptPath
    Write-Host $accorePath
     foreach ($file in $global:dwgsPath){
        write-host $file
        Start-Process -FilePath "$accorePath" -ArgumentList "/i", "$file", "/s", "$global:scriptPath"
     }    
})
$psform.ShowDialog()
# Original Batch: FOR %%F IN (C:\BATCH\*.dwg, this will be array) DO "$pathtocoreconsole" /i "%%F" /s "c:\BATCH\namethatfile.scr, variable for script" /l en-US
