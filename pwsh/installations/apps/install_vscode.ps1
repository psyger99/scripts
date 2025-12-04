# VSCode Installation Script

Write-Host "Installing Visual Studio Code..." -ForegroundColor Cyan
winget install --id=Microsoft.VisualStudioCode -e --source winget

$exitCode = $LASTEXITCODE

Write-Host "VSCode installation exit code: $exitCode"

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: Visual Studio Code installed successfully!" -ForegroundColor Green
        Exit 0
    }
    default {
        Write-Host "Error: Installation failed with exit code $exitCode" -ForegroundColor Red
        Exit $exitCode
    }
}