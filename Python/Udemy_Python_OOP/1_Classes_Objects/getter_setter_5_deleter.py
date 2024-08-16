class Product:
    def __init__(self,x,y):
        self._x = x
        self._y = y
        
    def display(self):
        print(self._x, self._y)
    
    @property
    def value(self):
          return self._x

    @value.setter
    def value(self, val):
         self._x = val
    
    @value.deleter
    def value(self):
          # this defines what happens when the value or attribute is attempted to delete
          # either you can raise a error or make an acknowldgement
          print('value deleted')
          #******you will have to specify here to delete as del self.value
        #   del self.value
    
    @property
    def y(self):
         return self._y
 
    @y.setter
    def y(self, val):
         self._y = val

p = Product(12,24)
print(p.value)
print(p.__dict__)
del p.value
print(p.__dict__)
print(p.value)