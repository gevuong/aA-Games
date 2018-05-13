### Go Overview
- Can compile into executables that are compatible with Windows, Mac, or Linux without making any changes to your code. 
- Users won't need to install interpreters or virtual machines or anything to use Go app. Just give them a single executable file to run software.
- Docker and Kubernetes container systems were built using Go, and so is teamtreehouse's workspace.

### Go's Goal
- fast build, fast compilation that's compatible with Windows, Mac, or Linux.
- fast execution. The executables are native binaries, meaning there's no need for user's to download a separate runtime. 
- supports concurrency, meaning Go can take full advantage of multi-core computer processors
- supports garbage collection, which means Go automatically frees unused memory rather than explicitly writing code to free memory

### What does this make Go perfect for?
- web services, since Go can handle a lot of operations at once. 
- any host that allows binary executables, like most commercial web hosts.
- supported by Google App Engine, which gives you an easy way to deploy and scale web apps.

### What does Go not have?
- no class inheritance 
- no exceptions
- no function overloading, meaning you cannot create multiple versions of a fcn with different parameters.

### Initial Challenges w/ Go
- Setting up the go workspace to your desired directory other than $HOME (which in my case is /Users/GeorgeV.), using $GOPATH.

### Useful commands to run in CLI
- go build hello.go (compiles code and creates an executable binary file called, "hello")
- ./hello to run executable
- go run hello.go (compiles code and runs executable file in one command without the need to store an executable binary file). This prevents the need to make a bunch of executable files

- echo $GOPATH
- running "go get url_path" downloads the github package for us. For example, "go get github.com/golang/example/stringUtil" will download the stringUtil package.
- go run "filename"