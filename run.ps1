$files = [System.Collections.ArrayList](Get-ChildItem -Name -File)
$files.Remove($MyInvocation.MyCommand.Name)

foreach($file in $files)
{
    $filePath = Join-Path -ChildPath $file  -Path "."
    $extension = $filePath.Split(".")[-1]
    $folderPath = Join-Path -ChildPath $extension -Path "."
    if(!(Test-Path -Path $folderPath))
    {
       New-Item -Path $folderPath -ItemType "directory"
    }
    if(Test-Path -Path $filePath)
    {
        Move-Item -Path $filePath -Destination $folderPath
    }
    
}