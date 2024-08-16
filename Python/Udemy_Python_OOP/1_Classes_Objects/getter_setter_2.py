class Person:
         def __init__(self, name, age):
              self.name = name
              self.age = age #this calls the setter method
         
         def display(self): 
               print(self.name,self.age)

         @property
         def age(self):
             return self._age

         @age.setter
         def age(self, new_age):
              #age validation done
              if  20< new_age<80:
                self._age = new_age
              else:
                 raise ValueError('Age must be between 20 and 80')

p = Person('Peter', 30)
print(p.age)
p.age = 200
print(p.age)

p1 = Person('Dev',200)
p.age = p.age +1
p.age += 1
print(p.age)
