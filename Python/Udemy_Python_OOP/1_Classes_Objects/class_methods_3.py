class Person:
    def __init__(self,name,age):
        self.name = name
        self.age = age

    @classmethod
    def from_str(cls,s):
        # these are factory methods that instialize the 
        # objects using different mode
        # since function overloading is not allowed (no muliple init method)
        #we have to rely on factory methods using class method
        name,age = s.split(',')
        return cls(name, int(age))
        
    @classmethod
    def from_dict(cls,d):
        return cls( d['name'], d['age'] )

    def display(self):
         print('I am', self.name, self.age, 'years old')
         
p1 = Person('John', 20)
p2 = Person('Jim', 35)

s = 'Jack, 23'
d = {'name': 'Jane', 'age':34}
            
p3 = Person.from_str(s)
p3.display()

p4 = Person.from_dict(d)
p4.display()