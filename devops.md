# Intro to DevOps

### Table of Contents
- *[OpsWorks and Chef](#OpsWorks and Chef)*
- [OpsWorks and Chef](#OpsWorks and Chef)

## W1D2, Tuesday, April 20th, 2018, CI/CD
- Steps implemented
- Create and setup AWS EC2 (Elastic Cloud Computing) instance to use as our CI/CD server
- Launching EC2 instances are essentially remote web servers.

## W1D3, Wednesday, April 4th, 2018, AWS RDS (Relational Database Service)
- In RDS, the underlying data structure is a BST, and an array with fixed fields. What do you mean by that?
    - When an index is created, a new BST is created. The name (or column) of that created index become the keys stored in a BST.
    - The value of each node determines the location of where the data is located in the file (i.e. .dat or .db) that the DB uses to store data.
    - DB stores data in files, and the data stored is contiguous, meaning the data is stored in the order of when record was created, and can easily be indexed.
    - The data is stored in an array-like structure. This means that #insert is O(1) because you are pushing new data to end of the array-like structure.


- Providing additional indices increases read speed, but slows write speed. How?
    - Reading data takes log(n) time, but worst case is O(n). When writing data, re-balancing BST using AVL takes log(n) time.

### Why do we use a BST instead of a hash even though hash is O(1) lookup?
- Yes, a hash has a faster lookup time than a BST. A hash is O(1) lookup, and BST is log(n) lookup. However, a hash is not in order, so it doesn't suit well for searches, but are great for caching when using Memcached or Redis.
- Whenever a new record is added, the btree needs to re-balance itself, and uses AVL, an auto-balancing BST algorithm.



### How do you improve DB performance?
- **Add `explain analyze` in front of a coplex query and the query plan will display, showing the time it takes to execute each query being made. This does not execute the query.**


### What are some ways to scale a DB?
- Master/Slave
- Sharding
    - Vertical (i.e. microservices)
        - Spotify
    - Horizontal (i.e. client-based)
        - Slack


## OpsWorks and Chef
### W2D1, Monday, April 9th, 2018

### What is Chef?
- An open-source automation platform that configures and manages infrastructure, like software deployment.
-

### How does Chef work?
1. Lets start with the Chef server. It manages the nodes that make up your infrastructure. What are nodes? A **node** can be a physical server, VM, your local laptop, or anything in your computing environment.
2. The Chef Server stores the current and desired configuration instructions of the nodes, called **cookbooks**. These "pluggable" cookbooks are made up of custom **recipes**, which implement policies or instructions that fit your needs and are then uploaded to Chef Server.

3. Chef Server is a centralized store for all infrastructure information, sort of like the store in a Redux cycle, which holds the current application state.
3. The Chef Client runs on each node, and regularly checks in with Chef Server to see if there are any changes in the **cookbooks** or settings. If there are, Chef Server sends the latest versions and Chef Client applies the configuration changes to the node.

    - If it helps, the way I see it, a Chef Client can be analogous to a React container, which configures (or maps) any changes in the state as props. The store (or Chef Server) sends latest application state to the container (or Chef Client), the container configures those changes, and maps them to props, which are then applied to the presentational components (or nodes).


### Chef Setup and Berkshelf
- Uses Ruby as Domain Specific Language (DSL)
- Each "step" in the script is modeled as a "resource".
- Berkshelf is one particular public cookbook repo, and its usage installs the Berkshelf client on your node.
- But why Berkshelf?? I'm not sure, but in this case, we're using Berkshelf.

- Berksfile contains only the location to the public Chef cookbook repos available in the, wait for it... Chef Supermarket, lol...
- Dependencies are listed in metadata.rb and run ```berks vendor ..```  in ```cookbooks/my_cookbook``` directory to properly download cookbooks locally.


### Ok, so how does AWS OpsWorks come into this discussion?
- Lets start with, "What is OpsWorks?"
    - AWS OpsWorks is a DevOps application management service. In other words, this service focuses on automating operational tasks, like software configurations, server scaling, deployments, and DB setups for your app.
    - Can automate operations like auto-scaling and health monitoring.
    - Note: there are multiple ways to deploy apps on AWS, such as Elastic Beanstalk, CloudFormation, EC2. And OpsWorks is another option.

        - It all comes down to level of convenience.

        ![AWS App Management Services](images/aws_app_management_services.png)


- How does OpsWorks, work?
    - Model your entire application as a **stack**, consisting of **layers**. **Layers** are like blueprints (or "rules", if you will) that define how to setup and configure EC2 instances. For convenience, OpsWorks offers pre-built layers for Ruby and AWS RDS.
    - Once layers are setup and configured, and your stack is ready, OpsWorks pulls the code from your repo, and deploys it onto your instances to get your stack up and running, using the predefined layers (or rules).
    - In the grand scheme of things, when a deploy is triggered in the CI build/deploy pipeline using Jenkins, a deployment system like Chef comes into play, which is responsible for configuring the **layers** within the stack, which is modeled after your application.
    - In the grander scheme, OpsWorks integrates with the lifecycle of AWS EC2 instances.



### Ok, now that I know what OpsWorks is, where does Chef come into play?
- Chef **recipes** are scripts for OpsWorks to run.
- These scripts are like predefined rules. For example, when a new machine or instance is added to the fleet, these recipes are executed.
- **Earlier we talked about layers. Well, layers can be defined on your own, and can be configured however you want, using Chef recipes**.
- **You can perform specific configuration tasks using Chef recipes that are attached to OpsWorks lifecycle events (defined below).**
- **Whenever a change happens on your stack, or upon a request, all instances are notified and recipes are run.**


- OpsWorks triggers events during an application lifecycle, such as when an instance is set up, or when an app is deployed. The OpsWorks lifecycle events consist of the following, in order.
    1. setup
    2. configure
    3. deploy
    4. undeploy
    5. shutdown

- We're focusing on 2 of the 5 lifecycles with two written recipes, or scripts:
    - `setup.rb`, which contains 5 things:
        1. included recipes (recipes that need to be run from other cookbooks)
        2. Apt dependencies (i.e. machine level dependencies that need to be installed before running app)
        3. Init.d service (a service that enables starting and stopping of a long running app)
        4. Nginx config (our web server)
        5. Unicorn config (our production app server, setup unix socket to open lines of communication between Unicorn and Nginx)
    - `deploy.rb`, which contains 2 things:
        1. Git (allows Git checkout of latest version of Master branch)
        2. dependency installs (i.e. bundle, npm, compile webpack and rails assets)


### Special Thanks to
- [Gene Hallman](https://github.com/genehallman)
- [Kelly Chung](https://github.com/chungkikelly)

### Additional Resources
[AWS OpsWorks Overview and Demo w/ Chef](https://www.youtube.com/watch?v=cj_LoG6C2xk) - 15min YT video
