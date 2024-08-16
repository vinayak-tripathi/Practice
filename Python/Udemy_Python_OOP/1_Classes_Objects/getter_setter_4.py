class Rectangle():
    def __init__(self,length,breadth):
           self.length = length
           self.breadth = breadth

    # def __init__(self,length,breadth):
    #        self.length = length
    #        self.breadth = breadth
    #        self.diagonal = (self.length*self.length + self.breadth * self.breadth)**0.5 
    #        #this will not be updated
    def area(self):
          return self.length * self.breadth

    def perimeter(self):
          return 2*(self.length + self.breadth)

    @property
    def diagonal(self):
          #this will make the property dynamic
          # whenever the values are changed and you call the property then updates value is returned
          # but if this is a instance variable which calculates its value in __init__ then this will not be updated
          return (self.length*self.length + self.breadth * self.breadth)**0.5 

r = Rectangle(2,5)
print(r.diagonal)
r.length = 10
print(r.diagonal)