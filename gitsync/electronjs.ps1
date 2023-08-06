param (
    $test
)

if ($test -eq "1") {
    Write-Host "Working"
} elseif ($test -eq "2") {
    write-host "also working"
} else {
    Write-Host "Not working :("
}