--Parent--
# IPSEC Tunnel Commissioning
## 1. Terminology
--Child--
- **CPE (Customer Premises Equipment):** Edge devices located at the customer premises.  
--Child--
- **POP (Point of Presence):** A network location where traffic can be routed or tunneled.  
--Child--
- **SSE (Secure Service Edge) Vendor:** The service provider managing secure connectivity and network services (e.g., Netskope, Prisma Access).  
--Child--
- **ME (Managed Entity):** Represents a CPE or SSE vendor in the Opslab data model.  
--Child--
- **Failover:** Automatic switching to a backup tunnel if the primary tunnel fails.  
--Child--
- **IPSEC Tunnel:** A secure network tunnel using the IPSEC protocol for encrypted traffic between two endpoints.  
--Child--
- **OpsKit:** Automation toolkit used to deploy, configure, and manage network entities and tunnels.

---
--Parent--
## 2. Solution Overview
--Child--
### 2.1 Purpose
--Child--
Enable mass orchestration of IPSEC tunnels between CPEs and POPs, with built-in failover and high availability. The solution supports:

--Child--
- Seamless tunnel deployment, migration, and monitoring at scale.  
--Child--
- Dual-tunnel failover to ensure continuous service.  
--Child--
- Automated key management with secure pre-shared keys to eliminate manual errors.  
--Child--
- Visualization of established VPN tunnels on a network topology view.

--Child--
### 2.2 Key Features
--Child--
- Bulk deployment of CPE-to-POP tunnels.  
--Child--
- Optional failover mechanism for high availability.  
--Child--
- Graphical topology visualization for deployed tunnels.  
--Child--
- Support for multiple SSE vendors (Cisco, Prisma SDWAN, Fortigate).

---
--Parent--
## 3. Expected Product Behavior
--Child--
### 3.1 User Experience
--Child--
As a user, I must be able to:  
--Child--
- Bulk deploy tunnels between a group of edge devices and primary/secondary SSE POPs.  
--Child--
- Enable the failover option to automatically configure failover for selected CPEs.  
--Child--
- View deployment results on a graphical interface showing the VPN tunnel topology.

--Child--
### 3.2 Functional Requirements
--Child--
The **Create CPE to POP Tunnels OpsKit** must allow the user to select:
--Child--

- **SSE Vendor**  
- **POPs**: Primary and Secondary  
- **Failover option flag**  
- **List of edge devices**:
  - All CPEs  
  - Group filtered by City, Country, or Custom field  
  - Individual CPEs (Cherry Pick) 

--Child--
### 3.3 Acceptance Criteria
- Users can select edge device(s) and define a new POP pair.  
- VPN tunnels are established without errors.  
- Traffic is successfully routed through the tunnels.  
- Optional failover logic is correctly configured and tested.  
- Tunnels are displayed on the topology view.

---
--Parent--

## 4. Implementation Details
--Child--
### 4.1 Front-End
The OpsKit will support **flexible CPE selection**:
--Child--
- **Select all CPEs at once**  
--Child--
- **Filter by group** using:
  - City  
  - Country  
  - Custom field from CSV (dropdown with optional free-text)  
--Child--
- **Manually cherry-pick** individual CPEs  

--Child--
Users can view tunnel deployment progress and results on a graphical topology interface.

--Child--
### 4.2 Back-End
--Child--
- One **Managed Entity (ME)** per edge device.  
--Child--
- One **ME** per SSE vendor.  
--Child--
- Support for multiple vendors: Cisco, Prisma SDWAN, and Fortigate.  
--Child--
- Provision tunnels and failover logic based on vendor-specific workflows.

--Parent--
### 4.3 Workflow Details

--Child--
#### 4.3.1 User Input
Users choose the following in the automation catalog:
--Child--

| Parameter                   | Description |
|-------------------------------|------------|
| SSE Vendor                    | Netskope, Prisma Access, or Cisco/Fortigate SDWAN |
| Tunnel Type                   | IPSEC only |
| Primary and Secondary POPs    | POP selection for tunnel endpoints |
| Edge Devices                  | List of CPEs with external IP, external interface, failover flag |

--Child--
#### 4.3.2 Vendor Failover Comparison Table

--Child--
| Vendor          | Provision Order (Non-Failover) | Provision Order (Failover) | Failover Mechanism |
|-----------------|-------------------------------|---------------------------|------------------|
| **Cisco**       | Primary → Secondary           | Primary → Secondary       | IPSLA monitoring configured on both tunnels |
| **Fortigate**   | Primary → Secondary           | Primary → Secondary       | Static routes with distance and priority configured |
| **Prisma SDWAN**| Primary → Secondary           | Secondary → Primary       | Backup policy for primary tunnel to use secondary in case of failure |

--Child--
#### 4.3.3 Execution Flow
--Child--
For each edge site:

1. Provision SSE site (primary and backup POPs).  
2. Configure primary and secondary tunnels according to vendor-specific failover logic.  
3. Apply automated key management for all tunnels.  
4. Update topology view with deployed tunnel information.

---
--Parent--
## 5. Summary
--Child--
The **IPSEC Tunnel Commissioning** feature enables scalable, automated deployment of VPN tunnels with optional failover, supports multiple vendors, and provides clear visualization for verification. Users can import CPE inventory, select edge devices, configure POPs, and deploy tunnels in a single streamlined workflow.
