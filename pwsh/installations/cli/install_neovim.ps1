# Neovim Installation Script

# Function for cleanup old Neovim installations
function Cleanup-Old-Neovim {
    Write-Host "Removing any old Neovim installations..." -ForegroundColor Cyan

    # Remove from Chocolatey if installed
    choco uninstall neovim -y | Out-Null

    # Remove leftover folders
    Remove-Item "$env:LOCALAPPDATA\nvim" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$env:LOCALAPPDATA\nvim-data" -Recurse -Force -ErrorAction SilentlyContinue

    # Remove manually installed binaries
    Remove-Item "C:\Program Files\Neovim" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "C:\tools\neovim" -Recurse -Force -ErrorAction SilentlyContinue

    Write-Host "Cleanup completed." -ForegroundColor Green
}

# Cleanup
Cleanup-Old-Neovim

# Install Neovim
Write-Host "Installing Neovim using `choco`..." -ForegroundColor Cyan

# Ensure Chocolatey exists
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not found! Please install Chocolatey first." -ForegroundColor Red
    exit 1
}

choco upgrade neovim -y --pre

$exitCode = $LASTEXITCODE

Write-Host "choco exit code: $exitCode"

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: Neovim installed successfully!" -ForegroundColor Green
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