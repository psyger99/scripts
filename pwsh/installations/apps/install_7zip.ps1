# 7Zip Installation Script

Write-Host "Installing 7Zip using 'choco'..." -ForegroundColor Cyan
choco upgrade 7Zip -y --exact

$exitCode = $LASTEXITCODE

Write-Host "choco exit code: $exitCode"

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: 7Zip installed successfully!" -ForegroundColor Green
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