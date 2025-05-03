$firstName = Read-Host "Enter the first name of the user"
$lastName = Read-Host "Enter the last name of the user"
$displayName = "$firstName $lastName"
$path = "OU=Finance,DC=home,DC=lab"
$upn = $firstName + "." + $lastName + "@domain.org"
$password = Read-Host "Enter the password for the user" -AsSecureString


$params = @{
    AccountPassword = $password
    Path = $path
    Enabled = $true
    UserPrincipalName = $upn
    name = $displayName
    GivenName = $firstName
    Surname = $lastName
    department = "Finance"
    streetaddress = "1234 Main St"
    City = "Seattle"
    State = "WA"
    PostalCode = "98101"
    Country = "USA"
    Office = "Seattle HQ"
    
}
if ($password.Length -lt 8) {
    Write-Error "Password must be at least 8 characters long."
    exit
} else {
    New-AdUser @params
}
