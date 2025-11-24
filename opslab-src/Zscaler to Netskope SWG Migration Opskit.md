# Zscaler to Netskope SWG Migration OpsKit

## 1. Terminology
- **SWG (Secure Web Gateway):** Cloud service controlling and monitoring web traffic for security and compliance.  
- **Zscaler SWG:** Cloud SWG platform by Zscaler.  
- **Netskope SWG:** Cloud SWG platform by Netskope.  
- **URL Category:** Grouping of web domains by risk or business type (e.g., social media, malware).  
- **URL List / Custom Object:** Explicit whitelist or blacklist of URLs, domains, or IPs.  
- **Policy / Rule:** Set of controls applied to traffic, such as allow, block, or inspect.  
- **SSL Inspection / Decryption:** Process of inspecting encrypted traffic for threats.  
- **Traffic Steering:** Mechanism to direct traffic to the SWG (e.g., GRE/IPsec tunnels, PAC file, agent).  
- **Audit / Log-only Mode:** Monitoring mode where policies are enforced only for logging, not blocking.  
- **Dual-run / Parallel Mode:** Running both old and new SWG in parallel to validate behavior.  
- **Fallback / Rollback Strategy:** Contingency plan to revert to the previous system if issues arise.  

---

## 2. Introduction
Migrating SWG policies from **Zscaler to Netskope** is non-trivial due to platform differences, traffic steering, and policy validation requirements. This OpsKit provides a structured approach to plan, execute, and validate the migration.

---

## 3. Key Migration Phases

### 3.1 Planning & Discovery
- **Inventory current Zscaler SWG policies:**
  - URL categories, filters, file-type controls
  - Threat & DLP rules
  - User-/group-scoped policies
  - Bypasses/exemptions
  - SSL inspection settings  
- **Identify traffic steering mechanisms:**
  - GRE/IPsec tunnels from SD-WAN
  - Zscaler client
  - PAC file configuration  
- **Determine migration strategy:**
  - What will be replicated vs refactored in Netskope
  - Identify category mismatches or gaps
  - Timing, rollback strategy, pilot groups, and parallel mode

### 3.2 Mapping & Transformation
- Map Zscaler policies to Netskope equivalents:
  - URL categories → Netskope URL categories
  - Whitelists/blacklists → Netskope URL lists or custom objects
  - File-type filters → Netskope file-type controls
  - User/group scoping → Netskope user groups
  - SSL/TLS inspection → Netskope SSL inspection configuration
  - Threat & DLP rules → Netskope threat/DLP modules  
- Create a **mapping document** listing:
  - Zscaler policy rule
  - Intent
  - Equivalent Netskope rule (with adjustments)  
- Decide migration order (e.g., deny risky categories first, allow known good next).  
- Clean up old policies if needed.

### 3.3 Implementation in Netskope
- Build reusable objects:
  - URL lists, custom categories, file types, user groups  
- Create Netskope SWG policies in **audit/log-only mode** initially.  
- Steer traffic to Netskope:
  - Configure SD-WAN/tunnel/PAC file/agent  
  - Use parallel mode for initial validation  
- Enable logging and monitoring to compare behavior against Zscaler.

### 3.4 Cut-over & Validation
- Switch traffic fully to Netskope SWG.  
- Monitor:
  - False positives: legitimate traffic blocked
  - False negatives: threats not detected  
- Validate critical business applications (real-time apps, large file transfers).  
- Keep Zscaler in fallback mode for a short period.  
- Retire Zscaler policies once Netskope is stable.

### 3.5 Optimization & Decommissioning
- Review Netskope logs to refine policies and reduce noise.  
- Remove or repurpose Zscaler infrastructure (tunnels, clients, licenses).  
- Document new architecture, policies, and responsibilities.

---

## 4. Key Considerations & Tips

- **Category mismatches:** Expect imperfect 1:1 mappings between Zscaler and Netskope categories.  
- **Dynamic policy controls:** Netskope supports application-context policies; adjust rules from category-based to instance-aware if needed.  
- **Traffic steering:** Avoid proxy loops or latency issues during cutover.  
- **SSL inspection & certificates:** Test SSL/TLS behavior; re-issue certificates if needed.  
- **Performance/latency:** Pilot key users/groups to benchmark performance.  
- **Business apps & exceptions:** Port exceptions for legacy apps, IoT devices, printers, etc.  
- **Logging & visibility:** Ensure dashboards, alerts, and reports meet operational needs.  
- **Change management & training:** Train teams on Netskope policy model and workflow.  
- **Audit & compliance:** Maintain equivalent reporting and controls in Netskope.  
- **Fallback strategy:** Plan for rapid reversion to Zscaler if necessary.  
- **Licensing & vendor coordination:** Align license termination/transition and gather vendor migration guidance.  
- **Third-party dependencies:** Review SIEM, threat feeds, CASB integrations for Netskope compatibility.

