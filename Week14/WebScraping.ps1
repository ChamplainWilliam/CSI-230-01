clear

$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://192.168.3.142/ToBeScraped.html

# Get a count of the links in the page
# $scraped_page.Links.href

# Display links as HTML Element
# $scraped_page.Links

# Display only URL and its text
# $scraped_page.Links | Select-Object outerText, href

# Get outer text of every element with the tag h2
$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") 

# for($i=0; $i -lt $h2s.Length; $i++){
# $h2s[$i].getElementsByTagName("a") | select `
# @{Name="h2 element"; Expression={$i}}, outerText, href
# }

# Print innerText of every div element that has the class as "div-1"
$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where { `
$_.getAttributeNode("class").Value -ilike "div-1"} | select innerText

# $divs1

#Get the contents of the table to an array
$trs=$scraped_page.ParsedHtml.body.getElementsByTagName("tr")

$multirow = @()
for($i=1; $i -lt $trs.length; $i++){
$tds=$trs[$i].getElementsByTagName("td")

$singlerow = @(
@{Row=$i; Employee=$tds[0].innerText; Department=$tds[1].innerText; `
Salary=$tds[2].innerText}
)
$multirow += $singlerow
}
# $multirow

# Using the array multirow, calculate the average salary of all employees.
$average=$multirow.Salary
# $average | Measure-Object -Average

# List the id values of all the div elements in this page
$ids=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | select id
$ids