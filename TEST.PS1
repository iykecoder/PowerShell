$x = Read-Host "Enter Number "

if($x -eq 1) {
    Write-Host "YAY"
}
else {
    Write-Host "NAY"
}

$x = 1..5

foreach ($i in $x) {
    Write-Host $x
}

Write-Host "Third Commit"