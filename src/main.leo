// The 'healthcare_billing' program.
program healthcare_billing.aleo {
    // Define a structure for a patient record
    struct PatientRecord {
        patient_id: u64,
        insurance_id: u64,
        status: u8, // 0: inactive, 1: active
    }

    // Define a structure for a medical bill
    struct MedicalBill {
        bill_id: u64,
        patient_id: u64,
        amount: u64,
        service_code: u64,
        status: u8, // 0: unpaid, 1: partially paid, 2: fully paid, 3: disputed
    }

    // Define a structure for a payment
    struct Payment {
        payment_id: u64,
        bill_id: u64,
        amount: u64,
        timestamp: u64,
    }

    // Register a new patient
    transition register_patient(
        patient_id: u64,
        insurance_id: u64
    ) -> PatientRecord {
        return PatientRecord {
            patient_id: patient_id,
            insurance_id: insurance_id,
            status: 1u8, // Active by default
        };
    }

    // Create a new medical bill
    transition create_bill(
        bill_id: u64,
        patient_id: u64,
        amount: u64,
        service_code: u64
    ) -> MedicalBill {
        return MedicalBill {
            bill_id: bill_id,
            patient_id: patient_id,
            amount: amount,
            service_code: service_code,
            status: 0u8, // Unpaid by default
        };
    }

    // Process a payment for a bill
    transition process_payment(
        payment_id: u64,
        bill_id: u64,
        bill: MedicalBill,
        amount: u64,
        timestamp: u64
    ) -> (Payment, MedicalBill) {
        // Create the payment record
        let payment: Payment = Payment {
            payment_id: payment_id,
            bill_id: bill_id,
            amount: amount,
            timestamp: timestamp,
        };

        // Update the bill status based on the payment
        let new_status: u8 = 0u8;
        
        if (amount >= bill.amount) {
            new_status = 2u8; // Fully paid
        } else {
            new_status = 1u8; // Partially paid
        }

        // Return the updated bill with new status
        let updated_bill: MedicalBill = MedicalBill {
            bill_id: bill.bill_id,
            patient_id: bill.patient_id,
            amount: bill.amount,
            service_code: bill.service_code,
            status: new_status,
        };

        return (payment, updated_bill);
    }

    // Dispute a bill
    transition dispute_bill(
        bill: MedicalBill,
        reason_code: u64
    ) -> MedicalBill {
        // Mark the bill as disputed
        let disputed_bill: MedicalBill = MedicalBill {
            bill_id: bill.bill_id,
            patient_id: bill.patient_id,
            amount: bill.amount,
            service_code: bill.service_code,
            status: 3u8, // Disputed
        };

        return disputed_bill;
    }

    // Resolve a disputed bill
    transition resolve_dispute(
        bill: MedicalBill,
        new_amount: u64
    ) -> MedicalBill {
        // Update the bill with the new amount and set status to unpaid
        let resolved_bill: MedicalBill = MedicalBill {
            bill_id: bill.bill_id,
            patient_id: bill.patient_id,
            amount: new_amount,
            service_code: bill.service_code,
            status: 0u8, // Reset to unpaid
        };

        return resolved_bill;
    }
}
