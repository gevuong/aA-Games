## Go Overview
- Can compile into executables that are compatible with Windows, Mac, or Linux without making any changes to your code. 
- Users won't need to install interpreters or virtual machines or anything to use Go app. Just give them a single executable file to run software.
- Docker and Kubernetes container systems were built using Go, and so is teamtreehouse's workspace.
- A pass-by-value language. More info of what this means below.

### Go's Goal
- fast build, fast compilation that's compatible with Windows, Mac, or Linux.
- fast execution. The executables are native binaries, meaning there's no need for user's to download a separate runtime. 
- supports concurrency, meaning Go can take full advantage of multi-core computer processors
- supports garbage collection, which means Go automatically frees unused memory rather than explicitly writing code to free memory


### Hm, ok, Go sounds pretty awesome about now, but when would I want to use Go?
- web services, since Go can handle a lot of operations at once. 
- any host that allows binary executables, like most commercial web hosts.
- supported by Google App Engine, which gives you an easy way to deploy and scale web apps.


### What does Go not have?
- Go is not an object-oriented programming language like Ruby, Python, or Java. So there's no idea of classes, or class inheritance. Instead, you create custom type declarations or use existing ones, and extend its functionality. This is the key difference between OOP approach and Go's approach.
- no exceptions
- no function overloading, meaning you cannot create multiple versions of a fcn with different parameters.


## Ok. With this bit of context, are you ready to, Go? If so, continue on.

### What are some useful commands I should know?
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
- Every value has a type. 
- Every function has to specify the type of its arguments. 
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
- By Go convention, call the receiver argument, the first letter of its type. So if you're writing a receiver function for type deck, then call receiver argument, "d".
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

### Functions can return multiple values. Here are some examples:
- Example 1: title and pages will be a value and type of "War and Peace" and string, and 1000 and int, respectively. (string, int) specifies the type of each return value
    ```
    func getBookInfo() (string, int) {
        return "War and Peace", 1000
    }
    
    title, pages := getBookInfo()
    ```

- The following example returns "red" "yellow" "blue
    ```
    package main
 
    import "fmt"
    
    func main() {
        color1, color2, color3 := colors()
    
        fmt.Println(color1, color2, color3)
    }
    
    func colors() (string, string, string) {
        return "red", "yellow", "blue"
    }
    ```

- Example 2: returns "Red is an awesome color". How would you explain the 'describe' function below? Well, 'describe" is a function that has a receiver of type 'color' that requires an argument of type 'string', and returns a value of type 'string'.
    ```
        package main
        
        import "fmt"
        
        func main() {
        c := color("Red")
        
        fmt.Println(c.describe("is an awesome color"))
        }
        
        type color string
        
        func (c color) describe(description string) (string) {
        return string(c) + " " + description
        }
    ```

