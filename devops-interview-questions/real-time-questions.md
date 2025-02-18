# DevOps Engineer Interview Questions & Answers

## 1. Can you write a real-time Python automation code?
(TBD - Provide a relevant Python automation script based on the use case)

---

## 2. Explain Jenkins Master/Slave architecture.

### Answer:
Jenkins follows a distributed build architecture where tasks are offloaded from the Master (Controller) to Slaves (Agents) to improve performance and scalability.

### **1. Master (Controller)**
- Manages Jenkins configurations, jobs, and scheduling.
- Distributes tasks to slaves based on load and labels.
- Handles the UI, user requests, and result aggregation.

### **2. Slave (Agent)**
- Executes builds as assigned by the master.
- Can run on different OS (Windows, Linux, etc.).
- Reduces the load on the master by handling CI/CD tasks.

### **Workflow:**
1. Developer commits code → Triggers Jenkins job.
2. Master assigns the job to an available slave based on labels & resources.
3. Slave executes the build/test/deployment.
4. Results are sent back to the master.

### **Benefits:**
✅ Scalability – Multiple slaves can handle parallel jobs.  
✅ Resource Optimization – Workload is distributed efficiently.  
✅ Flexibility – Different environments for different projects.  

---

## 3. What is Liveness Probe and Readiness Probe?

- **Liveness Probe:** Checks if a container is still running. If it fails, Kubernetes restarts the container.
- **Readiness Probe:** Checks if a container is ready to accept traffic. If it fails, the pod is removed from the service's load balancer.

---

## 4. What are the parameters needed to deploy an application into Kubernetes using a pipeline?

To deploy an application into Kubernetes using a pipeline, you need:

- **Kubernetes Manifest Files** (Deployment, Service, Ingress, etc.).
- **Container Image** (stored in a registry like Docker Hub or ECR).
- **Kubeconfig** (for cluster authentication).
- **Helm Charts** (if using Helm for deployment).
- **CI/CD Pipeline Configuration** (Jenkins, GitHub Actions, GitLab CI, etc.).

---

## 5. What is a Terraform state file, and explain the lock process?

- **Terraform State File (`terraform.tfstate`)**: Stores the current infrastructure state to track resource changes.
- **State Locking**: Prevents concurrent modifications by locking the state file (e.g., using DynamoDB for S3 backend) to avoid conflicts and corruption.

---

## 6. Where do you store sensitive information?

Sensitive information in Terraform is typically stored in:
- **Terraform variables** (via environment variables or `.tfvars` files).
- **Secret management systems** like AWS Secrets Manager, HashiCorp Vault, or Azure Key Vault.
- **Avoid storing secrets** in plain text files (e.g., state files).

---

## 7. What issues do you face when building an image?

Common issues when building an image include:

- **Dependency Conflicts** – Unresolved dependencies or version mismatches.
- **Permission Issues** – Insufficient permissions for file access or execution.
- **Network Connectivity** – Problems downloading required packages or files.
- **Build Context Size** – Large context size leading to slow builds.

---

## 8. How to stop direct commits to GitHub?

To stop direct commits to GitHub:
- **Enforce branch protection rules** to require pull requests and reviews before merging.
- **Use Git hooks** or **CI/CD pipelines** to reject direct commits to specific branches like `main` or `master`.

---

## 9. Kubernetes YAML Files
(TBD - Provide sample YAML files for Deployment, Service, and Ingress)

---

## 10. What is a Tag in Git?

A **Tag** in Git is a reference to a specific commit, often used to mark important points in the history, such as releases or versions. Tags are typically immutable and provide a way to easily reference specific states in the repository.

---

## 11. Where do you deploy an application in Kubernetes?

In Kubernetes, you deploy an application using:
- **Pod or Deployment**: Manages the containers and ensures their desired state is maintained.
- **Services**: Used for networking within the cluster.
- **Ingress**: Manages external access to services.

---

## 12. How to schedule a build on a specific node in Jenkins?

To schedule a build on a specific node in Jenkins:
1. Assign a **label** to the node.
2. Configure the job to run on that node by selecting the appropriate **label** in the job's **"Restrict where this project can be run"** option under **"Advanced Project Options"**.

---

## 13. What real-time issues do you face when building a Java package using Maven?

Common real-time issues when building a Java package using Maven include:

- **Dependency Conflicts** – Different versions of the same dependency can cause build failures.
- **Out of Memory Errors** – Insufficient heap space for large projects (`java.lang.OutOfMemoryError`).
- **Plugin Compatibility Issues** – Incompatible or outdated Maven plugins causing errors.
- **Network Issues** – Maven unable to download dependencies from remote repositories.
- **Failed Tests** – Unit tests failing due to incorrect configurations or environment mismatches.

---

## 14. Where have you used Python and Shell scripting?
(TBD - Provide real-world use cases where Python and Shell scripting were utilized)

---

## 15. How many builds are stored in a Jenkins pipeline project?

By default, **Jenkins stores the last 100 builds** for each pipeline project.  
- This number can be adjusted by modifying the **"Build Discarder"** settings under job configuration.

---

## 16. Describe a Zero Downtime Deployment model.

A **Zero Downtime Deployment** ensures that an application remains available during updates. Common models include:

- **Blue-Green Deployment** – Traffic switches between two identical environments (Blue = Current, Green = New).
- **Rolling Deployment** – Gradually replaces old instances with new ones to avoid downtime.
- **Canary Deployment** – Deploys updates to a small subset of users before full rollout.
- **Feature Flags** – Enables or disables new features without redeploying.

---

## 17. What things do you measure in a Disaster Recovery (DR) Test?

In a **Disaster Recovery (DR) Test**, key metrics to measure include:

- **Recovery Time Objective (RTO)** – Maximum acceptable downtime before services are restored.
- **Recovery Point Objective (RPO)** – Maximum data loss tolerance (time between last backup and failure).
- **Failover & Failback Time** – Time taken to switch to backup systems and revert to primary.
- **Data Integrity & Consistency** – Ensuring restored data is complete and accurate.
- **System & Application Functionality** – Verifying all critical applications work post-recovery.
