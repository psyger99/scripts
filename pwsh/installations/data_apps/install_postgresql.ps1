# PostgreSQL 18 Installation Script

Write-Host "Installing PostgreSQL using `winget`..." -ForegroundColor Cyan
winget install --id=PostgreSQL.PostgreSQL.18 -e --source winget

$exitCode = $LASTEXITCODE

Write-Host "winget exit code: $exitCode"

switch ($exitCode) {
    0 {
        Write-Host "Success: PostgreSQL installed successfully!" -ForegroundColor Green
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