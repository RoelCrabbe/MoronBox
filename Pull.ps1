# Get the current directory where the script is located
$targetDirectory = $PSScriptRoot

# Array of repositories with directory names
$repositories = @(
    @{ Url = "https://github.com/RoelCrabbe/MoronBoxCore.git"; DirectoryName = "MoronBoxCore" },
    @{ Url = "https://github.com/RoelCrabbe/MoronBoxDecursive.git"; DirectoryName = "MoronBoxDecursive" },
    @{ Url = "https://github.com/zelazrgn/KLHThreatMeter.git"; DirectoryName = "KLHThreatMeter" },
    @{ Url = "https://github.com/shagu/ShaguTweaks.git"; DirectoryName = "ShaguTweaks" }
)

# Function to update each repository
function Update-Repositories {
    param (
        [string]$directoryName
    )

    Write-Output "Updating repository: $directoryName"
    Set-Location $directoryName
    git pull
    Set-Location $targetDirectory
}

Write-Output "Started updating repositories in $targetDirectory."

# Loop through each repository in the array
foreach ($repoInfo in $repositories) {
    $directoryName = $repoInfo.DirectoryName

    # Call function to update repository
    Update-Repositories -directoryName $directoryName
}

Write-Output "Repositories updated in $targetDirectory."
