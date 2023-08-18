# Header for markdown table, if needed
# $header = "Column1 | Column"

# This is known as a nested loop (loop within a loop)

# for ($i = 1; $i -le $rowCount; $i++) {
#     Write-Host "Row ${i}:"
#     for ($j = 1; $j -le $colCount; $j++) {
#         $cellValue = $table.ListRows($i).Range.Cells(1, $j).Text
#         Write-Host "        Column ${j}: $cellValue"
#     }
# }

# $cellValue = $worksheet.Cells.Item(3, 3).Value()
# Write-Host $cellValue

# Write-Host $table.ListRows.Count

# $rowCount = 75
# $colCount = 11


$excelApp = New-Object -ComObject excel.application

$excelApp.Visible = $false

$workbook = $excelApp.Workbooks.Open("C:\Users\ksuess\Documents\Obsidian\Work Code\ProxMoxServerSummary.xlsx")

$worksheet = $workbook.Sheets.Item(1) # By index

$table = $worksheet.ListObjects("Table3")

$outputFilePath = "C:\Users\ksuess\Documents\Obsidian\Work Code\ProxMox Summary Template.md"

$rows = $table.ListRows

foreach ($row in $rows) {
    # (Y, X)
    
    $vmid = $row.range.cells(1, 1).Text 
    $name = $row.range.cells(1, 2).Text 
    $description = $row.range.cells(1, 3).Text 
    $os = $row.range.cells(1, 4).Text 
    $ip = $row.range.cells(1, 5).Text 
    $intfqdn = $row.range.cells(1, 6).Text 
    $ports = $row.range.cells(1, 7).Text 
    $extfqdn = $row.range.cells(1, 8).Text 
    $portainer = $row.range.cells(1, 9).Text 
    $webcnsl = $row.range.cells(1, 10).Text 
    $online = $row.range.cells(1, 11).Text 

    $markdown = "# $description`n## Network Information`n### DNS:`n- $intfqdn`n- $extfqdn`n###Listening Ports`n$ports
    `n "

    # Build the markdown string
    $markdown =@"
    # $vmid | $name
    # $description
    ## Network Information
    ### $ip
    
    ### DNS:
    - $intfqdn
    - $extfqdn
    
    ### Application Information
    

    ### Listening Ports
    - $ports
    
    ### Portainer/Docker4
    - $portainer
    
    ### Cockpit/Webmin
    - $webcnsl

"@
    Write-Host $markdown
    # Add-Content -Path $outputFilePath -Value $markdown
}






$workbook.Close()
$excelApp.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excelApp) | Out-Null


# foreach ($row in $rows) {
#     # Extract the values as before
#     # ...

#     # Start building the markdown string
#     $markdown = "# $description`n## Network Information`n### $ip`n"

#     # Add conditional text based on vmid value
#     if ($vmid -eq "Y") {
#         $markdown += "### VMID is Y! Special line of text here!`n"
#     } 

#     # Continue building the markdown string
#     $markdown += @"
# ### DNS:
# - $intfqdn
# - $extfqdn

# ### Listening Ports
# - $ports

# ### Portainer/Docker
# - $portainer

# ### Cockpit/Webmin
# - $webcnsl
# "@
#     Write-Host $markdown
#     Add-Content -Path $outputFilePath -Value $markdown
# }
