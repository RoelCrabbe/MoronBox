# Get the current directory where the script is located
$targetDirectory = $PSScriptRoot

# Remote repository URL where you want to push changes
$remoteRepository = "combined_repo"

# Function to push changes
function Push-Changes {
    param (
        [string]$remoteName = "origin",
        [string]$branchName = "master"
    )

    Write-Output "Pushing changes to $remoteName/$branchName"
    git push $remoteName $branchName
}

Write-Output "Started pushing changes from $targetDirectory."

# Push changes from the main repository
Push-Changes

Write-Output "Changes pushed successfully to $remoteRepository."
