# set-all-windows-of-a-process-on-top

A PowerShell script that sets all windows of a process "on top".

## Usage

### Clone The Project

```
git clone https://github.com/taljacob2/process-on-top
```

### Run

Open *powershell.exe* and run:
```
.\set-all-windows-of-a-process-on-top.ps1 -ProcessName <ProcessName>
```

In case you encouter an error, try running with:
```
powershell.exe -NoLogo -ExecutionPolicy Bypass -Command ".\set-all-windows-of-a-process-on-top.ps1 -ProcessName <ProcessName>"
```

## Help

To view the full documentation of the script, open *powershell.exe* and run:
```
Get-Help .\run-process-on-top.ps1 -Full
```