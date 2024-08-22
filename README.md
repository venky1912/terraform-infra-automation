
# 🚀 Terraform Infrastructure Automation with GitHub Actions

## 📁 Project Overview

This repository automates the deployment of AWS infrastructure using **Terraform** and **GitHub Actions**. The project is designed to manage multiple environments (`dev`, `staging`, `prod`) without requiring separate branches for each environment. It leverages GitHub Actions to automatically deploy infrastructure when changes are merged into the `main` branch.

### 📂 Directory Structure

```bash
terraform-infra-automation/
│
├── environments/
│   ├── dev/               # Development environment
│   ├── staging/           # Staging environment
│   └── prod/              # Production environment
│
├── modules/               # (Optional) Local Terraform modules
│
└── .github/
    └── workflows/
        └── terraform-automation.yml   # GitHub Actions workflow
```

### 1️⃣ **Environments Directory**

Each environment (`dev`, `staging`, `prod`) has its own configuration directory that contains:

- **`main.tf`**: The main Terraform configuration file that defines resources using the modules.
- **`variables.tf`**: Defines variables required by the environment.
- **`terraform.tfvars`**: Provides environment-specific values for the variables.
- **`backend.tf`**: Configures the backend for storing the Terraform state file (e.g., in an S3 bucket).

### 2️⃣ **Modules Directory (Optional)**

- If you have local Terraform modules, you can store them here.
- Alternatively, you can reference modules from a separate GitHub repository.

### 3️⃣ **GitHub Actions Workflow**

The `.github/workflows/terraform-automation.yml` file contains the automation logic. It leverages the following key steps:

- **Checkout Code**: Pulls the latest code from the repository.
- **Setup Terraform**: Installs and configures Terraform on the runner.
- **Initialize Terraform**: Initializes the Terraform backend, ensuring that the appropriate environment-specific state is used.
- **Select Workspace**: Selects the Terraform workspace corresponding to the environment (or creates it if it doesn't exist).
- **Plan and Apply**: Generates a plan and applies changes to the infrastructure automatically when code is merged into the `main` branch.

### 🛠️ **How to Set Up and Implement the Project**

- **Step 1: Clone the Repository**:
```bash
git clone https://github.com/venky1912/terraform-infra-automation.git
cd terraform-infra-automation
```
- **Step 2: Configure Your Environments**:
  * Navigate to the environments/ directory and configure the `dev`, `staging` and `prod` environments.
  * Edit the `terraform.tfvars` file in each environment directory to provide environment-specific values (e.g., VPC CIDR block, instance types, etc.). 

- **Step 3: Setup Terraform Backend**:
  * Ensure the `backend.tf` file in each environment directory is properly configured to point to your remote backend (e.g., S3 bucket for storing Terraform state files).

- **Step 4: GitHub Secrets**:
  * Add your AWS credentials and other sensitive information as GitHub Secrets. This will allow the workflow to authenticate with AWS and deploy resources.
    **How to Add Secrets**:
      1. Go to your repository on GitHub.
      2. Click on `Settings` -> `Secrets and variables` -> `Actions`.
      3. Add the following secrets:
        * `AWS_ACCESS_KEY_ID`
        * `AWS_SECRET_ACCESS_KEY`
        * `GH_PAT`

- **Step 5: Implement the GitHub Actions Workflow**:
  * The GitHub Actions workflow is already configured to trigger on pushes to the `main` branch.
  * When you push changes or merge a pull request into `main`, the workflow will automatically deploy the infrastructure to the appropriate environment.

- **Step 6: Deploy Infrastructure**:
  - **Feature Development**: Create a feature branch for developing new infrastructure features or changes.
  - **Pull Requests**: Raise a pull request to merge the feature branch into `main`.
  - **Automatic Deployment**: Once the PR is merged, GitHub Actions will trigger the deployment automatically for the affected environments.

- **Step 7: Monitor and Manage Infrastructure**:
  * After deployment, you can monitor your infrastructure through the AWS Management Console or use Terraform commands to check the status of resources.


## 💡 Benefits of This Setup

- **🔄 Automation**: Fully automated deployment process using GitHub Actions.
- **🔗 Consistency**: Ensures that infrastructure across all environments is consistent with minimal manual intervention.
- **📦 Modularity**: Reusable Terraform modules streamline infrastructure management and reduce duplication.
- **📈 Scalability**: Easily scalable to accommodate additional environments or new infrastructure components.