- Example 3: After calling "deal" and passing in "cards", does the list of strings that the "cards" variable point at change?  In other words, did we modify the 'cards' slice by calling 'deal'? We created two new references that point at subsections of the 'cards' slice. We never directly modify the slice that 'cards' is pointing at. So the answer is no, 'cards' will be the same before and after calling 'deal'.
    ```
        func main() {
            cards := newDeck()
        
            hand, remainingCards := deal(cards, 5)
        
            hand.print()
            remainingCards.print()
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


### What is a Byte Slice, or []byte?
- Well, a slice is like an array, where every element corresponds to an ASCII character code. You can go to asciitable.com, and turn a byte slice into a string.
- In other words, a byte slice is a computer-friendly way of representing strings
- For example:
    ```
    package main
    import "fmt"
    func main() {
        greeting := "Hi there!"
        fmt.Println([]byte(greeting)) // returns [72 105 32 116 104 101 114 101 33]
    }
    ```


### Type Conversion (i.e. converting type deck to a string)
- Example of how to convert a type 'deck' to type 'string' by using []string: 
    ```
        func (d deck) toString() string {
            return strings.Join([]string(d), ",")
        }

        // this line of code makes the conversion: []string(d)
    ```

- Example of how to convert a type 'string' to byte slice:
    ```
        func (d deck) saveToFile(filename string) error {
            return ioutil.WriteFile(filename, []byte(d.toString()), 0666)
        }

        // this line of code makes the conversion: []byte(d.toString()). The toString() refers to the example above.
    ```


### Testing in Go
- It is not like RSpec, Mocha, Jasmine, Selenium, etc. In Go, we use a very small interface or small set of functions to actually test our code, unlike other testing frameworks previously mentioned.
- Create a new file in our directory ending in `_test.go`. (i.e. `deck_test.go`)
- To run tests in a package, run the following command: `go test`
- To decide what tests to write, it's up to you as the developer to say, "What do I really care about when looking at this function or class?"
- Make sure to take care of any "clean up" when writing tests with Go. The Go testing framework does not  detect that you wrote some file and automatically attempt to "clean it up" for you by removing temporary testing file.


## Structs in Go
- Similar to a plain object in JavaScript, a hash in Ruby, a dictionary in Python.
- There are three ways of creating a struct.
    ```
    package main

    import "fmt"

    type person struct {
        firstName string
        lastName  string
    }

    // One method to declare a struct, implicit order:
    func main() {
        alex := person{"Alex", "Anderson"}
        fmt.Println(alex)
    }

    // Second (preferred) method to declare a struct:
    func main() {
        alex := person{firstName: "Alex", lastName: "Anderson"}
        fmt.Println(alex)
    }

    // Third method to declare a struct to have zero values in place:
    func main() {
        var alex person

        alex.firstName = "Alex"
        alex.lastName = "Anderson"

        fmt.Println(alex)
        fmt.Printf("%+v", alex)
    }
    ```

- The default values of different types are called zero values: "" - string, 0 - int, 0 - float, false - boolean.
- You can embed one struct inside of another struct. Here's an example:

    ```
    package main

    import "fmt"

    // custom type declarations person and
    type person struct {
        firstName string
        lastName  string
        contact   contactInfo
    }

    type contactInfo struct {
        email   string
        zipCode int
    }

    // Third method to declare a struct to have zero values in place:
    func main() {
        jim := person{
            firstName: "Jim",
            lastName:  "Party",
            contact: contactInfo{
                email:   "jim@gmail.com",
                zipCode: 94123,
            },
        }

        fmt.Println(jim)
        fmt.Printf("%+v", jim)
    }
    ```

## Go is a pass-by-value language. But what does that mean?
- **Whenever we pass a value into a fcn, either as a receiver or as an argument, Go copies that value in memory, and then the copy is made available inside the fcn. This means that the fcn by default will always work with a copy of the data structure.** 
- However, you can modify the actual underlying data structure through the use of pointers and memory addresses. 
- In the example below, when you pass the name `jim` into `updateName()`, Go first makes a copy of that struct, and then the copy is made available to `updateName()`. This meant that changes to the name did not propagate to the original `jim struct`. 

    ```
    package main

    import "fmt"

    // custom type declarations person and contactInfo
    type person struct {
        firstName   string
        lastName    string
        contactInfo // equivalent to contactInfo contactInfo
    }

    type contactInfo struct {
        email   string
        zipCode int
    }

    func main() {
        jim := person{
            firstName: "Jim",
            lastName:  "Party",
            contactInfo: contactInfo{
                email:   "jim@gmail.com",
                zipCode: 94123,
            },
        }

        jim.updateName("jimmy")
        jim.print()
    }

    func (p person) updateName(newFirstName string) {
        p.firstName = newFirstName
    }

    // receiver fcn that accepts a receiver of type person, which is an extension of type struct
    func (p person) print() {
        // fmt.Println(p)
        fmt.Printf("%+v", p)
    }
    ```

- &variable: give me the memory address of the value the variable is pointing at
- *pointer: give me the value this memory address is pointing at

- *pointer vs *type both are two completely different things. 
    - Whenever we see a *type in the receiver, we are looking for a pointer to said type. In example below, *person means we are looking for a pointer to a type person. 
    - *pointer takes the pointer and turns it into an actual value. We use *pointer when we want to manipulate the value the pointer is referencing. 

    - There are two different types of variables: one is pointing at a memory address, the other is pointing at a value, like jim struct. So here's the rule to remember:
        - **Turn address into value with *address** ex: *pointerToPerson turns a memory address, or pointer, in this case, jimPointer, into a value of jim struct.
        - **Turn value into address with &value**, ex: &jim turns value of jim into a pointer or memory address.

    - Example below: 
    ```
    package main

    import "fmt"

    // custom type declarations person and contactInfo
    type person struct {
        firstName   string
        lastName    string
        contactInfo // equivalent to contactInfo contactInfo
    }

    type contactInfo struct {
        email   string
        zipCode int
    }

    func main() {
        jim := person{
            firstName: "Jim",
            lastName:  "Party",
            contactInfo: contactInfo{
                email:   "jim@gmail.com",
                zipCode: 94123,
            },
        }

        // Use `&` operator to turn &jim into a memory address, or pointer, and assign it to jimPointer, the variable, jim, is located, and store in jimPointer. As a result, jimPointer is pointing to the memory address that the jim struct is located, not the value, jim. In short, jimPointer is pointing to a type person, or *person.
        jimPointer := &jim
        // fmt.Println(jimPointer)
        jimPointer.updateName("jimmy")
        jim.print()
    }

    // pointerToPerson is the memory address that "jim" is located at. This gives direct access to the value that is stored in that memory address, which is jim struct.
    func (pointerToPerson *person) updateName(newFirstName string) {
        (*pointerToPerson).firstName = newFirstName
    }

    // receiver fcn that accepts a receiver of type person, which is an extension of type struct
    func (p person) print() {
        // fmt.Println(p)
        fmt.Printf("%+v", p)
    }
    ```

### In summary, this is what you need to know about Go's pass-by-value concept 
- Whenever you pass an integer, float, string, or struct into a fcn, Go creates a copy of each argument and these copies are used inside of the fcn.

- The following example will print out the memory address that "Bill" is stored at.
    ```
    package main
    import "fmt"
    
    func main() {
    name := "Bill"
    
    fmt.Println(&name)
    }
    ```

- The `&` operator is used for turning a value to an address or pointer. When you see a `*` operator in front of a pointer, it will turn the pointer into a value.

- To get the latitude of newYork to update to 41.0, change the receiver type from `location` to `*location`, and `lo` to `*lo` in the fcn body. This will turn the pointer `lo` into a value type and then update it.
- `*location` in the receiver specifies the type of receiver the fcn expects, and that is a pointer to location struct.

    ```
    type location struct {
    longitude float64
    latitude float64
    }
    
    func main() {
    newYork := location{
    latitude: 40.73,
    longitude: -73.93,
    }
    
    newYork.changeLatitude()
    
    fmt.Println(newYork)
    }
    
    func (lo location) changeLatitude() {
    lo.latitude = 41.0
    }
    ```

- The following Println() returns "Bill"
    ```
    package main
    
    import "fmt"
    
    func main() {
        name := "Bill"
        updateValue(name)
        fmt.Println(name)
    }
    
    func updateValue(n string) {
        n = "Alex"
    }
    ```

- The following program uses a shortcut, where Go automatically assumes that even though newYork.changeLatitude() is using a value type, we probably meant to pass in a pointer to the newYork struct.
    ```
    package main
    
    import "fmt"
    
    type location struct {
    longitude float64
    latitude float64
    }
    
    func main() {
    newYork := location{
    latitude: 40.73,
    longitude: -73.93,
    }
    
    newYork.changeLatitude()
    
    fmt.Println(newYork)
    }
    
    func (lo *location) changeLatitude() {
    (*lo).latitude = 41.0
    }
    ```


- The following returns the string "Bill". My guess is that the `&` operator returns the memory address of name, and the `*` operator turns the memory address, or pointer, to the name value, which is "Bill".
    ```
    package main
    
    import "fmt"
    
    func main() {
        name := "Bill"
    
        fmt.Println(*&name)
    }
    ```

- The following program will print different addresses because everything in Go is pass by value. Take a glance at the following code snippet, which gets a pointer to name called `namePointer` and prints out the memory address of the pointer itself! Then in the function, we take the pointer that was passed as an argument and print out the address of that pointer too.
    ```
    package main
    
    import "fmt"
    
    func main() {
    name := "bill"
    
    namePointer := &name
    
    fmt.Println(&namePointer)
    printPointer(namePointer)
    }
    
    func printPointer(namePointer *string) {
    fmt.Println(&namePointer)
    }
    ```

### Gotchas in Go
- The following program actually updates the first string to "Bye". The `mySlice` value is still being copied before being passed into `updateSlice`. Why? A slice is a reference type because a slice contains a reference to the actual underlying list of records. Lets take a look at what I mean by reviewing the difference between an array and a slice. 

    ```
    package main

    import (
        "fmt"
    )

    func main() {
        mySlice := []string{"Hi", "Bye"}
        
        updateSlice(mySlice)
        fmt.Println(mySlice)
    }

    func updateSlice(s []string) {
        s[0] = "Bye"
    }
    ```

- An array is a primitive data structure, cannot be resized, and is rarely used directly. A slice can grow and shrink, and is used 99% of the time for list of elements. 
- When you create a slice, Go internally creates two separate data structures, a slice, which contains the length of slice, capacity of slice, and a pointer to the head of the underlying array which contains the actual list of items, and an array, which contains the list of items.
- **When you pass a slice in a fcn, Go's pass-by-value still makes a copy of slice. The pointer in the copy of slice points to the head of the same array as the pointer in the original slice. So when you modify the array or slice, you are still modifying the array because both the original and copy slice points to the same array.**

- When you create a slice, Go will automatically create an array and a structure that records the length of slice, capacity of slice, and a reference to the underlying array.


### Value Types vs Reference Types 
- **Value types: int, float, string, boolean, struct. If you pass these types into a fcn, you want to use pointers to change these values in a fcn.**
- With value types in Go, we need to worry about pointers if we want to pass a value to a fcn and want to modify the original value inside that fcn. With reference types, we do not need to worry about pointers. 
- **Reference types: slices, maps, channels, pointers, functions. Reference types reference to another data structure in memory. You don't need to worry about pointers with these types because the copy Go makes is always going to be pointing back to the same underyling true source of data.**



### Map (Reference Type)
- Equivalent to a hash in Ruby, object in JavaScript, or dictionary in Python.
- Three ways to declare a map: 
    ```
    package main

    import "fmt"

    // create a map with keys and values as strings
    func main() {
        // second method to create a map
        // var colors map[string]string

        // third method to create an empty map with no key value pairs inside
        colors := make(map[int]string)

        // first method to create a map
        // colors := map[string]string{
        // 	"red":   "#ff0000",
        // 	"green": "00ff00",
        // }

        // to add a key-val pair to empty map
        colors[10] = "#ffffff"

        // to remove keys and values off of existing map
        delete(colors, 10)

        fmt.Println(colors)
    }
    ```

- The following program would return `map[dog:bark cat:purr]`. 
    ```
    package main
    import "fmt"
    
    func main() {
    m := map[string]string{
    "dog": "bark",
    }
    
    changeMap(m)
    
    fmt.Println(m)
    }
    
    func changeMap(m map[string]string) {
    m["cat"] = "purr"
    }
    ```

- The following program would throw an error because the variable key was created but never used. 
    ```
    package main
    import "fmt"
    
    func main() {
    m := map[string]string{
    "dog": "bark",
    "cat": "purr",
    }
    
    for key, value := range m {
    fmt.Println(value)
    }
    }
    ```

### Map vs Struct. Here are the differences between the two:
- Map
    - all keys must be the same type. Some keys in a single map may not be of type `int` and others of type `string`. This applies with values as well.
    - all values must be the same type
    - keys are indexed, we can iterate through all the key-value pairs
    - a reference type, meaning when we pass a map to a fcn, we are not copying the map, we are copying a reference to the map. In other words, we are passing a reference to the underlying data structure.

- Struct 
    - values can be of different type, keys are strongly-typed, the key names or property names are predefined
    - keys don't support indexing, we cannot iterate through all the key-value pairs, or properties. 
    - a value type, meaning when we pass a struct to a fcn, we make a copy of the entire struct, so when we change the struct, it did not modify the struct created outside of the fcn.


### Ok, so when would I want to use a Map or a Struct?
- Use a map when you want to represent a collection of very closely related properties.
- With a map, you do not need to know all the keys at compile time. With a map, you can freely add or delete keys over time as you please. With a struct, you need to clearly define all the different property names and all their types at compile time. 
- So if you don't know what the collection of keys or values are going to be at compile time, then you have a great use case for a map. But if you know that you're always going to be working with certain keys or properties, then you would want to use a struct. 


## Interfaces!!!...um, what are they? 
- Interfaces are not generic types. Unlike C# or Java which has access to generic types, Go does not have generic types. Interfaces are not replacements for generic types. Not sure what generic types are...
- Interfaces are 'implicit', meaning we don't have to explicitly define which custom types (i.e. type englishBot, spanishBot) satisfy an interface (i.e.`type bot interface`). 

### What do you mean by "satisfy" an interface? 
- A type satisfies an interface when the type implements all the functions contained in the interface definition.

- Interfaces are about helping reuse code, or form a contract to help us manage types. Lets be clear, interfaces are not used to make sure your code is running correctly, or some built-in test. If some custom logic written in a function is broken, then interfaces won't help.
- Writing your own interfaces is tough and requires experience. Step 1 is to undertand how to read them in the standard lib documentation. 
- You can write 1000's of lines of Go code without worrying about writing your own interfaces. Interfaces are not a requirement of writing Go language. Although it's highly recommended for code clarity and quality.

- Example of interface syntax
    ```
    interface syntax
    type interfaceName interface {
        getGreeting(input list of argument types) (input list of return types)
    }

    i.e.
    type bot interface {
        getGreeting(string, int) (string, error)
    }
    ```

- Another purpose of using interface (i.e. Reader) is to provide a common output (i.e. []byte) for all different sources of data inputs (i.e. text file, image file, HTTP request body, data from analog sensor, etc). This means that all the different source of inputs can implement the Reader interface.

- **Concrete types** are types that can create a value: map, struct, int, string, `englishBot` (from custom example). You can create a value of type `englishBot`, int, string, etc. But you cannot create a value of type `bot`, because it is of type `interface`.
- **Interface type**: `bot` (from custom example). You cannot create a value directly out of interface type.

- In the following program, `square` satisfies the `shape` interface because square defines the `area` function and returns an `int`.
    ```
    type shape interface {
        area() int
    }
    
    type square struct {
        sideLength int
    }
    
    func (s square) area() int {
        return s.sideLength * s.sideLength
    }
    
    func printArea(s shape) {
        fmt.Println(s.area())
    }
    ```

- In the following program, `rectangle` type does not satisfy the `shape` interface because `rectangle's` version of the `area` function returns a `float64`, but the `shape` interface expects a return type of `int`.
    ```
    type shape interface {
        area() int
    }
    
    type square struct {
        sideLength int
    }
    
    type rectangle struct {
        height float64
        width float64
    }
    
    func (s square) area() int {
        return s.sideLength * s.sideLength
    }
    
    func (r rectangle) area() float64 {
        return r.height * r.width
    }
    
    func printArea(s shape) {
        fmt.Println(s.area())
    }
    ```

