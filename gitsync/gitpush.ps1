Write-Host "The script was launched by: $env:USERNAME"
$currentUser = $env:USERNAME

function Git-Add {
    $gitadd = {Set-Location "C:\Users\$currentUser\Documents\Obsidian"; git add *}
    & $gitadd
    }
    
    function Git-Commit {
        Set-Location "C:\Users\$currentUser\Documents\Obsidian"
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
    
    function Git-Push {
        $gitpush = {Set-Location "C:\Users\$currentUser\Documents\Obsidian"; git push}
        & $gitpush
    }

    Git-Add
    Git-Commit
    Git-Push