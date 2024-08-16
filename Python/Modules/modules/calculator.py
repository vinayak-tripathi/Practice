def addNumbers(*args) -> float:
    """This is function to add numbers"""
    result =0
    for i in args:
        result+=i
    return result

def addList(x:list) -> float:
    result =0
    for i in x:
        result+=i

    return result

def multiply(*args):
    result = 1
    for i in args:
        result*=i
    return result