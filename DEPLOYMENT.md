# Deployment Guide for Healthcare Billing

This guide provides step-by-step instructions for deploying the Healthcare Billing application to the Aleo testnet.

## Prerequisites

1. An Aleo account with testnet funds
2. Environment set up according to README.env.md
3. Leo installed locally or access to Leo Playground

## Deployment Options

### Option 1: Using Leo Playground (Recommended)

1. **Access the Leo Playground**:
   - Go to [https://play.leo-lang.org](https://play.leo-lang.org)

2. **Set Up Your Account**:
   - Click on "Account" in the left sidebar
   - Enter your private key and verify your address appears correctly

3. **Create a New Project**:
   - Click on "Project" > "Create New"
   - Name your project "healthcare_billing"

4. **Add Your Code**:
   - Copy the entire contents of `src/main.leo` into the editor

5. **Configure Environment**:
   - Click on "Environment" and select "Network" tab
   - Choose "Testnet" as your network

6. **Deploy Your Program**:
   - Click on "Deploy" in the sidebar
   - Enter "healthcare_billing" as the Program ID
   - Enter your private key or ensure it's already loaded
   - Set an appropriate fee
   - Click "Deploy"
   - Save the transaction ID for reference

7. **Execute a Function**:
   - Click on "Execute" in the sidebar
   - Select the function you want to run (e.g., "register_patient")
   - Enter inputs in JSON format (e.g., `["12345u64", "67890u64"]`)
   - Click "Execute"
   - Save the execution transaction ID

### Option 2: Using Command Line (Advanced)

If you have the Aleo CLI installed:

1. **Install Aleo CLI**:
   ```bash
   cargo install snarkos
   ```

2. **Deploy the Program**:
   ```bash
   cd healthcare_billing
   snarkos developer deploy healthcare_billing.aleo --private-key YOUR_PRIVATE_KEY --query https://api.testnet3.aleo.org/v1 --broadcast https://api.testnet3.aleo.org/v1/transaction/broadcast
   ```

3. **Execute a Function**:
   ```bash
   snarkos developer execute healthcare_billing.aleo register_patient 12345u64 67890u64 --private-key YOUR_PRIVATE_KEY --query https://api.testnet3.aleo.org/v1 --broadcast https://api.testnet3.aleo.org/v1/transaction/broadcast
   ```

## Verification

After deployment, verify your program is deployed correctly by:

1. Checking the transaction on an Aleo explorer
2. Executing a simple function and checking the results
3. Making sure all program features work as expected

## Troubleshooting

If you encounter issues:

1. Ensure you have sufficient funds in your Aleo account
2. Verify the network endpoint is accessible
3. Check that your program compiles correctly locally before deployment
4. Try increasing the fee if transactions fail to be included in blocks 