const add = function(a,b){
    return a+b;
  };
  
  const addArrow = (a,b)=> a+b;
  const square = a=> a**2;
  
  const makeList = (...x)=>{
    return x;
  }
  
  let list = makeList(1,2,3,4,4,5,5,6,6,6,677,6,3);
  console.log(typeof(list),list);
   //Arrow function doesnot have its own this keyword
   // it uses this lexically
  
  