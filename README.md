# process-on-top

A PowerShell script that runs / sets a process window(s) on top.

## Usage

### Clone The Project

```
git clone https://github.com/taljacob2/process-on-top
```

### Run

Open *powershell.exe* and run:
```
.\run-process-on-top.ps1 -ProcessPath <ProcessPath>
```

In case you encouter an error, try running with:
```
powershell.exe -NoLogo -ExecutionPolicy Bypass -Command ".\run-process-on-top.ps1 -ProcessPath <ProcessPath>"
```

## Help

To view the full documentation of the script, open *powershell.exe* and run:
```
Get-Help .\run-process-on-top.ps1 -Full
```