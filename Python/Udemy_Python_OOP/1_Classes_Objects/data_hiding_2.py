class Product:
    def __init__(self):
        self.data1 = 10
        self.__data2 = 20
              
    def methodA(self):
        pass
            
    def __methodB(self):
        pass

p = Product()
#print(p.__data2)
#p.__methodB()
print(p._Product__data2)
p._Product__methodB()
print(p.__dict__)