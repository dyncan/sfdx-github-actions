
ORG_ALIAS="DevHub"

echo "Deploying source to scratch org"
sfdx force:source:push -u $ORG_ALIAS

echo "Testing code in org"
sfdx force:apex:test:run --testlevel RunLocalTests --outputdir test-results --resultformat tap --targetusername $ORG_ALIAS