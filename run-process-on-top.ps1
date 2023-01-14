<#
  .DESCRIPTION
  A script that starts a process "on top".

  .PARAMETER ProcessPath
  Specify the path to the target process, that you wish to start "on top".

  .INPUTS
  None. You cannot pipe objects to this script.

  .OUTPUTS
  A new `Process` that is positioned "on top".

  .NOTES
  MIT License
  Author: Tal Jacob

  .EXAMPLE
  PS> .\run-process-on-top.ps1 -ProcessPath cmd

  .EXAMPLE
  PS> .\run-process-on-top.ps1 -ProcessPath notepad

  .EXAMPLE
  PS> .\run-process-on-top.ps1 -ProcessPath C:\Windows\System32\cmd.exe

  .LINK
  Online version: https://github.com/taljacob2/process-on-top
#>

param ([parameter(mandatory)][string]$ProcessPath)

$Process = Start-Process -FilePath "$ProcessPath" -PassThru

# # To run as administrator:
# $Process = Start-Process -FilePath "$ProcessPath" -PassThru -Verb RunAs

$User32 = Add-Type -Debug:$False -MemberDefinition '
    [DllImport("user32.dll")]
    public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter,
                                           int X,int Y, int cx, int cy,
                                           uint uFlags);
' -Name "User32Functions" -namespace User32Functions -PassThru

[Void]$User32::SetWindowPos($Process.MainWindowHandle, -1, 0, 0, 0, 0, 0x53)

# Bibliography:
# See https://stackoverflow.com/a/73319269/14427765
