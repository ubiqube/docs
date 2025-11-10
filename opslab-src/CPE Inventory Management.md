# CPE Inventory Management

## 1. Overview

### 1.1 Terminology
- **CPE (Customer Premises Equipment):** Also known as an *edge device* — equipment located at the customer premises.  
- **ME (Managed Entity):** Represents a CPE in the Opslab data model.  
- **Inventory:** A detailed list of CPE devices. An inventory can be represented by a structured file, such as a CSV format.  

### 1.2 Purpose
The goal of the *CPE Inventory Management* feature is to enable users to **bulk import customer devices** (CPEs) and automatically generate the corresponding tunnel golden configurations — all **without service disruption**.

---

## 2. User Experience

### 2.1 User Story
> As a user, I must be able to bulk import a group of edge devices to avoid manual onboarding of each and every CPE.

### 2.2 Expected Outcome
- Users can upload a CSV file containing multiple CPE entries.  
- The system automatically creates and configures each CPE.  
- All imported devices appear under the customer's inventory.  
- Configuration is generated without any service disruption.

---

## 3. Functional Requirements

### 3.1 Import CPE Inventory
The **Import CPE Inventory** OpsKit should be extended to support importing the following additional fields from the CSV file:

| Field               | Description                          | Required |
|---------------------|--------------------------------------|-----------|
| Address             | Street address of the CPE location   | No        |
| City                | City where the CPE is located        | No        |
| Country             | Country of installation              | No        |
| Longitude           | Geographic longitude coordinate      | No        |
| Latitude            | Geographic latitude coordinate       | No        |
| Custom              | User-defined field for extra data    | No        |
| **IP Address**      | Device IP address                    | **Yes**   |
| **External Interface** | Network interface for connectivity | **Yes**   |

> **Note:** The IP address and external interface fields are mandatory and must be present in the CSV file.

---

## 4. Implementation Details (Backend)

### 4.1 Workflow
For each entry in the imported CSV file:
1. Create a new **CPE** in the Opslab system.  
2. Generate configuration variables for the following fields:
   - Address  
   - City  
   - Country  
   - Longitude  
   - Latitude  
   - Custom  
3. Associate the CPE with the correct customer location.  
4. Apply auto-generated tunnel golden configurations.

> **Note:** The CPE IP address and external interface are required for proper configuration.

### 4.2 Managed Entity (ME) Creation
A **Managed Entity (ME)** named **“Inventory”** will be automatically added to the customer location. This ME will represent the imported set of CPEs.

---

## 5. Summary
The *CPE Inventory Management* enhancement enables efficient bulk onboarding of edge devices, improving operational scalability and eliminating manual configuration steps. The system ensures all imported devices are represented as Managed Entities with complete metadata and valid configurations.
