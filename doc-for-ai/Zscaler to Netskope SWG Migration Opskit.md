# Zscaler to Netskope SWG Migration OpsKit
--Parent--
## 1. Terminology
--Child--
- **SWG (Secure Web Gateway):** Cloud service controlling and monitoring web traffic for security and compliance.  
--Child--
- **Zscaler SWG:** Cloud SWG platform by Zscaler.  
--Child--
- **Netskope SWG:** Cloud SWG platform by Netskope.  
--Child--
- **URL Category:** Grouping of web domains by risk or business type (e.g., social media, malware).  
--Child--
- **URL List / Custom Object:** Explicit whitelist or blacklist of URLs, domains, or IPs.  
--Child--
- **Policy / Rule:** Set of controls applied to traffic, such as allow, block, or inspect.  
--Child--
- **SSL Inspection / Decryption:** Process of inspecting encrypted traffic for threats.  
--Child--
- **Traffic Steering:** Mechanism to direct traffic to the SWG (e.g., GRE/IPsec tunnels, PAC file, agent).  
--Child--
- **Audit / Log-only Mode:** Monitoring mode where policies are enforced only for logging, not blocking.  
--Child--
- **Dual-run / Parallel Mode:** Running both old and new SWG in parallel to validate behavior.  
--Child--
- **Fallback / Rollback Strategy:** Contingency plan to revert to the previous system if issues arise.  

---
--Parent--
## 2. Introduction
Migrating SWG policies from **Zscaler to Netskope** is non-trivial due to platform differences, traffic steering, and policy validation requirements. This OpsKit provides a structured approach to plan, execute, and validate the migration.

---
--Parent--
## 3. Key Migration Phases
--Child--
Phase 1: Planning & Discovery
Phase 2: Mapping & Transformation
Phase 3: Implementation in Netskope
Phase 4: Cut-over & Validation
Phase 5: Optimization & Decommissioning
-->

--Parent--
--Child--
### 3.1 Planning & Discovery
--Child--
- **Inventory current Zscaler SWG policies:**
--Child--
  - URL categories, filters, file-type controls
  - Threat & DLP rules
  - User-/group-scoped policies
  - Bypasses/exemptions
  - SSL inspection settings  
--Child--
- **Identify traffic steering mechanisms:**
--Child--
  - GRE/IPsec tunnels from SD-WAN
  - Zscaler client
  - PAC file configuration  
--Child--
- **Determine migration strategy:**
--Child--
  - What will be replicated vs refactored in Netskope
  - Identify category mismatches or gaps
  - Timing, rollback strategy, pilot groups, and parallel mode

--Parent--
### 3.2 Mapping & Transformation
--Child--
- Map Zscaler policies to Netskope equivalents:
  - URL categories → Netskope URL categories
  - Whitelists/blacklists → Netskope URL lists or custom objects
  - File-type filters → Netskope file-type controls
  - User/group scoping → Netskope user groups
  - SSL/TLS inspection → Netskope SSL inspection configuration
  - Threat & DLP rules → Netskope threat/DLP modules  
--Child--
- Create a **mapping document** listing:
  - Zscaler policy rule
  - Intent
  - Equivalent Netskope rule (with adjustments)  
--Child--
- Decide migration order (e.g., deny risky categories first, allow known good next).  
--Child--
- Clean up old policies if needed.

--Parent--
### 3.3 Implementation in Netskope
--Child--
- Build reusable objects:
  - URL lists, custom categories, file types, user groups  
--Child--
- Create Netskope SWG policies in **audit/log-only mode** initially.  
--Child--
- Steer traffic to Netskope:
  - Configure SD-WAN/tunnel/PAC file/agent  
  - Use parallel mode for initial validation  
--Child--
- Enable logging and monitoring to compare behavior against Zscaler.

--Parent--
### 3.4 Cut-over & Validation
--Child--
- Switch traffic fully to Netskope SWG.  
--Child--
- Monitor:
  - False positives: legitimate traffic blocked
  - False negatives: threats not detected  
--Child--
- Validate critical business applications (real-time apps, large file transfers).  
--Child--
- Keep Zscaler in fallback mode for a short period.  
--Child--
- Retire Zscaler policies once Netskope is stable.

--Parent--
### 3.5 Optimization & Decommissioning
--Child--
- Review Netskope logs to refine policies and reduce noise.  
--Child--
- Remove or repurpose Zscaler infrastructure (tunnels, clients, licenses).  
--Child--
- Document new architecture, policies, and responsibilities.

---

--Parent--
## 4. Key Considerations & Tips

