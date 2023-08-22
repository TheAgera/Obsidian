
##########################################################################################################################################

function BuildTableForHosts($ports) {
    # Header of the table
    $table = "| Port #        | Description   |`n| ------------- |:-------------:|"
    foreach ($port in $ports.Split(',')) {
        # 
        # Use switch cases to add specific logic for each port
        # Unregistered ports: 9235,9300,8777, 8777, 8125, 8090, 8000, 7880,4711,4369,3333, 3000, 2302
        $description = switch ($port.Trim()) {
            "22" {"SSH"}
            "22" {"SMTP"}
            "53" { "DNS"}
            "80" {"HTTP Port"}
            "82" {"XFER"}
            "111" {"ONC RPC"}
            "139" {"NetBIOS"}
            "389" {"LDAP"}
            "443" {"HTTPS Port"}
            "445" {"Microsoft-DS"}
            "631" {"Unix Printing"}
            "636" {"LDAPS"}
            "1025" {"Microsoft RPC"}
            "1027" {"IPv6-4 NAT"}
            "2083" {"Secure RADIUS"}
            "3001" {"Honeywell"}
            "3306" {"MySQL"}
            "5432" {"PostgreSQL"}
            "7070" {"RTSP"}
            "6379" {"Redis"}
            "9000" {"Portainer HTTP"}
            "9001" {"Portainer Agent"}
            "9090" {"Cockpit"}
            "9443" {"Portainer HTTPS"}
            "10050" {"Zabbix Agent"}
            "10055" {"Zabbix Agent"}
            "19999" {"DNP-Secure"}
            "27017" {"MongoDB"}
            default { "Unregistered" }
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

    # $portainerText = if ($portainer -eq "Y") { "$ip:9000 or 9001 (Portainer Web Console)" } else { "" }
    # $webcnslText = if ($webcnsl -eq "Y") { "$ip+9090 (Cockpit Web Console)" } else { "" }
    # if ($portainerText) { $markdown += "`n    - $portainerText" }
    # if ($webcnslText) { $markdown += "`n    - $webcnslText" }

    $portsTable = BuildTableForHosts $ports

    # Build the markdown string
    $markdown = "
# $description
###### $vmid | $name
___
## Network Information:
- IP: $ip
- InternalFQDN: $intfqdn
- ExternalFQDN: $extfqdn    

### Listening Ports
$portsTable
"

    Write-Host $markdown
    Add-Content -Path $outputFilePath -Value $markdown
}

$workbook.Close()
$excelApp.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excelApp) | Out-Null
# Initialize an empty array to collect all the ports
$allPorts = @()

