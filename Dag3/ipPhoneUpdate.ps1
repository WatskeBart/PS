$users = Get-ADGroupMember IPPhoneTest

ForEach ($user in $users) {
    $fullUser = Get-ADUser $user
    $ipPhone = $fullUser.GivenName + "." + $fullUser.Surname + "@adatum.com"
    Set-ADUser $fullUser -Replace @{ipPhone="$ipPhone"}
}