---

## 5. Sample Migration Checklist

| Phase                  | Action                                     | Owner   | Notes |
|------------------------|-------------------------------------------|---------|-------|
| Planning & Discovery   | Export Zscaler policies and exceptions    | SecOps | Include SSL, DLP, file-type controls |
| Mapping & Transformation | Map Zscaler categories → Netskope categories/objects | SecOps | Document gaps and adjustments |
| Implementation         | Create Netskope objects (URL lists, groups, file types) | SecOps | Start in audit/log-only mode |
| Pilot & Dual-run       | Configure small user group in audit mode | SecOps | Compare logs/hits vs Zscaler |
| Cut-over               | Redirect all traffic to Netskope          | SecOps/NetOps | Validate critical apps and SSL inspection |
| Optimization           | Refine policies based on hits/logs        | SecOps | Reduce false positives/negatives |
| Decommission           | Retire Zscaler policies, infrastructure, and licenses | SecOps | Update documentation |

---

## 6. Business Value

- **Policy cleanup & consolidation:** Opportunity to remove stale rules and optimize SWG posture.  
- **SSE/SASE alignment:** Realign SWG with broader cloud security architecture (CASB, DLP, cloud-app visibility).  
- **Cost savings:** Potential licensing optimizations when moving to Netskope.  
- **Operational efficiency:** Reduced errors, better audibility, and streamlined management.

---

## 7. Next Steps / Recommendations

1. Define **pilot group** and dual-run timeline.  
2. Create **policy mapping document** between Zscaler and Netskope.  
3. Build reusable objects in Netskope for smooth policy import.  
4. Execute migration in stages: audit → dual-run → full cutover.  
5. Monitor, refine, and validate continuously.  
6. Decommission Zscaler once Netskope is fully operational.  

---

## 8. Migration Flow Diagram

               ┌─────────────────────┐
               │ Current State:      │
               │ Users → Zscaler SWG│
               └─────────┬──────────┘
                         │
       ┌─────────────────┴─────────────────┐
       │ Planning & Discovery Phase         │
       │ - Inventory Zscaler policies      │
       │ - Identify traffic steering       │
       │ - Define gaps & migration scope  │
       └─────────────────┬─────────────────┘
                         │
       ┌─────────────────┴─────────────────┐
       │ Mapping & Transformation Phase     │
       │ - Map Zscaler categories → Netskope│
       │ - Map whitelists/blacklists        │
       │ - Map user/group policies          │
       └─────────────────┬─────────────────┘
                         │
       ┌─────────────────┴─────────────────┐
       │ Implementation in Netskope        │
       │ - Build reusable objects          │
       │ - Create policies in audit mode  │
       │ - Pilot traffic subset            │
       └─────────────────┬─────────────────┘
                         │
       ┌─────────────────┴─────────────────┐
       │ Dual-run / Validation Phase        │
       │ - Parallel traffic (Zscaler + Netskope)│
       │ - Compare logs and hits           │
       │ - Refine policies                  │
       └─────────────────┬─────────────────┘
                         │
       ┌─────────────────┴─────────────────┐
       │ Full Cut-over & Monitoring        │
       │ - Redirect all traffic to Netskope│
       │ - Validate critical apps          │
       │ - Monitor false positives/negatives│
       └─────────────────┬─────────────────┘
                         │
       ┌─────────────────┴─────────────────┐
       │ Optimization & Decommissioning    │
       │ - Refine rules based on logs      │
       │ - Retire Zscaler policies/infrastructure│
       │ - Document architecture & processes│
       └───────────────────────────────────┘


**Diagram Description:**  
1. Current State: Users sending traffic to Zscaler SWG.  
2. Planning & Discovery: Inventory policies, traffic steering, identify gaps.  
3. Mapping & Transformation: Map categories, rules, user/groups, SSL inspection, DLP.  
4. Implementation: Build Netskope objects, create policies in audit mode, pilot subset.  
5. Dual-run / Validation: Run Zscaler + Netskope in parallel, compare logs, refine policies.  
6. Full Cut-over: Redirect all traffic to Netskope, validate applications.  
7. Optimization & Decommissioning: Refine rules, retire Zscaler infrastructure, document.

