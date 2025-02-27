# Environment Setup for Healthcare Billing

This file contains instructions for setting up your environment to deploy and run the healthcare billing application on the Aleo testnet.

## Environment Variables

The application requires the following environment variables to be set in a `.env` file:

```
NETWORK=testnet3
PRIVATE_KEY=your_private_key_here
```

Where:
- `NETWORK`: The Aleo network to use (testnet3 is recommended)
- `PRIVATE_KEY`: Your Aleo account private key, which starts with "APrivateKey1"

## How to Use

1. Create a `.env` file in the root directory of this project
2. Add the environment variables as shown above
3. Replace `your_private_key_here` with your actual Aleo private key
4. Never share your private key with anyone or commit it to a public repository

## Deployment

When deploying the application, the system will use these environment variables to:
1. Connect to the specified network
2. Sign transactions using your private key
3. Pay for transaction fees from your account

## Local Development

For local development and testing, you can use the same environment setup. 