# Lua and luarocks Installation Script

Write-Host "Installing Lua and luarocks using 'choco'..." -ForegroundColor Cyan
choco upgrade Lua luarocks -y --exact

$exitCode = $LASTEXITCODE

Write-Host "choco exit code: $exitCode"

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: Lua and luarocks installed successfully!" -ForegroundColor Green
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