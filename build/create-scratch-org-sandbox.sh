
ORG_ALIAS="DevHub"
SANDBOX_CERT_KEY = $1
SANDBOX_APP_KEY = $2
SANDBOX_USERNAME = $3

# Get the private key from the environment variable
echo "Setting up DevHub Connection..."
mkdir keys
echo $SANDBOX_CERT_KEY | base64 -d > keys/server.key

# Authenticate to salesforce
echo "Authenticating..."
sfdx force:auth:jwt:grant --clientid $SANDBOX_APP_KEY --jwtkeyfile keys/server.key --username $SANDBOX_USERNAME --setdefaultdevhubusername -a DevHub

#Delete previous scratch org
echo "Cleaning previous scratch org..."
sfdx force:org:delete -p -u $ORG_ALIAS

#Create a scratch org
echo "Creating the Scratch Org..."
sfdx force:org:create -f config/project-scratch-def.json -a $ORG_ALIAS -s