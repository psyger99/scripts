# HwInfo64 Installation Script

Write-Host "Installing HwInfo64 using 'choco'..." -ForegroundColor Cyan
choco upgrade hwinfo.install -y

$exitCode = $LASTEXITCODE

Write-Host "choco exit code: $exitCode"

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: HwInfo64 installed successfully!" -ForegroundColor Green
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