class BankAccount:
    def __init__(self,name,balance=0):
        self.name = name
        self.balance=balance

    def display(self):
        print("Name: ", self.name)
        print("Balance: " ,self.balance)

    def withdraw(self,amount):
        self.balance-=amount

    def deposit(self,amount):
        self.balance+=amount

a1 = BankAccount('Mike', 200)
 
a2 = BankAccount('Tom')
 
a1.display()
a2.display()
 
a1.withdraw(100)
a2.deposit(500)
 
a1.display()
a2.display()