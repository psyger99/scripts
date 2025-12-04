function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Source -ErrorAction SilentlyContinue |
        Where-Object { $_ } |
        Sort-Object -Unique
}
