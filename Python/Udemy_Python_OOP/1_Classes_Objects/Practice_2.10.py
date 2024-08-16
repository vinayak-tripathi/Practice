class Circle:
    def __init__(self,radius):
        '''Enter Radius'''
        self._radius = radius
    
    def area(self):
        return 3.14*(self._radius**2)

    @property
    def diameter(self):
        return 2*self.radius

    @property
    def circumference(self):
        return 2*3.14*self._radius

    @property
    def radius(self):
        return self._radius
    
    @radius.setter
    def radius(self,new_radius):
        if new_radius<0:
            raise ValueError('Radius cannot be negative')
        else:
            self._radius = new_radius

c1 = Circle(7)
print( c1.radius, c1.diameter, c1.circumference, c1.area())