--Child--
- **Category mismatches:** Expect imperfect 1:1 mappings between Zscaler and Netskope categories.  
--Child--
- **Dynamic policy controls:** Netskope supports application-context policies; adjust rules from category-based to instance-aware if needed.  
--Child--
- **Traffic steering:** Avoid proxy loops or latency issues during cutover.  
--Child--
- **SSL inspection & certificates:** Test SSL/TLS behavior; re-issue certificates if needed.  
--Child--
- **Performance/latency:** Pilot key users/groups to benchmark performance.  
--Child--
- **Business apps & exceptions:** Port exceptions for legacy apps, IoT devices, printers, etc.  
--Child--
- **Logging & visibility:** Ensure dashboards, alerts, and reports meet operational needs.  
--Child--
- **Change management & training:** Train teams on Netskope policy model and workflow.  
--Child--
- **Audit & compliance:** Maintain equivalent reporting and controls in Netskope.  
--Child--
- **Fallback strategy:** Plan for rapid reversion to Zscaler if necessary.  
--Child--
- **Licensing & vendor coordination:** Align license termination/transition and gather vendor migration guidance.  
--Child--
- **Third-party dependencies:** Review SIEM, threat feeds, CASB integrations for Netskope compatibility.

---

--Parent--
## 5. Sample Migration Checklist
--Child -- 
Sample Migration Checklist
Phase 1: Planning & Discovery
Phase 2: Mapping & Transformation
Phase 3: Implementation
Phase 4: Pilot & Dual-run
Phase 5: Cut-over
Phase 6: Optimization
Phase 7: Decommission
-->

--Child--
- Phase: Planning & Discovery
  - Action: Export Zscaler policies and exceptions
  - Owner: SecOps
  - Notes: Include SSL, DLP, file-type controls
-->

--Child--
- Phase: Mapping & Transformation
  - Action: Map Zscaler categories → Netskope categories/objects
  - Owner: SecOps
  - Notes: Document gaps and adjustments
-->

--Child--
- Phase: Implementation
  - Action: Create Netskope objects (URL lists, groups, file types)
  - Owner: SecOps
  - Notes: Start in audit/log-only mode
-->

--Child--
- Phase: Pilot & Dual-run
  - Action: Configure small user group in audit mode
  - Owner: SecOps
  - Notes: Compare logs/hits vs Zscaler
-->

--Child--
- Phase: Cut-over
  - Action: Redirect all traffic to Netskope
  - Owner: SecOps / NetOps
  - Notes: Validate critical apps and SSL inspection
-->

--Child--
- Phase: Optimization
  - Action: Refine policies based on hits/logs
  - Owner: SecOps
  - Notes: Reduce false positives/negatives
-->

--Child--
- Phase: Decommission
  - Action: Retire Zscaler policies, infrastructure, and licenses
  - Owner: SecOps
  - Notes: Update documentation
-->

---

--Parent--
## 6. Business Value

--Child--
- **Policy cleanup & consolidation:** Opportunity to remove stale rules and optimize SWG posture.  
--Child--
- **SSE/SASE alignment:** Realign SWG with broader cloud security architecture (CASB, DLP, cloud-app visibility).  
--Child--
- **Cost savings:** Potential licensing optimizations when moving to Netskope.  
--Child--
- **Operational efficiency:** Reduced errors, better audibility, and streamlined management.

---

--Parent--
## 7. Next Steps / Recommendations

1. Define **pilot group** and dual-run timeline.  
2. Create **policy mapping document** between Zscaler and Netskope.  
3. Build reusable objects in Netskope for smooth policy import.  
4. Execute migration in stages: audit → dual-run → full cutover.  
5. Monitor, refine, and validate continuously.  
6. Decommission Zscaler once Netskope is fully operational.  

---
--Parent--
8. Migration Flow Diagram
--Child--
Current State:
Users → Zscaler SWG
--Child--
Planning & Discovery Phase
- Inventory Zscaler policies
- Identify traffic steering
- Define gaps & migration scope
--Child--
Mapping & Transformation Phase
- Map Zscaler categories → Netskope
- Map whitelists/blacklists
- Map user/group policies
--Child--
Implementation in Netskope
- Build reusable objects
- Create policies in audit mode 
- Pilot traffic subset
--Child-- 
Dual-run / Validation Phase
- Parallel traffic (Zscaler + Netskope)
- Compare logs and hits
- Refine policies
--Child--   
Full Cut-over & Monitoring  
- Redirect all traffic to Netskope
- Validate critical apps 
- Monitor false positives/negatives
--Child--
Optimization & Decommissioning
- Refine rules based on logs
- Retire Zscaler policies/infrastructure
- Document architecture & processes
--Child--

--Parent--
**Diagram Description:**
--Child--  
1. Current State: Users sending traffic to Zscaler SWG.  
--Child--
1. Planning & Discovery: Inventory policies, traffic steering, identify gaps.  
--Child--
1. Mapping & Transformation: Map categories, rules, user/groups, SSL inspection, DLP.  
--Child--
1. Implementation: Build Netskope objects, create policies in audit mode, pilot subset.  
--Child--
1. Dual-run / Validation: Run Zscaler + Netskope in parallel, compare logs, refine policies.  
--Child--
1. Full Cut-over: Redirect all traffic to Netskope, validate applications.  
--Child--
1. Optimization & Decommissioning: Refine rules, retire Zscaler infrastructure, document.

