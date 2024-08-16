const counter = ()=>{
    let i = 0;
    
    return {
      add(val){
        i+=val;
        return this; //this will return the instnace of the object 
        //this has been done for function chaining
      },
      subtract(val){
        i-=val
        return this;
      },
      print(){
        return i;
      }
    };
  }
  
  
  const outerCounter = counter();
  
  outerCounter.add(6);
  outerCounter.subtract(1);
  console.log(outerCounter.print());
  
  let output = outerCounter.add(6)
  .add(6)
  .add(6)
  .add(6)
  .add(6).print();
  
  console.log(output)
  //this can call i from the function outside the scope of the function due to closure