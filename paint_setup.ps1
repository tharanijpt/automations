Add-Type -AssemblyName System.Windows.Forms

function Send-Keys($keys) {
    [System.Windows.Forms.SendKeys]::SendWait($keys)
    Start-Sleep -Milliseconds 100
}

# Start Paint
Start-Process mspaint
Start-Sleep -Seconds 1

# Select Fill tool
Send-Keys("%")
Send-Keys("t")
Send-Keys("f")

# Click in center to fill the page black
$wshell = New-Object -ComObject WScript.Shell
$wshell.AppActivate("Paint")
Start-Sleep -Milliseconds 500
[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(400, 300)
$mouse_event = Add-Type -MemberDefinition '[DllImport("user32.dll")] public static extern void mouse_event(int dwFlags, int dx, int dy, int cButtons, int dwExtraInfo);' -Name 'User32' -PassThru
$mouse_event::mouse_event(0x00000002, 0, 0, 0, 0) # Left mouse button down
$mouse_event::mouse_event(0x00000004, 0, 0, 0, 0) # Left mouse button up

# Navigate to color palette and select white
Send-Keys("+{TAB 3}")
Send-Keys("{DOWN}")
Send-Keys("{ENTER}")

# Select secondary color
Send-Keys("%2")

# Return to color palette and select black
Send-Keys("{TAB}")
Send-Keys("+{TAB}")
Send-Keys("{UP}")
Send-Keys("{ENTER}")

Send-Keys("%")
Send-Keys("l")

# Select Layer
Send-Keys("^(+{n})")
Send-Keys("%b")

Send-Keys("{TAB 4}")
Send-Keys("{UP}")
Send-Keys("{UP}")
Send-Keys("%1")


