--Parent--
# CPE Inventory Management

--Parent--
## 1. Overview

--Parent--
### 1.1 Terminology
--Child--
- **CPE (Customer Premises Equipment):** Also known as an *edge device* — equipment located at the customer premises.  
--Child--
- **ME (Managed Entity):** Represents a CPE in the Opslab data model.  
--Child--
- **Inventory:** A detailed list of CPE devices. An inventory can be represented by a structured file, such as a CSV format.  

--Parent--
### 1.2 Purpose
--Child--
The goal of the *CPE Inventory Management* feature is to enable users to **bulk import customer devices** (CPEs) and automatically generate the corresponding tunnel golden configurations — all **without service disruption**.

---

--Parent--
## 2. User Experience

--Parent--
### 2.1 User Story
--Child--
> As a user, I must be able to bulk import a group of edge devices to avoid manual onboarding of each and every CPE.

--Parent--
### 2.2 Expected Outcome
--Child--
- Users can upload a CSV file containing multiple CPE entries.  
--Child--
- The system automatically creates and configures each CPE.  
--Child--
- All imported devices appear under the customer's inventory.  
--Child--
- Configuration is generated without any service disruption.

---

--Parent--
## 3. Functional Requirements

--Parent--
### 3.1 Import CPE Inventory
--Child--
The **Import CPE Inventory** OpsKit should be extended to support importing the following additional fields from the CSV file:

--Child--
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

--Child--
> **Note:** The IP address and external interface fields are mandatory and must be present in the CSV file.

---

--Parent--
## 4. Implementation Details (Backend)

--Parent--
### 4.1 Workflow
--Child--
For each entry in the imported CSV file:
--Child--
1. Create a new **CPE** in the Opslab system.  
--Child--
2. Generate configuration variables for the following fields:
   - Address  
   - City  
   - Country  
   - Longitude  
   - Latitude  
   - Custom  
--Child--
3. Associate the CPE with the correct customer location.  
--Child--
4. Apply auto-generated tunnel golden configurations.

--Child--
> **Note:** The CPE IP address and external interface are required for proper configuration.

--Parent--
### 4.2 Managed Entity (ME) Creation
--Child--
A **Managed Entity (ME)** named **“Inventory”** will be automatically added to the customer location. This ME will represent the imported set of CPEs.

---

--Parent--
## 5. Summary
--Child--
The *CPE Inventory Management* enhancement enables efficient bulk onboarding of edge devices, improving operational scalability and eliminating manual configuration steps. The system ensures all imported devices are represented as Managed Entities with complete metadata and valid configurations.
