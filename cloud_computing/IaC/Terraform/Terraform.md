### **What is Terraform?**
- Terraform is an open-source Infrastructure as Code (IaC) tool created by HashiCorp. It allows you to define, provision, and manage infrastructure using human-readable configuration files written in HCL (HashiCorp Configuration Language), which is designed to be very human-readable and easy to understand.
- Immutable - which means terraform doesn't make changes to the infrastructure itself, it destroys everything and builds it back up. So instead of changing the configuration of an EC2 instance, terraform would terminate and provision a new one with the required configuration.

### **Why was it created?**
Terraform was created to solve problems with
- Manual infrastructure management through a console, which is error-prone and time-consuming
- Lack of consistency across environments (dev, staging, prod).
- Vendor lock-in, by providing a single language to work with many different services/providers, so you're not locked into cloud-provided services.
- Cloud-based IaC such as Cloudformation in AWS wasn't very good and had it's limitations.

### **Why is Terraform so popular?**
- Cloud agnostic: One tool can manage infrastructure across many providers.
- Declarative syntax: You describe the end state and Terraform figures out the steps to get there, and abstracts a lot from you.
- Open source and extensible: Huge community, many plugins/providers, lots of collaboration possible.
- State management: Tracks resource changes over time in a state file.
- Ecosystem & tools: Integrates well with CI/CD, secret managers, and config management tools.


### **What are the Advantages of Terraform?**
- Multi-cloud and provider-agnostic
- Declarative language (HCL) is easy to read
- Infrastructure versioning via Git
- Reusable modules for DRY (Don't Repeat Yourself) code
- Quick and reproducible
- Consistency which also helps with compliance.
- Community support and ecosystem
- Automation-friendly for DevOps workflows
- Expressive- not limited to the language, as you can use loops, template files, built in functions etc. 
- Extendable- many plugins and is customisable to your requirements.


### **What are the disadvantages of Terraform?**
- State file management can be tricky, especially with teams
- Learning curve for complex scenarios
- Limited imperative logic (compared to tools like Pulumi that use general-purpose languages)
- Provider limitations (some features lag behind cloud provider updates)
- Debugging can be frustrating when errors are not descriptive