# api key = AIzaSyDXfJnCM7Wa-bI2nLg4j7kjSDLzVKT11HM
# search engine html = {
    #<script async src="https://cse.google.com/cse.js?cx=e118e6391c8a44b36">
#</script>
#<div class="gcse-search"></div>
#}

function dockercontainer() {

}

$apikey = 'AIzaSyDXfJnCM7Wa-bI2nLg4j7kjSDLzVKT11HM'
$cseID = 'e118e6391c8a44b36'
$query = 'docker adminer' # Replace with what you want to search

# Construct the URL
$url = "https://www.googleapis.com/customsearch/v1?q=$query&key=$apiKey&cx=$cseID"

# Send the request
$response = Invoke-RestMethod -Uri $url

# Process the result
if ($response.items) {
    Write-Host $response.items[0].link
} else {
    Write-Host "No results found."
}



####################################################################################