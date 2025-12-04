# Steam Installation Script

Write-Host "Installing Steam..." 
winget install --id=Valve.Steam -e --source winget  

$exitCode = $LASTEXITCODE

Write-Host "Steam installation exit code: $exitCode"

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: Steam installed successfully!" -ForegroundColor Green
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