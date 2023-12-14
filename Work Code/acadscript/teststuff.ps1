# Needed for XAML acceptance in powershell, I do not know the details should figure it out
# Add-Type -AssemblyName PresentationFramework


# $xamlFile="PSGui\PSGui\Meow.xaml"
# $inputXAML=Get-Content -Path $xamlFile -Raw
# $inputXAML=$inputXAML -replace 'mc:Ignorable="d"','' -replace "x:Name","Name" -replace '^<Win.*','<Window'
# [XML]$XAML=$inputXAML

# $reader = New-Object System.Xml.XmlNodeReader $XAML
# try{
#     $psform=[Windows.Markup.XamlReader]::Load($reader)

# }catch{
#     write-host $_.Exception
#     throw
# }

# $xaml.SelectNodes("//*[@Name]") | ForEach-Object {
#     try{
#         Set-Variable -Name "var_$($_.Name)" -Value $psform.FindName($_.Name) -ErrorAction Stop
#     }catch{
#         throw
#     }
# }
# # New contrent for batch file
# # This is known as a here-string, allows to define multi-line string, and variables can be included
# $newContent = @"
# @echo off
# echo Hello, testing updated batch file!
# echo bweeeep
# pause
# "@
# # Update the batch file with new information
# $newContent | Set-Content -Path $batchFilePath
# # Run the updated batch file
# Start-Process -FilePath $batchFilePath -Wait
# $acoreenginepath = 
# Specify the path to the Autocad Install Folders
$autocadinstallpath = "C:\Program Files\Autodesk"
# Get folders in the install directory
$autocadfolders = Get-ChildItem -Path $autocadinstallpath -Directory | Where-Object { $_.Name -match '^AutoCAD \d{4}$' }
$ltfolders = Get-ChildItem -Path $autocadinstallpath -Directory | Where-Object { $_.Name -match '^AutoCAD LT \d{4}$' }
# Define a regex pattern to match the last two digits of the year
$autocadfolders[0]
$regexPattern = '\d{2}$'
# Check the folders
# Function to extract year from folder name using regex
# function GetYear($folderName) {
#     $yearMatch = $folderName -match $regexPattern
#     if ($yearMatch) { $matches[0] } else { "No Year Found" }
# }
# Function to get the highest value folder
function GetHighestValueFolder($folders) {
    $highestFolder = $folders | Sort-Object { [int](GetYear $_.Name) } -Descending | Select-Object -First 1
    return $highestFolder
}
# Get the highest value AutoCAD folder
$highestAutocadFolder = GetHighestValueFolder $autocadFolders
# Get the highest value AutoCAD LT folder
$highestLtFolder = GetHighestValueFolder $ltFolders
# Compare the highest AutoCAD and AutoCAD LT folders
$chosenFolder = if ([int](GetYear $highestAutocadFolder.Name) -gt [int](GetYear $highestLtFolder.Name)) {
    $highestAutocadFolder
} else {
    $highestLtFolder
}
# Display the chosen folder
$chosenFolder | Format-Table -AutoSize
# Concatenate the chosen folder path with "\accoreconsole.exe"
$pathtocoreconsole = $chosenFolder.FullName + "\accoreconsole.exe"
# Display the chosen folder and the concatenated path
$chosenFolder | Format-Table -AutoSize
Write-Host $pathtocoreconsole
Start-Process -FilePath $pathtocoreconsole

Invoke-Expression 