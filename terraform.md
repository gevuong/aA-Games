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
- Resources are components of your infrastructure.
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


### Bastion 

- In an Amazon Web Services (AWS) context, a bastion host is defined as "a server whose purpose is to provide access to a private network from an external network, such as the Internet. Because of its exposure to potential attack, a bastion host must minimize the chances of penetration."[3]. A further AWS related definition is that bastion hosts are "instances that sit within your public subnet and are typically accessed using SSH or RDP. Once remote connectivity has been established with the bastion host, it then acts as a ‘jump’ server, allowing you to use SSH or RDP to log in to other instances (within private subnets) deeper within your VPC. When properly configured through the use of security groups and Network ACLs (NACLs), the bastion essentially acts as a bridge to your private instances via the internet.

- It basically serves as a gateway. Other than the administrator to login.

## Questions

1. I noticed that only one terraform command (`terraform create`) is called during a Jenkins build. Is that right? "Calling Terraform Create for Acceptance Test Environment"
- There's a set of username and pw that only Jenkins has, and and terraform needs it to build environment.

2. A provider is responsible for understanding API interactions and exposing resources. What does that mean? In our case, we're using Openstack as a provider.

3. What's the cidr of the subnet? Why use "tst" to describe a network? Floating IPs vs non-floating IPs?

4. I noticed that the router interface is dependent on the subnet_id and router_id?

5. The exported yaml, where do those values get used in terraform?
- Theres a terraform openstack provider that looks for that.


6. When to use a depends on? There are examples where I thought a depends on would be appropriate but it wasn't used? (i.e. openstack computer instance depends on openstack networking port and keypair)
- Test it and see what didn't work, then add dependencies. So need to run multiple tests. 
- Always start with the ideal.

7. There's a separate CI/CD pipeline for infrastructure?

8. Can you elaborate on bastion and why we need it? And where that module comes from? I couldn't find it in terraform.

9. Do security groups go hand in hand with bastion to prevent attacks? What is trams-svc, or SVC specifically?

If you only do incremental additions, if the whole things goes away, it'll try to put some things in place before it fails. Build your system, from a blank install,

- Destroy it and event destroy at once. The environment destroy ensures that we have a known state environment. Ensures that anyone can get this running in an environment to the point that's it's useable from the business objective.

- After an incremental add, destroy and recreate. It may not run in order. 

Bastion sits on the same subnet as the kubernetes. If you logged into the bastion, and you don't know that the Cassandra systems exist. You'll see that there is a kubernetes  cluster. You won't 