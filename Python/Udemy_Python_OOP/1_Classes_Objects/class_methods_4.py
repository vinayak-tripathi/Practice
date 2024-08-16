
from datetime import datetime 

class Employee:
    def __init__(self,first_name,last_name,birth_year,salary):
        self.first_name = first_name
        self.last_name = last_name
        self.birth_year = birth_year
        self.salary = salary

    def show(self):
        print(f'''I am {self.first_name} {self.last_name} born in {self.birth_year}''')

class Person:
    def __init__(self,name,age):
        self.name = name
        self.age = age
    
    @classmethod
    def from_str(cls,s):
        name,age = s.split(',')
        return cls(name, int(age))
        
    @classmethod
    def from_dict(cls,d):
        return cls( d['name'], d['age'] )

    @classmethod
    def from_employee(cls,emp):
        name = emp.first_name + ' ' + emp.last_name
        age = datetime.today().year - emp.birth_year
        return cls(name,age)
        
    def display(self):
         print('I am', self.name, self.age, 'years old')

e1 = Employee('James', 'Smith', 1990,6000) 

p1 = Person.from_employee(e1)
p1.display()