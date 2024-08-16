class Employee:  
    allowed_domains = {'yahoo.com', 'gmail.com', 'outlook.com'}
    domains = set()  

    def __init__(self,name,email):
        self.name = name
        self.email = email

    def display(self):
        print(self.name, self._email)

    @property
    def email(self):
        return self._email
    
    @email.setter
    def email(self,current_email):
        current_domain = current_email.split('@')[-1]
        if current_domain in Employee.allowed_domains:
            self._email = current_email
            Employee.domains.add(current_domain)
        else:
            raise RuntimeError(f'Emails with {current_domain} not allowed')
            
e1 = Employee('John','john@gmail.com')
e2 = Employee('Jack','jack@yahoo.com')
e3 = Employee('Jill','jill@outlook.com')
e4 = Employee('Ted','ted@yahoo.com')
# e5 = Employee('Tim','tim@xmail.com')
# e5.display()

# e4.email = 'ted@ymail.com'
# e4.display()

e3.email = 'jill@gmail.com'
e3.display()