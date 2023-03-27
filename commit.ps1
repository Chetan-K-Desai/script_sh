# Set the working directory to the location of the repository
$repoPath = "C:\path\to\repo"
#cd $repoPath

# Get the list of commits and their timestamps
$commits = git log --format="%H %ct" --no-merges

# Calculate the lead time to change for each commit
foreach ($commit in $commits) {
    $commitHash, $commitTime = $commit.Split(" ")
    $leadTime = git log --pretty=format:"%ct" -n 1 $commitHash | %{($_ - $commitTime) / 60}
    Write-Output "Commit $commitHash : Lead time to change = $leadTime minutes"
}

