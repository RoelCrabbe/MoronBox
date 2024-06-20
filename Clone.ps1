# Get the current directory where the script is located
$targetDirectory = $PSScriptRoot

# Array of repositories to clone with directory names
$repositories = @(
    @{ Url = "https://github.com/RoelCrabbe/MoronBoxCore.git"; DirectoryName = "MoronBoxCore" },
    @{ Url = "https://github.com/RoelCrabbe/MoronBoxDecursive.git"; DirectoryName = "MoronBoxDecursive" },
    @{ Url = "https://github.com/RoelCrabbe/MoronSort.git"; DirectoryName = "MoronSort" },
    @{ Url = "https://github.com/zelazrgn/KLHThreatMeter.git"; DirectoryName = "KLHThreatMeter" },
    @{ Url = "https://github.com/shagu/ShaguTweaks.git"; DirectoryName = "ShaguTweaks" }
)

# Loop through each repository in the array

Write-Output "Started cloning into $targetDirectory."

foreach ($repoInfo in $repositories) {
    $repoUrl = $repoInfo.Url
    $directoryName = $repoInfo.DirectoryName

    # Clone the repository into the current directory
    $clonePath = Join-Path -Path $targetDirectory -ChildPath $directoryName
    git clone $repoUrl $clonePath
}

Write-Output "Repositories cloned into $targetDirectory."
