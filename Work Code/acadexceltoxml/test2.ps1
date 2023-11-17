$xml = [xml](Get-Content .\MenuGroup.cui)
$xml1 = [xml](Get-Content .\MenuGroupcopy.cui)
# $xml.MenuGroup.MacroGroup.MenuMacro[0].macro.Name.'#text' = "New Insert Test"
write-host "Original Length:" $xml.MenuGroup.MacroGroup.MenuMacro.Length

# ComObjects allows objects created in different languages to interact, in this example we are opening an instance of Excel.
$excelApp = New-Object -ComObject excel.application
$excelApp.Visible = $false
# Source file path
$workbook = $excelApp.Workbooks.Open("C:\Users\ksuess\Documents\Obsidian\Work Code\acadexceltoxml\CCI_Drawing_Database.xlsx")
$worksheet = $workbook.Sheets.Item(1) 
$table = $worksheet.ListObjects("Table2")
$rows = $table.ListRows
$uidCounter = 0
$template = $xml.MenuGroup.MacroGroup.MenuMacro[0].clone()

$xml.SelectNodes('//MenuGroup/MacroGroup/MenuMacro') | ForEach-Object {
    $_.ParentNode.RemoveChild($_)
}

foreach ($row in $rows) {
    $template1 = $template.clone()
    write-host "Adding Template: " $template.Macro.Name.'#text'
    # Inside the loop, the script is taking data from each cell in the current row.
    $Blockname = $row.range.cells(1, 2).Text 
    $Macro = $row.range.cells(1, 6).Text 
    
    $uidCounter++
        if ($uidCounter -ge 1 -and $uidCounter -le 10) {
            $uidCounterStr = 'CCI_000' + $uidCounter
        }
        elseif ($uidCounter -ge 9 -and $uidCounter -le 100) {
            $uidCounterStr = 'CCI_00' + $uidCounter
        }
        else {$uidCounterStr = 'CCI_0' + $uidCounter}
    # Create a custom object for the current row
    $template1.UID = $uidCounterStr
    $template1.Macro.Name.UID = $uidCounterStr
    $template1.Macro.Name.'#text' = $Blockname
    $template1.Macro.Command = $Macro
    $template1.Macro.Revision.MajorVersion = "1"
    $template1.Macro.Revision.MinorVersion = "1"
    $template1.Macro.Revision.UserVersion = "1"
    $template1.Macro.ModifiedRev.MajorVersion = "1"
    $template1.Macro.ModifiedRev.MinorVersion = "1"
    $template1.Macro.ModifiedRev.UserVersion = "1"
    $template1.Macro.SmallImage.Name = ""
    $template1.Macro.LargeImage.Name = ""

    $xml.MenuGroup.MacroGroup.AppendChild($template1)

}
write-host "Updated Length:" $xml.MenuGroup.MacroGroup.MenuMacro.Length 
$xml.Save(".\MenuGroupcopy.cui")
$workbook.Close()
$excelApp.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excelApp) | Out-Null