from modules.calculator import addList,multiply
from modules.ssmsdb import connect,getTableList

lis = [1,2,4,5]
print('The sum of the list is :',addList(lis))
ans = multiply(1,4,5,3,2)
print('The muitplication of numbers is',ans)

print("-----Database-----")
server = 'IN1-GOV-WSQL120.ad-dev.issgovernance.com,4400' # to specify an alternate port
database = 'Jan23TrainingDB18' 
user = 'Jan23TrainingDB18' 
password = 'Jan23TrainingDB18'
# enter driver name replacing space by +
driver = 'ODBC+Driver+17+for+SQL+Server'
conn = connect(server,database,user,password)
res = getTableList(conn)
for i in res.fetchall():
    print(i['Tables'])
# print(addList([1,2,3,4,5,6]))


