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
leo run register_patient 12345u64 67890u64
```

Create a medical bill:
```bash
leo run create_bill 1001u64 12345u64 500000u64 9001u64
```

Process a payment:
```bash
leo run process_payment 5001u64 1001u64 "{bill_id: 1001u64, patient_id: 12345u64, amount: 500000u64, service_code: 9001u64, status: 0u8}" 300000u64 1677511234u64
```

### Deploy to Aleo Network

To deploy this program to the Aleo network, you'll need to:

1. Set up your environment with a funded Aleo account
2. Use the Aleo Playground (https://play.aleo.org) to deploy

## Integration with Other Leo Projects

This healthcare billing system can be integrated with other Leo projects in the following ways:

### As a Component in Larger Healthcare Systems

This program can serve as a billing module within a comprehensive healthcare management system that might include:
- Patient record management
- Appointment scheduling
- Medical records tracking
- Insurance verification

### Integration with Payment Systems

The payment processing functionality can integrate with:
- Aleo token transfer programs
- Multi-currency payment handlers
- Financial reporting systems

### API for External Applications

The structures and transitions in this program are designed to be called by external applications through:
- Web interfaces
- Mobile applications
- Other smart contracts

## Privacy Features

This healthcare billing system leverages Aleo's privacy features to ensure:

- Patient data confidentiality
- Medical billing information privacy
- Secure payment processing
- Regulatory compliance (HIPAA-compatible design)

## License

MIT
