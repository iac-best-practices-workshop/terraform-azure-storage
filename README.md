# Terraform Feature Flags Workshop

Welcome to the Terraform Feature Flags Workshop! This project demonstrates using Terraform with feature flags, allowing dynamic changes in infrastructure behavior without altering the core code.

## Project Structure

- **Root Folder**: Contains the main Terraform modules (`main.tf`, `output.tf`, `variables.tf`) using feature flags.
- **Feature-Flag-Usage Folder**: Shows how to use the project and change the Customer-Driven feature flag.
- **Feature-Flags-Management Folder**: For setting and managing company-owned feature flags.

## Prerequisites

- Terraform installed.
- Access to Azure cloud environment.
- Basic knowledge of Terraform and Azure.

## Setup

1. **Clone the Repository**: Clone this repository to your local machine.

   ```sh
   git clone [repository-url]
   ```

2. **Navigate to the Project**: Change to the cloned repository directory.

   ```sh
   cd [repository-name]
   ```

3. **Initialize Terraform**:

    Run the Terraform initialization:

   ```sh
   terraform init
   ```

### Managing Company-Owned Feature Flags

Follow the steps in the feature-flags-management folder to set up and manage company-owned feature flags using Azure Key Vault.

1. Navigate to the `feature-flags-management` folder and follow the instructions there.
2. Use `terraform plan` and `terraform apply` to set up and modify the feature flags.

### Using Feature Flags in Terraform

The `feature-flag-usage` folder demonstrates how to use feature flags in practice.

1. **Navigate to the Feature Flag Usage Folder**:

```sh
cd feature-flag-usage
```

2. **Examine the main.tf File**:

This file shows how the root module is used and how feature flags can activate features like "encryption".

3. Plan and Apply:

Use `terraform plan` and `terraform apply` to see the feature flags in action.

### Conclusion

This workshop provides hands-on experience with feature flags in Terraform, showcasing how to dynamically manage and change infrastructure behavior. By following these steps, you can effectively manage infrastructure setup in a more flexible and responsive manner.
