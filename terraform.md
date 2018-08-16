# Terraform

- Terraform is used to create, manage, and update infrastructure resources such as physical machines, VMs, network switches, containers, and more.
- Almost any infrastructure type can be represented as a resource in Terraform.

## Load Order and Semantics

- Configuration files are loaded within the directory specified in alphabetical order.
- Files loaded must end in either `.tf` or `.tf.json` or the files will be ignored. Multiple file formats can be present in the same directory.
- Terraform configurations are **declarative**, meaning the order of variables, resources, etc. defined within the configuration does not matter. In other words, references to other resources and variables do not depend on the order they're defined.

## Configuration Syntax

- The syntax in Terraform configurations are called **HashiCorp Configuration Language (HCL)**. Terraform can also read JSON configurations.
- For general Terraform configs, it is recommended to use HCL Terraform syntax.

## Resource Configuration

- The most important thing you'll figure with Terraform are resources.
- Resources are a component of your infrastructure.
- Can be a low level component (i.e. physical server, VM, container).
- Or a higher level component (i.e. email provider, DNS record, or DB provider).

### Using Variables with Count

- Count is the number of identical resources to create, and it is common to want each instance (or resource) to have a different value for a given attribute. Modules don't currently support the count parameter. 
- 

### Providers

- A provider is responsible for understanding API interactions and exposing resources. Providers generally are an IaaS (Infrastructure as a Service) (e.g. AWS, GCP, Microsoft Azure, OpenStack), PaaS (Platform as a Service) (e.g. Heroku), or SaaS services (e.g. Terraform Enterprise, DNSimple, CloudFlare).

#### Openstack Provider

- 

## Data Sources

- Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration.
- The data block creates a data instance of the given TYPE (first parameter) and NAME (second parameter). The combination of the type and name must be unique.
- 

## Provisioners 

- Provisioners are used to execute scripts on a local or remote machine as part of resource creation or destruction.
- Provisioners can be used to bootstrap a resource, cleanup before destroy, run configuration management, etc.

## Modules

- Modules are self-contained packages of Terraform configurations that are managed as a group.
- Modules are used to create reusable components in Terraform as well as for basic code organization.

## Questions

1. I noticed that only one terraform command (`terraform create`) is called during a Jenkins build. Is that right?
2. A provider is responsible for understanding API interactions and exposing resources. What does that mean? In our case, we're using Openstack as a provider.

