param (
    [string]$First,
    [string]$Last
)

$outputFile = "C:\users\ksuess\Desktop\PrimaryOutput.txt"
Add-Content -Path $outputFile -Value "Primary - First: $First, Last: $Last"