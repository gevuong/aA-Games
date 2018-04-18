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
    - There are two major ways in which super is called. If super is called without any arguments, the arguments passed to the method will be implicitly passed on to the parent class's implementation.

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
