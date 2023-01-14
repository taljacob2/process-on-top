<#
  .DESCRIPTION
  A script that sets all existing windows of a process "on top".

  .PARAMETER ProcessName
  Specify the name to the target process that has running windows, that you wish to set "on top".

  .INPUTS
  None. You cannot pipe objects to this script.

  .OUTPUTS
  Sets all windows of a given `Process` to be positioned "on top".

  .NOTES
  MIT License
  Author: Tal Jacob

  .EXAMPLE
  PS> .\set-all-windows-of-a-process-on-top.ps1 -ProcessName cmd

  .EXAMPLE
  PS> .\set-all-windows-of-a-process-on-top.ps1 -ProcessName notepad

  .LINK
  Online version: https://github.com/taljacob2/process-on-top
#>

param ([parameter(mandatory)][string]$ProcessName)

$User32 = Add-Type -Debug:$False -MemberDefinition '
    [DllImport("user32.dll")]
    public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter,
                                           int X,int Y, int cx, int cy,
                                           uint uFlags);
' -Name "User32Functions" -namespace User32Functions -PassThru

$ProcessHandleArray = (Get-Process -Name "$ProcessName").MainWindowHandle

foreach ($processHandle in $ProcessHandleArray)
{
  [Void]$User32::SetWindowPos($processHandle, -1, 0, 0, 0, 0, 0x53)
}

# Bibliography:
# See https://stackoverflow.com/a/73319269/14427765
