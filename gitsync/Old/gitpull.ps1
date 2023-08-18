param (
    $operation
)

Write-Host "The script was launched by: $env:USERNAME"
$currentUser = $env:USERNAME
$path = "C:\Users\$currentUser\Documents\Obsidian"


function Git-Pull($path) {
    $gitpull = {Set-Location $path; git pull}
    & $gitpull
}

function Git-Add($path) {
    $gitadd = {Set-Location $path; git add *}
    & $gitadd
    }
    
    function Git-Commit($path) {
        Set-Location $path
        $status = git status --porcelain
    
        if ($status) {
            # if status is not empty, commit changes
            $date = Get-Date -Format "MM-dd-yy"
            git commit -m "$date"
    
        } else {
            # If $status is not empty, don't commit
            Write-Host "No changes to commit"
        }
    }
    
    function Git-Push($path) {
        $gitpush = {Set-Location $path; git push}
        & $gitpush
    }

if ($operation -eq "pull") {
    Git-Pull $path
} elseif ($operation -eq "push") {
    Git-Add $path
    Git-Commit $path
    Git-Push $path
} else {
    Write-Host "Invalid Operation: $operation"
}


    Git-Add
    Git-Commit
    Git-Push




