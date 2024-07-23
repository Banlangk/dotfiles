# Aliases
Set-Alias touch New-Item
Set-Alias which Get-Command

# Functions
function dotfiles {
    git --git-dir=$HOME\.dotfiles --work-tree=$HOME $args
}

function ld {
    Get-ChildItem -Force -Directory | Where-Object { -not $_.Attributes.HasFlag([System.IO.FileAttributes]::System) }
}
function lf {
    Get-ChildItem -Force -File | Where-Object { -not $_.Attributes.HasFlag([System.IO.FileAttributes]::System) }
}
function ll {
    Get-ChildItem -Force | Where-Object { -not $_.Attributes.HasFlag([System.IO.FileAttributes]::System) }
}

# Settings
$OutputEncoding = [Console]::OutputEncoding = [Console]::InputEncoding = [System.Text.UTF8Encoding]::new()
$PSStyle.FileInfo.Directory = $PSStyle.Foreground.Blue

# fnm
fnm env --use-on-cd | Out-String | Invoke-Expression

# PSReadLine
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -PredictionSource History

# PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# starship
Invoke-Expression (&starship init powershell)

# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
