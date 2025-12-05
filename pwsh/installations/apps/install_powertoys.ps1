# Powertoys Installation Script

Write-Host "Installing PowerToys using `winget`..." -ForegroundColor Cyan
winget install --id Microsoft.PowerToys -e --source winget

$exitCode = $LASTEXITCODE

Write-Host "winget exit code: $exitCode"

# Evaluate the exit code 
switch ($exitCode) {
    0 {
        Write-Host "Success: PowerToys installed successfully!" -ForegroundColor Green
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