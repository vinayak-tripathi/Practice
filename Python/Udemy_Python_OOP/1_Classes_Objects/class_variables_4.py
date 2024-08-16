class Account():
       rate = 5
       def some_method(self): 
          print(self.rate, Account.rate, id(self.rate), id(Account.rate))
        #   self.rate = 10
          print(self.rate, Account.rate, id(self.rate), id(Account.rate))
     
a1 = Account()
a2 = Account()
a1.some_method() 

print('Account varible',Account.rate)
print('a1 class variable',a1.rate)
print('a2 class variable',a2.rate)

Account.rate = 7

print('\nAccount rate changed')
print('Account varible',Account.rate)
print('a1 class variable',a1.rate)
print('a2 class variable',a2.rate)

a1.rate = 10 # this creates a instance variable rate for that specific instance
print('\nAccount rate changed')
print('Account varible',Account.rate)
print('a1 class variable',a1.rate)
print(a1.__dict__)
print('a2 class variable',a2.rate)
print(a2.__dict__)