- In the following program, type `square` appears to successfully implement the `shape` interface, but the implementation of `square's` `area` function looks broken - it always returns a value of 10 no matter what the side length of the `square` is. The `shape` interface will not do anything to help us catch this error. Interfaces are only used to help with types. We can still easily write code that does something completely wrong.
    ```
    type shape interface {
        area() int
    }
    
    type square struct {
        sideLength int
    }
    
    type rectangle struct {
        height float64
        width float64
    }
    
    func (s square) area() int {
        return s.sideLength * s.sideLength
    }
    
    func (r rectangle) area() float64 {
        return r.height * r.width
    }
    
    func printArea(s shape) {
        fmt.Println(s.area())
    }
    ```

- Imagine that you ask a coworker to create a new type that implements the Reader interface to take data from a text file and print it on the screen. They present you with the following code. They say that this code successfully compiled, so it must be correct. You then review their code and give them feedback. I would say that while the `textFileReader` type conforms to the requirements of the `Reader` interface, it doesn't implement the desired behavior of reading the file from a hard drive. 
    ```
    type textFileReader struct {}
    
    func (textFileReader) Read(bs []byte) (int, error) {
        return "Information from a text file"
    }
    ```

- Take a look at the type File inside the os package here: https://golang.org/pkg/os/#File. Does the File type satisfy both the Reader and Writer interfaces? Yes, because the `File` type defines the `Read` function for the `Reader` interface and `Write` function for the `Writer` interface. 


