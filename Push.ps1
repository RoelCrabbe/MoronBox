# Get the current directory where the script is located
$targetDirectory = $PSScriptRoot

# Array of repositories with directory names and submodule paths
$repositories = @(
    @{ Url = "https://github.com/RoelCrabbe/MoronBoxCore.git"; DirectoryName = "MoronBoxCore"; SubmodulePath = "MoronBoxCore" },
    @{ Url = "https://github.com/zelazrgn/KLHThreatMeter.git"; DirectoryName = "KLHThreatMeter"; SubmodulePath = "KLHThreatMeter" },
    @{ Url = "https://github.com/shagu/ShaguTweaks.git"; DirectoryName = "ShaguTweaks"; SubmodulePath = "ShaguTweaks" }
)

# Function to update each repository including submodules
function Update-Repositories {
    param (
        [string]$directoryName,
        [string]$submodulePath
    )

    Write-Output "Updating repository: $directoryName"
    Set-Location $directoryName
    git pull
    
    # Update submodules if any
    if (Test-Path .gitmodules) {
        git submodule update --init --recursive
    }

    Set-Location $targetDirectory
}

Write-Output "Started updating repositories and submodules in $targetDirectory."

# Loop through each repository in the array
foreach ($repoInfo in $repositories) {
    $directoryName = $repoInfo.DirectoryName
    $submodulePath = $repoInfo.SubmodulePath

    # Call function to update repository and submodules
    Update-Repositories -directoryName $directoryName -submodulePath $submodulePath
}

Write-Output "Repositories and submodules updated in $targetDirectory."

# Push changes to the main repository
Write-Output "Pushing changes to main repository in $targetDirectory."
git add .
git commit -m "Update submodules and repositories"
git push
