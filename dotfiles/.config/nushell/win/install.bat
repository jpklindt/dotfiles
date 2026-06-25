echo Installing nushell dependencies and config linker...

winget install junegunn.fzf
winget install Nushell.Nushell
winget install Starship.Starship
winget install eza-community.eza
winget install ajeetdsouza.zoxide
winget install rsteube.Carapace
winget install sharkdp.bat
winget install chocolatey

C:\ProgramData\chocolatey\bin\choco.exe install nodejs-lts --version="22.11.0"

node install mdpdf

xcopy /s .\config.nu %userprofile%\AppData\Roaming\nushell\

echo done
