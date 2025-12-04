# Yazi & Dependencies Installation Script

Write-Host "`n=== Installing Yazi ===" -ForegroundColor Cyan
winget install --id sxyazi.yazi --exact
Write-Host "Yazi installed." -ForegroundColor Green

# Optional Dependencies (Recommended)
$dependencies = @(
    "Gyan.FFmpeg"
    "7zip.7zip"
    "jqlang.jq"
    "oschwartz10612.Poppler"
    "sharkdp.fd"
    "BurntSushi.ripgrep.MSVC"
    "junegunn.fzf"
    "ajeetdsouza.zoxide"
    "ImageMagick.ImageMagick"
)

Write-Host "`n=== Installing Optional Dependencies ===" -ForegroundColor Cyan
winget install $dependencies --exact

# Capture exit code from the **last** winget call
$exitCode = $LASTEXITCODE
Write-Host "`nInstaller exit code: $exitCode"

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: Yazi and dependencies installed successfully!" -ForegroundColor Green
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
