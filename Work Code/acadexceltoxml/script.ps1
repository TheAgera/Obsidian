
# ComObjects allows objects created in different languages to interact, in this example we are opening an instance of Excel.
$excelApp = New-Object -ComObject excel.application
$excelApp.Visible = $false

# Source file path
$workbook = $excelApp.Workbooks.Open("C:\Users\ksuess\Desktop\CCI_Drawing_Database.xlsx")
$worksheet = $workbook.Sheets.Item(1) 
$table = $worksheet.ListObjects("Table2")
$rows = $table.ListRows

$results = @()

# Output file path
$outputFilePath = "C:\Users\Ksuess\Documents\ACADCUIX.xml"

# Initialize a counter
$uidCounter = 1

foreach ($row in $rows) {
    # Inside the loop, the script is taking data from each cell in the current row. After one row, it will (2,X), working in the (Y, X) coordinates.
    $Blockname = $row.range.cells(1, 2).Text 
    $Macro = $row.range.cells(1, 6).Text 

    # Increment the UID counter
    $uidCounter++

    # Create an XML string manually with an incremented UID
    $xmlString = @"
    <MenuMacro UID="CCI_$($uidCounter.ToString('0000'))">
      <Macro type="Any">
        <Revision MajorVersion="16" MinorVersion="2" UserVersion="1" />
        <ModifiedRev MajorVersion="24" MinorVersion="3" UserVersion="1" />
        <Name xlate="true" UID="XLS_243_9C8C5">$Blockname</Name>
        <Command>$Macro</Command>
        <SmallImage Name="" />
        <LargeImage Name="" />
      </Macro>
    </MenuMacro>
"@

    # Append the XML string to the output file
    $xmlString | Out-File -Append -FilePath $outputFilePath -Encoding UTF8
}



$workbook.Close()
$excelApp.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excelApp) | Out-Null

# Display all results
$results | ForEach-Object { $_.OuterXml }


