// This is an example of how to integrate the healthcare_billing program with other Aleo programs

// Import the healthcare_billing program
import healthcare_billing.aleo;

// Example program that integrates with healthcare billing
program healthcare_integration.aleo {
    // An example structure for a healthcare provider
    struct HealthcareProvider {
        provider_id: u64,
        name: field,
        specialization: u64,
    }

    // An example structure for an insurance plan
    struct InsurancePlan {
        plan_id: u64,
        coverage_percent: u64,
        max_coverage: u64,
    }

    // Register a healthcare provider
    transition register_provider(
        provider_id: u64,
        name: field,
        specialization: u64
    ) -> HealthcareProvider {
        return HealthcareProvider {
            provider_id: provider_id,
            name: name,
            specialization: specialization,
        };
    }

    // Create a patient record and register it with the billing system
    transition register_patient_with_billing(
        patient_id: u64,
        insurance_id: u64
    ) -> healthcare_billing.aleo/PatientRecord {
        // Call the register_patient transition from the healthcare_billing program
        let patient_record: healthcare_billing.aleo/PatientRecord = healthcare_billing.aleo/register_patient(patient_id, insurance_id);
        return patient_record;
    }

    // Create a bill for a patient with insurance coverage calculation
    transition create_bill_with_insurance(
        bill_id: u64,
        patient_id: u64,
        provider_id: u64,
        original_amount: u64,
        insurance_plan: InsurancePlan,
        service_code: u64
    ) -> healthcare_billing.aleo/MedicalBill {
        // Calculate the amount after insurance
        let coverage_amount: u64 = 0u64;
        if (original_amount <= insurance_plan.max_coverage) {
            coverage_amount = (original_amount * insurance_plan.coverage_percent) / 100u64;
        } else {
            coverage_amount = (insurance_plan.max_coverage * insurance_plan.coverage_percent) / 100u64;
        }
        
        let patient_amount: u64 = original_amount - coverage_amount;
        
        // Create the bill with the patient's portion
        let bill: healthcare_billing.aleo/MedicalBill = healthcare_billing.aleo/create_bill(
            bill_id,
            patient_id,
            patient_amount,
            service_code
        );
        
        return bill;
    }
} 