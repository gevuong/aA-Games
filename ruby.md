


- What is the object-oriented way to get wealthy? Inheritance!


- Polymorphism
    - Poly in Greek means "many", morph means "form" or "shape". In programming, it refers to the ability of using a single method in many ways depending on data input, or for many objects or other data types.
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
    - Giving your customers what they need, and nothing more.
