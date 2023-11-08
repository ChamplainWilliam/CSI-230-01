cd "C:\Users\champuser\Desktop\CSI-230-01"

$filesToLookAt = Get-ChildItem -Recurse -Filter *.bash
for ($i=0; $i -lt $filesToLookAt.Length; $i++)
{
   Get-Content $filesToLookAt[$i].FullName | Measure-Object -Word -Line
}
Get-ChildItem | Measure-Object -Property length -Minimum -Maximum -Sum -Average | Out-String
