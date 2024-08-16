const counter = ()=>{
  let i = 0;
  const add = val =>i+=val;
  const subtract = val=>i-=val;
  const print = ()=>{return i};
  
  return {
    add,subtract,print
  }
}


const outerCounter = counter();

outerCounter.add(6);
outerCounter.subtract(1);
console.log(outerCounter.print());
//this can call i from the function outside the scope of the function due to closure