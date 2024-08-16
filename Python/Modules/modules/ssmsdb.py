def connect(server:str,database:str,username:str,password:str,driver='ODBC+Driver+17+for+SQL+Server'):
    '''This is the function that takes database details
    Returns as sqlalchemy connection object'''
    from sqlalchemy import create_engine
    try:
        engine = create_engine(
            "mssql+pyodbc://{0}:{1}@{2}/{3}?driver={4}".format(username,password,server,database,driver),
            echo=True,
        )
    except Exception as e:
        print('Connection not successful due to :\n',e)
        return None
    return engine

def insertQuery(conn,table:str,**kwargs):
    from sqlalchemy import text
    query = "Insert into "+table+str(tuple(kwargs.keys()))+" values"+str(tuple(kwargs.values()))
    result = conn.execute(
                text(query))
    return result

def selectQuery(conn,table:str):
    from sqlalchemy import text
    query = "Select * from "+table
    result = conn.execute(
                text(query))
    return result
 
def getTableList(conn):
    from sqlalchemy import text
    query = "SELECT CONCAT(Table_schema,'.',table_name) as [Tables] FROM INFORMATION_SCHEMA.TABLES Where TABLE_TYPE='BASE TABLE'"
    result = conn.execute(
                text(query))
    return result
