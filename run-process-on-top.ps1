$ProcessNameToSetOnTop="cmd"

$Process = Start-Process -FilePath "$ProcessNameToSetOnTop" -PassThru

# # To run as administrator:
# $Process = Start-Process -FilePath "$ProcessNameToSetOnTop" -PassThru -Verb RunAs

$User32 = Add-Type -Debug:$False -MemberDefinition '
    [DllImport("user32.dll")]
    public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter,
                                           int X,int Y, int cx, int cy,
                                           uint uFlags);
' -Name "User32Functions" -namespace User32Functions -PassThru

[Void]$User32::SetWindowPos($Process.MainWindowHandle, -1, 0, 0, 0, 0, 0x53)

# Bibliography:
# See https://stackoverflow.com/a/73319269/14427765
