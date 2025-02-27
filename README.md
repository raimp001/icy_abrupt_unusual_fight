# Healthcare Billing System on Aleo

This project implements a healthcare billing system on the Aleo blockchain, enabling private and secure management of patient records, medical bills, and payment processing.

## Features

- **Patient Management**: Register and manage patient records with insurance information
- **Bill Creation**: Generate medical bills with service codes
- **Payment Processing**: Process payments for medical bills with automatic status updates
- **Dispute Handling**: Mark bills as disputed and resolve disputes with updated amounts

## Structures

- `PatientRecord`: Stores patient information including ID, insurance ID, and active status
- `MedicalBill`: Represents a medical bill with amount, service code, and payment status
- `Payment`: Records payment information including amount and timestamp

## Functions

- `register_patient`: Creates a new patient record
- `create_bill`: Generates a new medical bill for a patient
- `process_payment`: Processes a payment for a bill and updates its status
- `dispute_bill`: Marks a bill as disputed
- `resolve_dispute`: Resolves a disputed bill with a potentially adjusted amount

## Usage

### Compile the Program

```bash
leo build
```

### Run Program with Sample Inputs

Register a patient:
```bash
leo run register_patient --inputs healthcare_billing/inputs/register_patient.in
```

Create a medical bill:
```bash
leo run create_bill --inputs healthcare_billing/inputs/create_bill.in
```

### Deploy to Aleo Network

```bash
leo deploy
```

## Privacy Features

This healthcare billing system leverages Aleo's privacy features to ensure:

- Patient data confidentiality
- Medical billing information privacy
- Secure payment processing
- Regulatory compliance (HIPAA-compatible design)

## License

MIT
