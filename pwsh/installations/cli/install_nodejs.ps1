# NodeJS with Yarn installation script

# Download and install Node.js:
choco install nodejs -y --exact --version="24.11.1" 

$exitCode = $LASTEXITCODE

Write-Host "choco exit code: $exitCode"

# Evaluate the exit code
switch ($exitCode) {
    0 {
        Write-Host "Success: Node.js installed successfully!" -ForegroundColor Green
        # Verify the Node.js version:
        node -v # Should print "v24.11.1".

        # Download and install Yarn:
        corepack enable yarn

        # Verify Yarn version:
        yarn -v
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

