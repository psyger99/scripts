# SOURCED FUNCTIONS
. C:\Users\rainer\Documents\PowerShell\script-helper\Get-FolderSize.ps1
. C:\Users\rainer\Documents\PowerShell\script-helper\whereis.ps1
. C:\Users\rainer\Documents\PowerShell\script-helper\which.ps1

# SHELL INITIALIZATION
# oh-my-posh init pwsh --config 'C:\Users\rainer\Documents\PowerShell\jblab2021.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\rainer\Documents\PowerShell\my_theme.omp.json' | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# IMPORT MODULES
Import-Module Terminal-Icons
