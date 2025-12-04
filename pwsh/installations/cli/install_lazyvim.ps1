# LazyVim Installation Script

Write-Host "Backing up current Neovim Files..." -ForegroundColor Cyan
# Required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# Optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

Write-Host "Cloning Lazyvim starter..." -ForegroundColor Cyan
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim

Write-Host "Removing .git folder..." -ForegroundColor Cyan
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

Write-Host "Installing C-compiler using `winget`..." -ForegroundColor Cyan
winget install --id=BrechtSanders.WinLibs.POSIX.UCRT -e

Write-Host "Installation complete!" -ForegroundColor Green
Write-Host "Opening Neovim now..." -ForegroundColor Cyan
nvim