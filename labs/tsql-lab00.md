# PowerShell Tutorial
# Cloud Application Development, MSSA

### Charles Carter
### Fort Benning, Georgia

##### August 1, 2018

# Essential Commands

1. exit, Exit
1. help, Get-Help
1. help.exe, output redirection operator (>)
1. Get-Help Get-Help, Get-Help <topic>
1. Start-Transcript -OutputDirectory <string>
1. Get-Command  
1. gal, Get-Alias
1. Get-History
1. Stop-Transcript

# Working Commands

1. dir ?< directoryname >
1. mkdir < directoryname >
1. cd < directoryname >
1. files: ".", ".."
1. creating files:
    1. notepad test1.txt
    1. & 'C:\Program Files\Notepad++\notepad++.exe' test2.txt
    1. Write-Output "this is test 3" > test3.txt
1. del <filename>
1. cd ..
1. rmdir < directoryname >
1. copy < source > < destination >
1. move < source > < destination >

# Exercise

Create the following directory structure:


    ISTA420
        README.md (file)
        .gitignore (file)
        Exercises (directory)
        Homework (directory)
        Labs (directory)
