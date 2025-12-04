<#
.SYNOPSIS
Calculates the total size of a specified folder, including all subdirectories and files.

.DESCRIPTION
This function uses Get-ChildItem -Recurse to find all files within the given path,
sums their 'Length' property, and formats the result in Bytes, Megabytes (MB), and Gigabytes (GB).

.PARAMETER Path
The path to the folder you want to measure. Accepts pipeline input.
Defaults to the current location if no path is provided.

.EXAMPLE
Get-FolderSize -Path "C:\MyProject"

.EXAMPLE
"C:\Windows\System32" | Get-FolderSize

.EXAMPLE
gfs C:\Users | gfs .venv
#>
function Get-FolderSize {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false, ValueFromPipeline=$true)]
        [string]$Path = (Get-Location).Path
    )

    begin {
        Write-Host "Calculating folder size..." -ForegroundColor Cyan
    }

    process {
        try {
            # Ensure the path exists and is a directory
            $item = Get-Item -Path $Path -ErrorAction Stop
            if (-not $item.PSIsContainer) {
                Write-Error "Path '$Path' is not a container (folder)."
                return
            }

            # 1. Get all child items recursively and force hidden/system files to be included
            # 2. Select only files (where PSIsContainer is $false)
            # 3. Measure the sum of the 'Length' property (file size in bytes)
            $SizeInBytes = Get-ChildItem -Path $Path -Recurse -Force -ErrorAction Stop |
                           Where-Object { -not $_.PSIsContainer } |
                           Measure-Object -Property Length -Sum

            # Extract the total sum (which is in bytes)
            $TotalBytes = $SizeInBytes.Sum
            if (-not $TotalBytes) {
                $TotalBytes = 0
            }

            # Calculate and format the sizes
            $TotalMB = $TotalBytes / 1MB
            $TotalGB = $TotalBytes / 1GB

            # Create a custom object for clean output
            [PSCustomObject]@{
                Path        = $Path
                Size_Bytes  = $TotalBytes
                Size_MB     = "{0:N2} MB" -f $TotalMB
                Size_GB     = "{0:N2} GB" -f $TotalGB
            }

        }
        catch {
            Write-Error "Error processing path '$Path': $($_.Exception.Message)"
        }
    }
}

# Add an alias for quick use
Set-Alias -Name gfs -Value Get-FolderSize -Description "Alias for Get-FolderSize"
