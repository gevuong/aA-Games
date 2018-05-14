## Go Overview
- Can compile into executables that are compatible with Windows, Mac, or Linux without making any changes to your code. 
- Users won't need to install interpreters or virtual machines or anything to use Go app. Just give them a single executable file to run software.
- Docker and Kubernetes container systems were built using Go, and so is teamtreehouse's workspace.

### Go's Goal
- fast build, fast compilation that's compatible with Windows, Mac, or Linux.
- fast execution. The executables are native binaries, meaning there's no need for user's to download a separate runtime. 
- supports concurrency, meaning Go can take full advantage of multi-core computer processors
- supports garbage collection, which means Go automatically frees unused memory rather than explicitly writing code to free memory

### Hm, Go sounds pretty awesome right about now, but when would I want to use Go?
- web services, since Go can handle a lot of operations at once. 
- any host that allows binary executables, like most commercial web hosts.
- supported by Google App Engine, which gives you an easy way to deploy and scale web apps.

### What does Go not have?
- no class inheritance 
- no exceptions
- no function overloading, meaning you cannot create multiple versions of a fcn with different parameters.


## Ok. With a bit of context, are you ready to Go? If so, continue on.

### What are some very useful GO commands I should know?
1. ```go run <insert_filename>``` - compiles code and runs executable file in one command without the need to store an executable binary file. This prevents the need to make a bunch of executable files. You can compile and execute a handful of files in one command 
    - For example: ```go run first_file.go second_file.go third_file.go```
2. ```go build <insert_filename>``` - compiles code and creates an executable binary file named after your filename
    - For example: ```go build main.go``` creates a executable called ```main``` 
    - To run executable file, simply run ```./main```
3. ```go fmt``` - formats all code in each code in current directory
4. ```go install``` - compiles and installs a package
5. ```go get``` - downloads raw source code of someone else's package
6. ```go test``` - runs any test associated with current package

- echo $GOPATH
- running "go get insert_url_path_here" downloads the github package for us. For example, "go get github.com/golang/example/stringUtil" will download the stringUtil package.

## Do you have initial challenges w/ setting up Go? Me too.
- Setting up the go workspace to your desired directory other than $HOME (which in my case is /Users/GeorgeV.), using $GOPATH.

### After installing latest version, my go version is still set to the older version in CLI. What do I do?
Run the following commands in CLI:
1. go version (see current version)
2. brew update 
3. brew upgrade golang
4. go version (version should update)