# Terraform Module ReadMe

## Requirements

- Terraform v1.0 or later
- AWS account credentials
- Access to an existing EC2 key pair in the target region (or create a new one)

## Computer Setup

### Step 1: Installing Terraform

To install Terraform, follow the appropriate steps for your operating system:

#### Windows

1. Download the appropriate package for your system from the [Terraform downloads page](https://www.terraform.io/downloads.html).
2. Extract the downloaded archive to `$HOME\terraform`.
3. Open a command prompt and run `cd terraform`
4. Rrun `./terraform version` to verify that Terraform is installed and in your system's PATH.
5. Open the Windows start menu and type "Environment Variables".
6. Choose "Edit the system environment variables".
7. Click on the "Environment Variables" button.
8. Modify the PATH ariable to include the `$HOME\terraform` directory

#### Mac

1. Use [Homebrew](https://brew.sh/) to install Terraform: `brew install terraform`
2. Open a terminal and run `terraform version` to verify that Terraform is installed and in your system's PATH.

#### Linux

1. Follow the instructions for your specific Linux distribution on the [Terraform downloads page](https://www.terraform.io/downloads.html).
2. Extract the downloaded archive to a directory in your system's PATH.
3. Open a terminal and run `terraform version` to verify that Terraform is installed and in your system's PATH.

### Step 2: Creating AWS Account

1. Open your web browser and go to the AWS Management Console website at https://console.aws.amazon.com.
2. Click on the "Create a new AWS account" button. 
3. On the "Create a Free Account" page, select the "Personal" account type, depending on your needs. 
4. Fill in the required information, including your email address and a password for your AWS account. Make sure to choose a strong password. 
5. Read and accept the AWS Customer Agreement, as well as the AWS Service Terms, by checking the corresponding boxes. 
6. Choose the free Basic Plan for Support
7. Provide your contact information, including your name, address, and phone number. 
8. Enter your credit card information. AWS requires a valid credit card for account verification purposes. Note that certain services may incur charges, so make sure to monitor your usage and costs.
9. Review the information you provided and ensure everything is accurate. 
10. Click on the "Create Account and Continue" button.
11. AWS will now perform a verification process to confirm your identity. This may involve a phone call or SMS message verification. Follow the instructions provided to complete this step.

### Step 3: Generate AWS Keys

1. Sign in to the [AWS Management Console](https://console.aws.amazon.com/).
2. Click the drop down in the top right and select Security Credentials
3. In the "Access keys" section, choose "Create access key".
4. Save the access key ID and secret access key to a secure location on your computer, such as a password manager or encrypted file.

*NOTE:* This is using the root account for access keys. 

#### Windows

1. Open the Windows start menu and type "Environment Variables".
2. Choose "Edit the system environment variables".
3. Click on the "Environment Variables" button.
4. Under "System Variables", click "New".
5. Enter "AWS_ACCESS_KEY_ID" for the variable name and paste in the access key ID as the variable value.
6. Click "OK".
7. Click "New" again.
8. Enter "AWS_SECRET_ACCESS_KEY" for the variable name and paste in the secret access key as the variable value.
9. Click "OK".

#### Mac

1. Open a Terminal window.
2. Type `touch ~/.bash_profile` to create a new Bash profile.
3. Type `open ~/.bash_profile` to open the Bash profile in a text editor.
4. Add the following lines to the end of the file, replacing `ACCESS_KEY_ID` and `SECRET_ACCESS_KEY` with your actual access key ID and secret access key:

```
export AWS_ACCESS_KEY_ID=ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=SECRET_ACCESS_KEY
```

5. Save and close the file.
6. Type `source ~/.bash_profile` to reload the Bash profile.

#### Linux

1. Open a Terminal window.
2. Type `touch ~/.bash_profile` to create a new Bash profile.
3. Type `nano ~/.bash_profile` to open the Bash profile in a text editor.
4. Add the following lines to the end of the file, replacing `ACCESS_KEY_ID` and `SECRET_ACCESS_KEY` with your actual access key ID and secret access key:

```
export AWS_ACCESS_KEY_ID=ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=SECRET_ACCESS_KEY
```
5. Save and close the file.
6. Type `source ~/.bash_profile` to reload the Bash profile.

### Step 4: Generating SSH Keys

#### Windows

1. Ensure that OpenSSH is installed (https://phoenixnap.com/kb/generate-ssh-key-windows-10)
2. Open the Command Prompt by typing "cmd" in the Windows search bar and clicking on the "Command Prompt" application.
3. Type `ssh-keygen` and press enter.
4. Follow the prompts to specify the file name and location of the key pair.
5. Press enter twice to accept the default passphrase, or enter a new passphrase if desired.

#### Mac

1. Open the Terminal app by typing "Terminal" in the Spotlight search bar and clicking on the "Terminal" application.
2. Type `ssh-keygen` and press enter.
3. Follow the prompts to specify the file name and location of the key pair.
4. Press enter twice to accept the default passphrase, or enter a new passphrase if desired.

#### Linux

1. Open a terminal window.
2. Type `ssh-keygen` and press enter.
3. Follow the prompts to specify the file name and location of the key pair.
4. Press enter twice to accept the default passphrase, or enter a new passphrase if desired.

After generating the SSH key pair, you'll need to copy the public key to the clipboard so that you can paste it into the `public_key` variable in the Terraform module. To do this, follow these steps:

1. Open the terminal or command prompt where you generated the key pair.
2. Type `cat <public_key_file>` and press enter, replacing `<public_key_file>` with the name of the public key file you generated.
3. Highlight the entire output of the command, including the "ssh-rsa" header and the email address at the end.
4. Copy the highlighted text to the clipboard.

## Running the Lab

### Step 1: Initializing the Terraform Module

Once you have installed Terraform, follow these steps to initialize the module:

1. Clone or download the Terraform module from the repository.
2. Open a terminal and navigate to the root directory of the module.
3. Run `terraform init` to download any necessary dependencies.
4. Copy the public key that was generated earlier as the value on line 4 in the `main.tf` file
    * NOTE: With Windows you will need to remove the `domain\username` piece or you will recieve an error*
5. Update the public_key and AMI in the `main.tf` file.

### Step 2: Deploying the Infrastructure

Once you have initialized the module, follow these steps to deploy the infrastructure:

1. Open a terminal and navigate to the root directory of the module.
2. Run `terraform apply` to preview the changes that Terraform will make.
3. Review the changes and type `yes` when prompted to confirm the changes.
4. Wait for Terraform to provision the instances and output their public IP addresses.

### Step 3: Run the Lab

1. Run a `sudo apt-get update`
2. Run `sudo apt-install net-tools`
3. Refer to the lab manual

### Step 4: Destroying the Infrastructure

To tear down the infrastructure and release any associated resources, follow these steps:

1. Open a terminal and navigate to the root directory of the module.
2. Run `terraform destroy` to preview the changes that Terraform will make.
3. Review the changes and type `yes` when prompted to confirm the changes.
4. Wait for Terraform to destroy the instances and release any associated resources.

