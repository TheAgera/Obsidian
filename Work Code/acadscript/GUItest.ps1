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
$paths = $autocadPaths + $ltpaths
write-host $paths
$paths | ForEach-Object { $var_ddlacadversion.Items.Add($_.ProductAndYear) }
# Function to handle combo box selection change event
function ComboBox_SelectionChanged($sender, $e) {
    clearCommandPreview
    $selectedItem = $var_ddlacadversion.SelectedIndex
    updateCommandPreview -inputString $paths[$selectedItem].FullPath
}
function clearCommandPreview(){
    $var_previewWindow.text=""
}
function updateCommandPreview(){
    param (
        [string]$inputString
    )
    $var_previewWindow.text=$inputString
}
# Attach the event handler to the SelectionChanged event of your combo box
$var_ddlacadversion.add_SelectionChanged({ ComboBox_SelectionChanged $_ })
updateCommandPreview -inputString "Make a Selection on the Left:"
$var_scrfile.Add_Click({
    $scriptfilepath=New-Object System.Windows.Forms.OpenFileDialog
    $scriptfilepath.Filter= "SCR (*.scr) | *.scr"
    $scriptfilepath.ShowDialog()
    write-host $scriptfilepath.FileName
    $scriptfilepathtrue=$scriptfilepath.FileName
    updateCommandPreview -inputString $scriptfilepathtrue[$selectedItem].FileName
})

$psform.ShowDialog()



   # # # Depending on the selected item, update the filepath
    # # if ($selectedItem -match 'AutoCAD') {
    # #     $selectedPaths = $autocadPaths
    # # } elseif ($selectedItem -match 'AutoCAD LT') {
    # #     $selectedPaths = $ltPaths
    # # }

    # # # Assuming you want the first path, you can modify this based on your logic
    # # $selectedPath = $selectedPaths[0].FullPath
    # $var_previewWindow.text=$selectedItem
    # # Update the filepath or use it as needed in your script
    # Write-Host "Selected Path: $selectedPath"