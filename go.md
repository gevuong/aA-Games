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
- Go is not an object-oriented programming language like Ruby, Python, or Java. So there's no idea of classes, or class inheritance. Instead, you create custom type declarations or use existing ones, and extend its functionality. This is the key difference between OOP approach and Go's approach.
- no exceptions
- no function overloading, meaning you cannot create multiple versions of a fcn with different parameters.


## Ok. With a bit of context, are you ready to Go? If so, continue on.

### What are some very useful GO commands I should know?
1. ```go run <insert_filename>``` - compiles code and runs executable file in one command without the need to store an executable binary file. This prevents the need to make a bunch of executable files. You can compile and execute a handful of files in one command 
    - For example: 
    ```
    go run first_file.go second_file.go third_file.go
    ```

2. ```go build <insert_filename>``` - compiles code and creates an executable binary file named after your filename
    - For example: ```go build hello_world.go``` creates a executable called ```hello_world``` 
    - To run executable file, simply run ```./hello_world```
3. ```go fmt``` - formats all code in each code in current directory
4. ```go install``` - compiles and installs a package, handles dependencies
5. ```go get <insert_url_path>``` - downloads raw source code of someone else's package, handles dependencies. 
    - For example: 
    ```
    // to download the stringUtil package
    go get github.com/golang/example/stringUtil 
    ```

6. ```go test``` - runs any test files associated with current package

### What does "package main" mean?
- There are two types of packages: executable packages, and reusable packages. 'main' is an executable package, meaning it is a package that can be compiled, and then "executed". However, **you must have function called "main"**, which is ran automatically when the program runs. For example, if your code has ```package apple```, and you run ```go build hello_world.go```, an executable will not be created.
- In other words, 'main' is the special name used for a package to tell Go that we want it to be turned into an executable file.
- Reusable packages are essentially packages that can be used as a dependency (helper code)
- The purpose of a package is to group together code with a similar purpose.

### What does 'import "fmt"' mean?
- import statements are used to gain access to another package inside the one we are authoring.

### How should a .go file be organized?
- First, always place package declaration
- Next, list all other packages we may need to import in this file
- Finally, add body of the file to implement logic that does something

### Basic, Fundamental Go Types 
- bool
- string
- int 
- float64 (i.e. number with a decimal after it)
- map
- array
- You can actually take an existing type (i.e. slice of string: []string), and extend its functionality by declaring a custom type (i.e. type deck []string). This is Go's approach, so this new deck type we're creating, extends, or kind of borrows all the behaviors of a slice of string (i.e. [] string). Similar to OOP approach, you define functions (i.e. instance methods) within classes to extend a class' functionality. In Go, with your custom type declaration, you can create your own custom functions that only work with that type. This is similar to instance methods only working with its respective class in OOP approach. This is the key difference between OOP approach and Go's approach.

### Types in Go
- Types need to be declared in Go. This is important for statically-typed languages, like C++, Java, and Go. Dynamically-typed languages, such as JavaScript, Ruby, and Python, does not care what values are being assigned to variables.
- Variables must first be initialized with the 'var variableName type' syntax before variable can be assigned to a value. 
- To initialize and assign variable, use ':=' operator for shorthand notation. **Use := syntax ONLY when defining a new variable!** 
    For example:
        ```
            var card string = "Ace of Spades"
            // which is equivalent to 
            card := "Ace of Spades
        ```

- Every function that returns a value needs to indicate what type of value it is returning. In this case, the function returns a type string.
    - For example:
        ```
        func newCard() string {
            return "Five of Diamonds"
        }
        ```

- Files in the same package can call functions defined in other files. This means running ```go run main.go state.go``` OR ```go run state.go main.go``` will work
    - For example:
        ```
            In main.go:
            package main
            
            func main() {
                printState()
            }


            In a separate file called state.go:
            package main
            
            import "fmt"
            
            func printState() {
                fmt.Println("California")
            }
        ```

### Arrays in Go 
- There are two basic data structures to handle list of records: array and slice. 
- An array is a fixed length of records. A slice is an array that can grow or shrink, meaning you can add or subtract records to a slice.
- **every element in a slice must be of same type (i.e. string, or int)**. Cannot have both values of type "int" and of type "string" in a slice.
- Slice is zero-indexed. To select a range in a slice, ```fruits[0:2]```, where 2 is exclusive. 
    - ```fruits[:2]``` - Go interprets this as start from the beginning of slice. 
    - ```fruits[2:]``` - Go interprets this as start at index 2 and include remaining elements in slice.

### Receiver Functions
- Similar to instance methods in OOP. 
- By creating a new type with a function that has a receiver, we are adding a 'method' to any value of that type.
- This means that any variable of type "deck" now gets access to print method. What does "d deck" mean? d is the variable containing copy of deck that can be used within function,  If you still don't get it, in main.go, "cards" is essentially the d variable in this case. "deck" is the type that we want to attach the print() method to.
- You can think of the receiver argument as "this" in Python or "self" in Ruby.
- By Go convention, call receiver argument the first letter of its type. So if you're writing a receiver function for type deck, then call receiver argument, "d".
- For example, this should print "Harry Potter". "b" represents the value of type "book": 
    ```
        package main

        import "fmt"

        type book string

        func (b book) printTitle() {
            fmt.Println(b)
        }

        func main() {
            var b book = "Harry Potter" // initializing and declaring variable, not using shorthand := syntax
            b.printTitle()
        }
    ```

### Loops in Go
- Code will not compile successfully if every declared variable is not used in our code. This means that if in the following example, index variable is not used, you will get a "index declared and not used" error.
- For example:
    ```
        colors := []string{"red", "green", "blue}
        for index, color := range colors {
            fmt.Println(index, color)
        }
    ```

- We're using ':=' syntax because for each iteration, we're basically throwing away previous idx and card that had been initialized and declared. So we need to re-initialize and re-declare those variables.



## Having trouble setting up Go? The following may be helpful.
- Use VSCode to write Go programs. Go to extensions and install Go. It should have over 3.3 million downloads. 
- Next, restart VSCode, and create a .go file. Click on "Missing Analysis Tools" and install all the missing tools.

### After installing latest version, my go version is still set to the older version in CLI. What do I do?
Try the following commands in CLI:
1. go version (see current version)
2. brew update 
3. brew upgrade golang
4. go version (version should update)