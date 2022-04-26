$Username ="companyname.local\administrator"

$secret = "<type_here_secret_password>"

$Password = ConvertTo-SecureString $secret -AsPlainText -Force

$psCred = New-Object System.Management.Automation.PSCredential($Username , $Password)

Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools

Install-ADDSDomainController -SafeModeAdministratorPassword $Password -InstallDns -Credential $psCred  -DomainName "companyname.local" -Confirm:$false