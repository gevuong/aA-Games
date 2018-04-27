# Welcome to Ruby Notes!

## TDD
### What is TDD? 
- a development process where tests are first written before application code.
- this is contrary to the common development process of first writing application code, then tests to cover important parts of the code. 
- the application code is written to pass written specs.

### Why would you want to do write tests first??
**0. Define the functionality by writing tests FIRST. Then implement with application code.**
1. test your application code immediately.
2. tests written first usually covers a lot of various edge cases, which isn't apparent when writing application code first.
3. implements a more definitive RGR(Red, Green, Refactor) workflow, so developers know what to work on.
4. avoids writing app code that's not necessary, and is not covered in the specs.
5. encourages developer to focus on modularity, which means breaking the application into smaller, testable chunks.

### Also...writing tests can make collaboration much easier. How?
    - For example, if a developer is working remotely, or recently joined a huge project, the developer can read the written specs to understand the functionality of a module. Written specs then become a form of communication, or documentation for the codebase.
    - Helps with refactoring large chunks of code after a team of developers have worked on the project. With tests, if anything breaks, you'll know where it came from. With tests, you'll understand the functionality of the module you're refactoring 

### Ok, so what's the proper TDD workflow like?
**Red, Green, Refactor** 
    1. Write tests and watch them fail (failed tests turn red). Important to ensure tests initially fail or you can encounter false positives.
    2. Write minimum amount of code to pass test (passed tests turn green).
    3. Refactor code you just wrote to make it clean.

### What can I use for testing code written in Ruby?
- rspec
    - a DSL made specifically for testing, has its own set of methods, syntax, and are all in Ruby code
- guard-rpsec 
    - a library that runs a tasks we specify (i.e. rspec tests) when files are modified. I have not used it before.


------

- Ruby is pass-by-value.

    ```
    def foo(bar)
        bar = 'reference'
    end

    baz = 'value'
    foo(baz)

    puts "Ruby is pass-by-#{baz}"
    ```

- What is the object-oriented way to get wealthy? Inheritance!
    - **There are two major ways in which super is called. If super is called without any arguments, the arguments passed to the method will be implicitly passed on to the parent class's implementation.**

- Polymorphism
    - Poly in Greek means "many", morph means "form" or "shape". In programming, it refers to the ability of using a single method in many ways depending on data input, or for many objects or other data types.
    - i.e. "+" symbol, because based on **data input** (i.e. 1 + 1, "1" + "1", [1] + [1]), the "+" method will either concat arrays, strings, or add integers. This is an example of how a single method morphs, depending on data type.
    - Can use polymorphism with inheritance, or with different objects

    ```
    class Person
        def initialize(first, last, age)
             @first_name = first
             @last_name = last
             @age = age
        end

        def introduce
              puts "Hi everyone. My name is #{@first_name} #{@last_name}."
        end
    end

    class Student < Person
        def introduce
              puts "Hello teacher. My name is #{@first_name} #{@last_name}."
        end
    end

    class Teacher < Person
        def introduce
              puts "Hello class. My name is #{@first_name} #{@last_name}."
        end
    end

    class Parent < Person     
        def introduce           
            puts "Hi. I'm one of the parents. My name is #{@first_name} #{@last_name}."     
        end
    end

    john = Student.new("John", "Doe", 18)
    john.introduce   #=> Hello teacher. My name is John Doe.
    ```

- Encapsulation
    - private methods are methods that can only be accessed within the class itself.
    - Good OO design: minimize interfaces between your classes. Code that is obviously meant for internal working of a class should be kept as private methods. Provide a simple interface, abstract away the lower level details. It's not necessary to leak internal concerns to those using the class (whether people or other code).
    - The more you expose to users of the class (whether people or other code), the more they will rely on those details. Whatever you expose will be that much harder to change later after others depend on it.
    - In other words, give your customers what they need, and nothing more.
