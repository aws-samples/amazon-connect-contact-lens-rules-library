param (
    [string]$InstanceId = $(throw "-InstanceId is required.")
)

git clone https://github.com/rykohler/amazon-connect-contact-lens-rules-library.git   
cd ./amazon-connect-contact-lens-rules-library/

# Enumerate all directories
$dirs = Get-ChildItem -Directory

# Display directories and prompt for input
$dirs | ForEach-Object -Begin { $counter = 1 } -Process {
    Write-Host "$counter. $($_.Name)"
    $counter++
}
$selectedDirs = Read-Host "Enter the number(s) of the directories you want to select (comma-separated)"

# Convert input to array of numbers
$selectedDirs = $selectedDirs -split ',' | ForEach-Object { [int]$_ }

foreach ($index in $selectedDirs) {
    $dir = $dirs[$index-1] # arrays are 0-indexed
    cd $dir.FullName

    # Enumerate all the .json files that include the rule details
    $files = Get-ChildItem *.json -recurse | Select-Object FullName

    foreach ($file in $files) {
        # Added the trim function because one of the json files had a blank line in line 1 and made the command fail.
        $RuleInput = gc $file.FullName | Where-Object {$_.trim() -ne ""}
        # convert the JSON to an Object so we can send it through the pipeline and not have to set every single variable.
        $ruleObject = $ruleInput | ConvertFrom-JSON
        # had to specify the event source name value because it wasn't getting caught in the pipeline.
        $ruleObject | New-ConnRule -instanceid $instanceId -TriggerEventSource_EventSourceName $ruleObject.TriggerEventSource.EventSourceName
    }

    cd ..
}
