function Get-IPAddresses () {
    # ComObjects allows objects created in different languages to interact, in this example we are opening an instance of Excel.
    $excelApp = New-Object -ComObject excel.application
    $excelApp.Visible = $false

    # Source file path
    $workbook = $excelApp.Workbooks.Open("C:\Users\ksuess\Documents\Obsidian\Work Code\ProxMoxServerSummary.xlsx")
    $worksheet = $workbook.Sheets.Item(2) 
    $table = $worksheet.ListObjects("Table32")
    $outputFilePath = "C:\Users\ksuess\Documents\Obsidian\Work Code\ProxMox Summary Template.md"
    $rows = $table.ListRows

    $ip = @() # Declare an array to store the IPs
    foreach ($row in $rows) {
        # Inside the loop, the script is taking data from each cell in the current row. After one row, it will (2,X), working in the (Y, X) coordinates.
        $vmid = $row.range.cells(1, 1).Text 
        $name = $row.range.cells(1, 2).Text 
        $ip += $row.range.cells(1, 5).Text.Trim() 
 
    }

    $workbook.Close()
    $excelApp.Quit()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excelApp) | Out-Null
    return $ip #Return the array of IPs
}

function Process-IPAddresses {
    param (
        [Parameter(Mandatory = $true)]
        [array]$IPAddresses

    )

    Import-Module Posh-SSH

$Password = "moew"
$User = "moew"
$command = @'
docker ps -a | awk 'NR==1 {next} {print $2}'
'@

# Credentials (you may have these defined earlier in your script)
$secpasswd = ConvertTo-SecureString $Password -AsPlainText -Force
$Credentials = New-Object System.Management.Automation.PSCredential($User, $secpasswd)

# Command you want to execute (define this according to your needs)
$command = @'
docker ps -a | awk 'NR==1 {next} {print $2}'
'@

# Iterate through each IP address
foreach ($ip in $IPAddresses) {
    $ComputerName = $ip

    $SessionID = New-SSHSession -ComputerName $ip -Credential $Credentials -AcceptKey

    $Stream = $SessionID.Session.CreateShellStream("PS-SSH",0,0,0,0,500)
    $Stream.Read()

    Invoke-SSHStreamExpectSecureAction -ShellStream $Stream -Command "su" -ExpectString "Password:" -SecureAction $secpasswd

    $Result = Invoke-SSHStreamShellCommand -ShellStream $Stream -Command $command

    # Execute the command
    $Result = Invoke-SSHStreamShellCommand -ShellStream $Stream -Command $command

    # Remove the command from the result
    $filteredOutput = $ip + "`r`n" + ($Result -replace [regex]::Escape($command)) 

    # Save to a file or process further as needed
    $Filepath = "C:\Users\ksuess\Documents\Obsidian\Work Code\poshssh.txt"

    Add-Content -Path $Filepath -Value $filteredOutput

    Remove-SSHSession -SessionId $SessionID.SessionId
}


}

$IPAddresses = Get-IPAddresses
Write-host $IPAddresses
Process-IPAddresses -IPAddresses $IPAddresses