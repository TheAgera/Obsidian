switch ($Division) {
  "WIG"{
    switch ($Department) {
      "Engineering" {
        # If the division is WIG and the department is Engineering
        $Path = "OU=Engineering,OU=WIG,OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=comm"
      }
      "Sales" {
        # If the division is WIG and the department is Sales
        $Path = "OU=Sales,OU=WIG,OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=com"
      }
      "Service" {
        # If the division is WIG and the department is Service
        $Path = "OU=Service,OU=WIG,OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=com"
      }
      "PM" {
        # If the division is WIG and the department is PM
        $Path = "OU=Project Management,OU=WIG,OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=com"
      }
      "Management" {
        # If the division is WIG and the department is Management
        $Path = "OU=Management,OU=WIG,OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=com"
      }
    }
  }
  "AIP" {
    switch ($Department) {  
    "Engineering" {
      # If the division is WIG and the department is Engineering
      $Path = "OU=Engineering,OU=AIP,OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=comm"
    }
    "Management" {
      # If the division is WIG and the department is Sales
      $Path = "OU=Management,OU=AIP,OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=com"
    }
    "ProjectManagement" {
      # If the division is WIG and the department is Service
      $Path = "OU=Project Management,OU=AIP,OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=com"
    }
    "Sales" {
      # If the division is WIG and the department is PM
      $Path = "OU=Sales,OU=AIP,OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=com"
    }
    }
  }
  "Admin" {
    $Path = "OU=Admin,OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=com"
  }
}  

################################################################################################

function Get-Path($Division, $Department) {
    $base = "OU=Users,OU=CCI,OU=Companies,DC=CommerceControls,DC=comm"
    switch ($Division) {
        "WIG" {
            switch ($Department) {
                "Engineering" { "OU=Engineering,OU=WIG,$base" }
                "Sales" { "OU=Sales,OU=WIG,$base" }
                "Service" { "OU=Service,OU=WIG,$base" }
                "PM" { "OU=Project Management,OU=WIG,$base" }
                "Management" { "OU=Management,OU=WIG,$base" }
            }
        }
        "AIP" {
            switch ($Department) {
                "Engineering" { "OU=Engineering,OU=AIP,$base" }
                "Management" { "OU=Management,OU=AIP,$base" }
                "ProjectManagement" { "OU=Project Management,OU=AIP,$base" }
                "Sales" { "OU=Sales,OU=AIP,$base" }
            }
        }
        "Admin" {
            "OU=Admin,$base"
        }
    }
}

param(
    [String]$AccountPassword='defaultpassword', 
    [boolean]$ChangePasswordAtLogon= $true,
    [string]$City="Novi",
    [ValidateSet("WIG", "AIP", "Admin")]
    [string]$Division="",
    [ValidateSet("Engineering", "Sales", "Service", "PM", "Management", "ProjectManagement")]
    [string]$Department="",
    [string]$DisplayName="",
    [string]$Email="",
    [string]$FullName = "Test User",
    [string]$SamAccountName="",
    [string]$UserPrincipalName="",
    [string]$ProxyAddresses="",
    [string]$Surname="",
    [string]$GivenName=""
)

$names = $FullName.split(" ")
$GeneratedSamAccount = $names[0].Substring(0,1) + $names[1]
$Path = Get-Path $Division $Department

$paramsResult = @{}

if($AccountPassword -eq "defaultpassword") {
    $paramsResult["AccountPassword"] = ConvertTo-SecureString $AccountPassword -AsPlainText -Force
} else {
    $paramsResult["AccountPassword"] = $AccountPassword
}
$paramsResult["City"] = $City
$paramsResult["Company"] = $Company
$paramsResult["Country"] = $Country
$paramsResult["Department"] = $Department
$paramsResult["Description"] = $Description
if($DisplayName -eq "") {
    $paramsResult["DisplayName"] = $names[0] + " " + $names[1]
} else {
    $paramsResult["DisplayName"] = $DisplayName
}
$paramsResult["Division"] = $Division
if($Email -eq "") {
    $paramsResult["Email"] = $names[0].Substring(0,1) + $names[1] + "@commercecontrols.com"
} else {
    $paramsResult["Email"] = $Email
}
$paramsResult["EmployeeID"] = $EmployeeID
$paramsResult["Name"] = $FullName
if($GivenName -eq "") {
    $paramsResult["GivenName"] = $names[0]
} else {
    $paramsResult["GivenName"] = $GivenName
}
$paramsResult["Homepage"] = $Homepage
$paramsResult["HomePhone"] = $HomePhone
$paramsResult["Manager"] = $Manager
$paramsResult["Mobile"] = $Mobile
$paramsResult["Office"] = $Office
$paramsResult["OfficePhone"] = $OfficePhone
$paramsResult["PostalCode"] = $PostalCode
$paramsResult["State"] = $State
if($StreetAddress -eq "") {
    $paramsResult["StreetAddress"] = "1234 Elm Street"
} else {
    $paramsResult["StreetAddress"] = $StreetAddress
}
if($Surname -eq "") {
    $paramsResult["Surname"] = $names[1]
} else {
    $paramsResult["Surname"] = $Surname
}
if($SamAccountName -eq "") {
    $paramsResult["SamAccountName"] = $GeneratedSamAccount
} else {
    $paramsResult["SamAccountName"] = $SamAccountName
}
$paramsResult["Title"] = $Title
if($UserPrincipalName -eq "") {
    $paramsResult["UserPrincipalName"] = $names[0].Substring(0,1) + $names[1] + "@commercecontrols.com"
} else {
    $paramsResult["UserPrincipalName"] = $UserPrincipalName
}
$paramsResult["Path"] = $Path

try {
    New-ADUser @paramsResult -Enabled $false
    Set-ADUser $paramsResult.SamAccountName -ChangePasswordAtLogon $true 
    Set-ADUser $paramsResult.SamAccountName -add @{ProxyAddresses=$ProxyAddresses}
} catch {
    Write-Host "An error occurred: $_"
}