## Read and Write in Go 
- Types that implement the Reader interface are generally used to read information from an outside data source into our application.



## Channels and Go Routines 
- When we are launching or executing a Go program, we automatically create one Go routine. It is something that exists inside of our running program or process.
- A Go Routine executes our code line-by-line.
- To create a new thread Go routine, simply add `go` in front of the function (i.e. http.Get()).

### But what goes on under the hood when implementing multiple Go routines?
- Behind the scenes, there is something called a Go scheduler that works with one CPU on your machine. The Go scheduler runs only one routine at any given time until it finishes running a function or makes a blocking call (i.e. http.Get())
- Purpose of the Go scheduler is to monitor the code inside each Go routine. 
- So, even though we are spawning multiple Go routines, they are not truly executing at the same time whenever we have one CPU. This one CPU is only running the code of one Go routine at a time, and we rely on the Go scheduler to decide which Go routine is executed.
- By default, Go uses one CPU core. Keep in mind that when we have one CPU, the Go routine execution might change back and forth between multiple Go routines. 
- However, if we have multiple CPU cores, then we can run multiple Go routines at the same time.
- There is a main Go routine, and child Go routines. When we launch the Go program, we are creating a main Go routine. All other Go routines using the `go` keyword are considered child Go routines, and do not have the same level of "respect" as the main Go routine.
- Only use `go` keyword in front of function calls! 

