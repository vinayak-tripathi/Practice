class BankAccount:
    bank_name = 'VT Bank'
    def __init__(self, name, balance=0,bank = bank_name):
        self.bank = bank
        self.name = name
        self.balance = balance
        
    def display(self):
         print(self.name, self.balance,self.bank)
 
    def withdraw(self, amount):
        self.balance -= amount
 
    def deposit(self, amount):
        self.balance += amount
    
a1 = BankAccount('Mike', 200,'SBI')
a2 = BankAccount('Tom')
 
a1.display()
a2.display()