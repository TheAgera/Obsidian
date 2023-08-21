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

# # Add conditional text based on vmid value
#      if ($vmid -eq "Y") {
#         $markdown += "### VMID is Y! Special line of text here!`n"
#      } 


# ComObjects allows objects created in different languages to interact, in this example we are opening an instance of excel.
$excelApp = New-Object -ComObject excel.application

# Tells excel to not visibly open, however it will open if you check task manager
$excelApp.Visible = $false

# Source file path
$workbook = $excelApp.Workbooks.Open("C:\Users\ksuess\Documents\Obsidian\Work Code\ProxMoxServerSummary.xlsx")

# Grabs the sheet by index
$worksheet = $workbook.Sheets.Item(1) 

# Grabs the table name
$table = $worksheet.ListObjects("Table3")

# File path for data output
$outputFilePath = "C:\Users\ksuess\Documents\Obsidian\Work Code\ProxMox Summary Template.md"

# List all of the rows.
$rows = $table.ListRows



# This is a loop that will iterate through each row in the $rows collection.
foreach ($row in $rows) {
    # Inside the loop, the script is taking data from each cell in the current row. After one row, it will (2,X), working in the (Y, X) coordinates.
    $vmid = $row.range.cells(1, 1).Text 
    $name = $row.range.cells(1, 2).Text 
    $description = $row.range.cells(1, 3).Text 
    $os = $row.range.cells(1, 4).Text 
    $ip = $row.range.cells(1, 5).Text 
    $intfqdn = $row.range.cells(1, 6).Text 
    $ports = $row.range.cells(1, 7).Text 
    $extfqdn = $row.range.cells(1, 8).Text 
    $portainer = $row.range.cells(1, 9).Text 
    $webcnsl = $row.range.cells(1, 11).Text 
    $online = $row.range.cells(1, 12).Text 

    $portainerText = if ($portainer -eq "Y") {
        $portainerText = "$ip:9000 or 9001 (Portainer Web Console)"
    } else { "" }
    
    $webcnslText = if ($webcnsl -eq "Y") {
        $webcnslText = "$ip+9090 (Cockpit Web Console)"
    } else { "" }

    if ($portainer -eq "Y") {
        $portainerText = "$ip+:9000 or 9001 (Portainer Web Console)"
    }

    if ($webcnsl -eq "Y") {
        $webcnslText = "$ip+9090 (Cockpit Web Console)"
    }
    # Build the markdown string
    $markdown ="
# $description
###### $vmid | $name
___
## Network Information:
- IP: $ip

- InternalFQDN: $intfqdn"
    
if ($portainerText) { $markdown += "`n    $portainerText" }
if ($webcnslText) { $markdown += "`n    $webcnslText" }

$markdown += "
- ExternalFQDN: $extfqdn    

### Listening Ports
- $ports
"
    Write-Host $markdown
    Add-Content -Path $outputFilePath -Value $markdown
}

$workbook.Close()
$excelApp.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excelApp) | Out-Null



function BuildTableForHosts($ports) {
    # Header of the table
    $table = "| Port #        | Description   |`n| ------------- |:-------------:|"
    foreach ($port in $ports.Split(',')) {
        # Use switch cases to add specific logic for each port
        # One offs: 9235,9300, 8
        $description = switch ($port.Trim()) {
            "22" { "SSH"}
            "53" { "DNS"}
            "80" { "HTTP Port" }
            "443" { "HTTPS Port" }
            ""
            "9090" {"Cockpit"}
            "9443" {"Portainer HTTPS"}
            "10050" {"Zabbix Agent"}
            "10055" {"Zabbix Agent"}
            default { "Other Port: $port" }
        }
        $table += "`n| $port | $description |"
    }
    return $table
}

# ComObjects allows objects created in different languages to interact, in this example we are opening an instance of Excel.
$excelApp = New-Object -ComObject excel.application
$excelApp.Visible = $false

# Source file path
$workbook = $excelApp.Workbooks.Open("C:\Users\ksuess\Documents\Obsidian\Work Code\ProxMoxServerSummary.xlsx")
$worksheet = $workbook.Sheets.Item(1) 
$table = $worksheet.ListObjects("Table3")
$outputFilePath = "C:\Users\ksuess\Documents\Obsidian\Work Code\ProxMox Summary Template.md"
$rows = $table.ListRows

foreach ($row in $rows) {
    # ...
    $vmid = $row.range.cells(1, 1).Text 
    $name = $row.range.cells(1, 2).Text 
    $description = $row.range.cells(1, 3).Text 
    $os = $row.range.cells(1, 4).Text 
    $ip = $row.range.cells(1, 5).Text 
    $intfqdn = $row.range.cells(1, 6).Text 
    $ports = $row.range.cells(1, 7).Text
    $extfqdn = $row.range.cells(1, 8).Text
    $portainer = $row.range.cells(1, 9).Text 
    $webcnsl = $row.range.cells(1, 11).Text 

    $portainerText = if ($portainer -eq "Y") { "$ip:9000 or 9001 (Portainer Web Console)" } else { "" }
    $webcnslText = if ($webcnsl -eq "Y") { "$ip+9090 (Cockpit Web Console)" } else { "" }

    $portsTable = BuildTableForHosts $ports

    # Build the markdown string
    $markdown = "
# $description
###### $vmid | $name
___
## Network Information:
- IP: $ip
- InternalFQDN: $intfqdn"

    if ($portainerText) { $markdown += "`n    - $portainerText" }
    if ($webcnslText) { $markdown += "`n    - $webcnslText" }

    $markdown += "
- ExternalFQDN: $extfqdn    

### Listening Ports
$portsTable
"

    Write-Host $markdown
    #Add-Content -Path $outputFilePath -Value $markdown
}

$workbook.Close()
$excelApp.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excelApp) | Out-Null
# Initialize an empty array to collect all the ports
$allPorts = @()

