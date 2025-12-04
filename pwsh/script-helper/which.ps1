function which ($command) {
    $cmd = Get-Command -Name $command -ErrorAction SilentlyContinue

    if (-not $cmd) {
        Write-Output "Command not found: $command"
        return
    }

    $cmd.Source
}