###Concurrency is not parallelism
- Concurrency means we can load up (or schedule) multiple Go routines at a time. Our program has the ability to run different Go routines, and change between them, kind of at the same time (or on the fly) with the help of the Go scheduler.
- Concurrency means we can have multiple threads executing code. If one thread blocks, then another Go routine is picked up and worked on.

- Parallelism is achieved only when we have multiple CPU cores. Multiple threads can be executed at the exact same time, but requires multiple CPUs.
- Parallelism means we can literally do multiple things (i.e. run multiple Go routines) at the same time.

### Channels 
- When launching a Go program, the main routine exits when there is no more lines of code to execute, without considering whether any of its child Go routines are finished executing. We need to include a channel to fix this issue.
- Channels are used to communicate inbetween different running Go routines. It is the only way to communicate between routines. We use a channel to make sure the main routine is aware of which child routine has finished running. 
- Think of a channel as an intermediary between discussions of routines on our local machine, like text messaging channels. We can send some data to a channel and it automatically get sent to any other **running** routine that has access to that channel.
- We can create channels as values that can be passed around. Channels are typed, just like any other variable. The information or data that we pass into a channel must all be of the same type (i.e. string, int, etc.) There would be a type error if you shared a float inside a type string or type int inside a channel.

### Sending data with channels
- `channel <- 5`: send the value '5' into this channel 
- `myNumber <- channel`: wait for a value to be sent into the channel. When we get one, assign the value to `myNumber`.
- `fmt.Println(c<- channel)`: wait for the value to be sent into the channel. When we get one, log it out immediately. 
- **Receiving messages from a channel is blocking line of code!**

## Having trouble setting up Go? The following may be helpful.
- Use VSCode to write Go programs. Go to extensions and install Go. It should have over 3.3 million downloads. 
- Next, restart VSCode, and create a .go file. Click on "Missing Analysis Tools" and install all the missing tools.

### After installing latest version, my go version is still set to the older version in CLI. What do I do?
Try the following commands in CLI:
1. go version (see current version)
2. brew update 
3. brew upgrade golang
4. go version (version should update)