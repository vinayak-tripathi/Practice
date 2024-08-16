class Fraction:
    def __init__(self,nr,dr=1):
        self.nr = nr
        self.dr = dr
        if self.dr < 0:    
            self.nr *= -1
            self.dr *= -1

        self._reduce()

    def show(self):
        if self.dr==1:
            print(f'{self.nr}')
        else:
            print(f'{self.nr}/{self.dr}')

    def multiply(self,new):
        if isinstance(new,int):
            new = Fraction(new)
        f = Fraction(self.nr * new.nr , self.dr * new.dr)
        f._reduce()
        return f

    def add(self,new):
        if not isinstance(new,Fraction):
            new = Fraction(new)
        f =  Fraction(self.nr * new.dr + new.nr * self.dr, self.dr * new.dr)
        f._reduce
        return f

    def _reduce(self):
        h = Fraction.hcf(self.nr,self.dr)
        if h==0: return
        self.nr//=h
        self.dr//=h

    @staticmethod
    def hcf(x,y):
        x =abs(x)
        y =abs(y)
        s = min(x,y)
        while s>0:
            if x%s==0 and y%s==0:break
            s-=1
        return s

f1 = Fraction(2,3)
f1.show()
f2 = Fraction(2,-3)
f2.show()
f3 = Fraction(-6,-6)
f3.show()

print(Fraction.hcf(4,8))
print(f1.hcf(4,12))