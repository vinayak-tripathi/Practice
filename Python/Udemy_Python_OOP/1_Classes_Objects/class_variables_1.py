class Person:
    species  = 'Homo sapiens'
    count = 0 # this will be incremented with evry instanization of class
    # above are the class variable that will be shared for object of same class
    def __init__(self,name,age):
        self.name = name
        self.age = age
        Person.count+=1

    def display(self):
         print(f'{self.name} is {self.age} years old')
         
p1 = Person('John',20)
p2 = Person('Jack',34)

p1.display()
p2.display()

print(Person.count)
p3=Person('Jill', 40)
p4=Person('Jane', 35)
print(Person.count) 