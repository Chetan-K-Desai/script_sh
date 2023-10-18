# Set directory for installation - Chocolatey does not lock
# down the directory if not the default
$InstallDir='C:\ProgramData\chocoportable'
<<<<<<< HEAD
env:ChocolateyInstall="$InstallDir"
=======
#$env:ChocolateyInstall="$InstallDir"
>>>>>>> 50b9ad7e247d619b402fff9beb211efab70b6776

# If your PowerShell Execution policy is restrictive, you may
# not be able to get around that. Try setting your session to
# Bypass.
Set-ExecutionPolicy Bypass -Scope Process -Force;

# All install options - offline, proxy, etc at
# https://chocolatey.org/install
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
