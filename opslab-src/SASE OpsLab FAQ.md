# SASE OpsLab FAQ

## Terminology

- **SASE (Secure Access Service Edge):** A cloud-native architecture that combines networking and security services, including SD-WAN, SWG, CASB, ZTNA, and firewall-as-a-service, delivered as a unified service.  

- **SWG (Secure Web Gateway):** A cloud service that monitors and controls web traffic to enforce security, compliance, and data protection policies.  
- **ZTNA (Zero Trust Network Access):** A security model that grants users access to applications based on identity and context rather than network location, minimizing trust assumptions.  
- **DLP (Data Loss Prevention):** A set of tools and policies to prevent sensitive data from leaving an organization unauthorized.  
- **Audit / Log-Only Mode:** A monitoring mode where policies are enforced only for logging, not blocking, allowing validation without impacting users.  
- **Dual-Run / Parallel Mode:** Operating old and new systems simultaneously to validate behavior before a full cutover.  
- **Traffic Steering:** Mechanisms to direct user or branch traffic to a specific security platform (e.g., GRE/IPsec tunnels, PAC file, or client).  
- **Fallback / Rollback Strategy:** A contingency plan to revert to a previous system in case of errors or unexpected behavior during migration.  

## Deploy (SASE Context)
**Definition:**  
The process of provisioning, configuring, and activating SASE (Secure Access Service Edge) services, policies, or components in a live environment to provide secure connectivity and enforce security controls for users, devices, and applications.

**Key Points:**  
- **Service Provisioning:** Setting up cloud-based SASE components such as SWG, ZTNA, CASB, or FWaaS for use.  
- **Policy Configuration:** Applying security policies (e.g., URL filtering, access controls, DLP rules) to the deployed services.  
- **Activation / Go-Live:** Making the configured services operational for end-users and network traffic.  
- **Continuous Management:** Ensuring deployed services remain updated, scalable, and compliant over time.  
- **Deployment Scope:** Can be for a single site, branch, user group, or global enterprise-wide rollout.  
- **Automation:** Often involves using orchestration tools or workflows to deploy SASE services at scale efficiently and consistently.

**Example:**  
- Deploying a new SWG policy set across all branch offices using the SASE platform’s cloud management console, ensuring all traffic is inspected and filtered according to corporate security rules.

## Migrate (SASE Context)
**Definition:**  
The process of transferring users, devices, applications, and security policies from one SASE (Secure Access Service Edge) platform to another while maintaining connectivity, security, and compliance.

**Key Points:**  
- **Policy Migration:** Moving firewall rules, SWG policies, ZTNA rules, DLP rules, and threat detection configurations.  
- **Traffic & Network Migration:** Redirecting user or branch traffic (GRE/IPsec tunnels, PAC files, or agents) to the new SASE provider.  
- **Identity & Access Migration:** Replicating user, group, and role definitions for seamless access.  
- **Application & Resource Access Migration:** Recreating private/internal application access on the new platform.  
- **Operational Continuity & Validation:** Running in audit or parallel mode to ensure service continuity and validate behavior.  
- **Compliance & Reporting:** Maintaining logging, reporting, and audit trails equivalent to the original platform.


## Run (SASE Context)
**Definition:**  
The process of operating, monitoring, and maintaining SASE (Secure Access Service Edge) services and policies in a live production environment to ensure secure connectivity, policy enforcement, and continuous service availability.

**Key Points:**  
- **Continuous Operation:** Keeping SASE services such as SWG, ZTNA, CASB, and FWaaS active and handling live traffic.  
- **Monitoring & Visibility:** Observing traffic, policy hits, alerts, and security events to detect anomalies or violations.  
- **Policy Enforcement:** Ensuring security and access policies are actively applied to all users, devices, and applications.  
- **Maintenance & Updates:** Applying updates, patches, or configuration changes without disrupting service.  
- **Incident Response:** Detecting, troubleshooting, and remediating security or connectivity issues in real-time.  
- **Performance Optimization:** Continuously analyzing logs and metrics to optimize throughput, latency, and reliability.  

**Example:**  
Running a SASE environment with SWG policies actively filtering web traffic, ZTNA controlling application access, and CASB monitoring cloud app usage while alerting administrators of suspicious activities.
