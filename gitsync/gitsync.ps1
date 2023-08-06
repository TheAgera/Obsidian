param (
    $operation
)

Write-Host "The script was launched by: $env:USERNAME"
$currentUser = $env:USERNAME
$config = Get-Content -Path "C:\Users\$currentUser\Documents\gitsync\pathrepositories.json" | ConvertFrom-Json

# $path = "C:\Users\$currentUser\Documents\Obsidian"
Start-Transcript -Path C:\Users\$currentUser\Documents\gitsync\gitsynclog.txt -Append

function Git-Pull($repo) {
    $gitpull = {Set-Location $repo; git pull}
    & $gitpull
}

function Git-Add($repo) {
    $gitadd = {Set-Location $repo; git add *}
    & $gitadd
    }
    
    function Git-Commit($repo) {
        Set-Location $repo
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
    
    function Git-Push($repo) {
        $gitpush = {Set-Location $repo; git push}
        & $gitpush
    }


foreach ($repo in $config.repositories) {
    if ($operation -eq "pull") {
        Git-Pull $repo
    } elseif ($operation -eq "push") {
        Git-Add $repo
        Git-Commit $repo
        Git-Push $repo
    } else {
        Write-Host "Invalid Operation: $operation"
    }
}
Stop-Transcript

    


