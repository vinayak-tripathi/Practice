class Person:
    # class name camelformat
    # you can use any varibale name instead of self. 
    # But it is a convention to used self to define the object that the function is refering to
    def set_details(self, name, age):
        self.name = name
        self.age = age

    def display(self):
        print('I am ', self.name)

    def greet(self):
        if self.age < 80:
              print('Hi, How are you doing ?')
        else:
              print('Hello, How do you do ?')
        self.display()
    
#creating instance object
p1 = Person()
p2 = Person()

print(id(p1),p1)
print(id(p2),p2)

p1.set_details('Bob', 20)
p1.greet()

p2.set_details('Ted', 90)
p2.greet()
