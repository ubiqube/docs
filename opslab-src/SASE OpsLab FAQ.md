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


### What is OpsLab?
**OpsLab** is the automation and orchestration platform used to design, execute, and monitor network and security workflows.  
It provides the foundation for building “OpsKits,” managing projects, and automating operational tasks at scale.

---

### What is an OpsKit?
An **OpsKit** is a reusable automation module or workflow template that performs a specific operational function — for example, creating CPE tunnels, importing inventory, or deploying configurations.  
OpsKits can be:
- Manual (step-by-step guided)
- Automated (scheduled or triggered)
- Integrated into larger projects or task chains

---

### What is a Project?
A **Project** is a structured deployment initiative that organizes related tasks into phases (such as Planning, Execution, and Validation).  
It provides visibility into progress through a Kanban or Gantt-style interface, showing which tasks are To Do, In Progress, or Done.

**Typical project attributes include:**
- Status (New, In Progress, Done, Archived)  
- Tasks (the set of required activities)  
- Owner (responsible person or team)  
- Start/End Dates (timeline tracking)

---

### What is a Task?
A **Task** is an individual activity that contributes to the completion of a project.  
It can represent either:
- A **human action** (manual step)  
- An **OpsKit execution** (automated workflow)

**Tasks include:**
- Status (To Do, In Progress, Done, Failed, On Hold)  
- Owner and approver  
- Dependencies (parent/child relationships)  
- Links to OpsKits or human activities

---

### What is the "Magic Button"?
The **Magic Button** is a one-click action that allows users to quickly reopen archived projects or perform predefined recovery or modification operations — for example:
- Restoring a CPE configuration  
- Adding or removing tunnels in a deployed network  
- Updating an existing branch with new infrastructure

It streamlines routine actions and simplifies post-deployment adjustments.

---

### What is a Project Lifecycle?
The **Project Lifecycle** defines the sequence of states through which a project progresses, such as:
> New → In Progress → Done → Archived → (Reopened)

It helps users understand where the project stands and supports governance, traceability, and auditing.

---

### What does “Audit Trail” mean in this context?
An **Audit Trail** records every significant activity or change within a project or task, including:
- Who performed an action  
- What was changed or executed  
- When it happened  

This supports accountability, compliance, and post-incident analysis.

---

### Who are the main personas involved?
- **Project Manager:** Plans, tracks, and coordinates activities within a project.  
- **Ops Staff:** Executes assigned tasks, updates progress, and provides feedback or results.  

Each persona interacts with the system differently — PMs manage from a top-down view, while Ops Staff focus on execution.

---


## What is Deploy (SASE Context)
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

---

## What is Migrate (SASE Context)
**Definition:**  
The process of transferring users, devices, applications, and security policies from one SASE (Secure Access Service Edge) platform to another while maintaining connectivity, security, and compliance.

**Key Points:**  
- **Policy Migration:** Moving firewall rules, SWG policies, ZTNA rules, DLP rules, and threat detection configurations.  
- **Traffic & Network Migration:** Redirecting user or branch traffic (GRE/IPsec tunnels, PAC files, or agents) to the new SASE provider.  
- **Identity & Access Migration:** Replicating user, group, and role definitions for seamless access.  
- **Application & Resource Access Migration:** Recreating private/internal application access on the new platform.  
- **Operational Continuity & Validation:** Running in audit or parallel mode to ensure service continuity and validate behavior.  
- **Compliance & Reporting:** Maintaining logging, reporting, and audit trails equivalent to the original platform.

---

## What is Run (SASE Context)
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
