$autocadinstallpath = "C:\Program Files\Autodesk"
# Get folders in the install directory matching the pattern
$autocadfolders = Get-ChildItem -Path $autocadinstallpath -Directory | Where-Object { $_.Name -match 'AutoCAD \d{4}' }
$ltfolders = Get-ChildItem -Path $autocadinstallpath -Directory | Where-Object { $_.Name -match 'AutoCAD LT \d{4}' }
# Function to get an array of paths for accoreconsole.exe in a given folder
function Get-accoreconsolePaths($folder) {
    $accorePaths = Get-ChildItem -Path $folder.FullName -Filter "accoreconsole.exe" -Recurse | Select-Object -ExpandProperty FullName
    return $accorePaths
}
# Iterate through AutoCAD folders and get accoreconsole.exe paths
$autocadPaths = foreach ($folder in $autocadfolders) {
    Get-accoreconsolePaths $folder
}
# Iterate through AutoCAD LT folders and get accoreconsole.exe paths
$ltPaths = foreach ($folder in $ltfolders) {
    Get-accoreconsolePaths $folder
}
# Display the array of AutoCAD accoreconsole.exe paths
Write-Host "AutoCAD accoreconsole.exe paths:"
$autocadPaths | Format-Table -AutoSize
# Display the array of AutoCAD LT accoreconsole.exe paths
Write-Host "AutoCAD LT accoreconsole.exe paths:"
$ltPaths | Format-Table -AutoSize
# You can now use $autocadPaths and $ltPaths arrays as needed in your further script.
$pathtocoreconsole=$ltPaths,$autocadPaths
# Start-Process -FilePath $pathtocoreconsole
# Original Batch: FOR %%F IN (C:\BATCH\*.dwg, this will be array) DO "$pathtocoreconsole" /i "%%F" /s "c:\BATCH\namethatfile.scr, variable for script" /l en-US
Get-ChildItem -Path C:\acad\BATCH\*.dwg | ForEach-Object {
    $filePath = $_.FullName
    Start-Process "$pathtocoreconsole" -ArgumentList "/i `"$filePath`" /s 'c:\acad\BATCH\namethatfile.scr' /l en-US" -Wait
}

