Set-StrictMode -version 2
Switch-AzureMode -Name AzureResourceManager

$subName = "Microsoft FTE"
$userName = "wade@wadewegnergmail.onmicrosoft.com"
$securePassword = ConvertTo-SecureString -String "PASSWORD" -AsPlainText -Force
$name = "WadeTest5"
$location = "West US"
$templateFile = "Template.json"
$siteName = $name + "Site"
$hostingPlanName = $name

$cred = New-Object System.Management.Automation.PSCredential($userName, $securePassword)
Add-AzureAccount -Credential $cred 

Select-AzureSubscription -SubscriptionName $subName
New-AzureResourceGroup -Name $name -Location $location -TemplateFile $templateFile -siteName $siteName -hostingPlanName $hostingPlanName -siteLocation $location -Force
 
Switch-AzureMode -Name AzureServiceManagement

Restart-AzureWebsite �Name $siteName
Restart-AzureWebsite �Name $siteName