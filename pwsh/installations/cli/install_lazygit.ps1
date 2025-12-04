# LazyGit Installation Script

Write-Host "Installing LazyGit using 'winget'..." -ForegroundColor Cyan
winget install --id=JesseDuffield.lazygit -e --silent 

$exitCode = $LASTEXITCODE

Write-Host "winget exit code: $exitCode"

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: LazyGit installed successfully!" -ForegroundColor Green
        Exit 0
    }
    3010 {
        Write-Host "Warning: Installation completed, but a reboot is required." -ForegroundColor Yellow
        Exit 3010
    }
    default {
        Write-Host "Error: Installation failed with exit code $exitCode" -ForegroundColor Red
        Exit $exitCode
    }
}
