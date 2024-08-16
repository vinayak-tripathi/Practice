class Fraction:
    def __init__(self,nr,dr=1):
        self.nr = nr
        self.dr = dr
        if self.dr < 0:    
            self.nr *= -1
            self.dr *= -1

    def show(self):
        if self.dr==1:
            print(f'{self.nr}')
        else:
            print(f'{self.nr}/{self.dr}')

    def multiply(self,new):
        if isinstance(new,int):
            new = Fraction(new)
        return Fraction(self.nr * new.nr , self.dr * new.dr)

    def add(self,new):
        if not isinstance(new,Fraction):
            new = Fraction(new)
        return Fraction(self.nr * new.dr + new.nr * self.dr, self.dr * new.dr)

f1 = Fraction(2,3)
f1.show()
f2 = Fraction(3,4)
f2.show()
f3 = f1.multiply(f2)
f3.show()
f3 = f1.add(f2)
f3.show()
f3 = f1.add(5) 
f3.show()
f3 = f1.multiply(5) 
f3.show()