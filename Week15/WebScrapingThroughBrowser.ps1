
$url = "https://classlist.champlain.edu/show/courses/semester/spring/type/dayevening"

# Start Internet Explorer Object
$ie = New-Object -ComObject internetexplorer.application
$ie.navigate($url)
while($ie.ReadyState -ne 4) {start-sleep -s 10}

$ie.visible=$true

$FullTable = @()

$trs=$ie.Document.getElementsByTagName("tr") # Get every row

for ($i = 1; $i -lt $trs.length; $i++){ # for every row
$tds = $trs[$i].getElementsByTagName("td") # Get every column

$FullTable += [pscustomobject]@{"Number" = $tds[0].innerText; `
                                 "Title" = $tds[1].innerText; `
                                  "Days" = $tds[4].innerText; `
                                 "Times" = $tds[5].innerText; `
                            "Instructor" = $tds[6].innerText; }
} # end of for loop
$ie.Quit()

# Get every CSI course
# $FullTable | select "Number", Instructor, Days, Times | where { $_.Number -ilike "CSI*" }

# Get every 200 level CSI course
# $FullTable | select "Number", Instructor, Days, Times | where { $_.Number -ilike "CSI 2*" }

# Every 300 level CSI course on Wednesdays
# $FullTable | select "Number", Instructor, Days, Times | where { `
# ($_.Number -ilike "CSI 3*") -and ($_.Days -ilike "*W") }

# Every CSI course taught by Staff
# $FullTable | select "Number", Title, Instructor, Days | where { `
# ($_.Number -ilike "CSI*") -and ($_.Instructor -ilike "*Staff") }

# Courses that include the string programming in the title
$FullTable | select "Number", Title, Instructor, Days | where {$_.Title -ilike "*Programming"}