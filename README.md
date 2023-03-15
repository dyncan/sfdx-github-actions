## Getting Started

1. You first need to create a certificate and key to authenticate with. To do this you can run the script in `build/generate-keys.sh`

    * Follow the prompts when creating the certificate files
    * Take note of the Base64 output, as you will need this to set up Github Actions later

2. You will need to create a connected app in your production (and any sandboxes you wish to use CI with)

    * First, from Setup, enter App in the Quick Find box, then select App Manager. Click New Connected App.
    * Give your application a name such as 'GitHub Actions CI' 
    * Make sure you check `Enable OAuth Settings` in the connected app
    * Set the OAuth callback to `http://localhost:1717/OauthRedirect`
    * Check `Use Digital Signatures` and add your certificate file (`server.crt`), this will be in the `build/` folder. Once you have done this delete this file
    * Select the required OAuth scopes
    * Make sure that `refresh` is enabled - otherwise you'll get this error: `user hasn't approved this consumer`
    * Ensure that `Admin approved users are pre-authorized` under `Permitted Users` is selected
    * Ensure that you allow the `System Administrator` profile is selected under the `Profiles` related list
    * Take note of the `Consumer Key` as you will need it for Github Actions

3. You now can set up your Github Actions build

    * Click the gear icon next to the repository name on the left hand side of the screen
    * In the settings screen, choose `Environment Variables` you will need to add three variables by clicking `Add Variable`  

        + `SFDC_SERVER_KEY` is the Base64 output generated in Step 1  
        + `SFDC_PROD_CLIENTID` is the `Consumer Key` from Step 2  
        + `SFDC_PROD_USER` is the user to use with Github Actions  

You are now ready to build your salesforce projects with Github Actions!