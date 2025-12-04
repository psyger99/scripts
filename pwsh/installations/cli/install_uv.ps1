# UV Installation Script

Write-Host "Installing uv using 'winget'..." -ForegroundColor Cyan
winget install --id astral-sh.uv -e

$exitCode = $LASTEXITCODE
Write-Host "'winget' exit code: $exitCode" -ForegroundColor Blue

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: uv installed successfully!" -ForegroundColor Green
        exit 0
    }
    3010 {
        Write-Host "Warning: Installation completed but a reboot is required." -ForegroundColor Yellow
        exit 3010
    }
    default {
        Write-Host "Error: Installation failed with exit code $exitCode" -ForegroundColor Red
        exit $exitCode
    }
}
