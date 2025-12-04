# WSL2 Installation Script

Write-Host "Installing WSL2..." -ForegroundColor Cyan
wsl --install -d Ubuntu

$exitCode = $LASTEXITCODE

Write-Host "wsl exit code: $exitCode"

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: WSL2 installed successfully!" -ForegroundColor Green
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
