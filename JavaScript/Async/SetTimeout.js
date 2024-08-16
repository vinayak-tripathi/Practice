console.log(1);
console.log(2);
window.setTimeout(()=>{console.log(3);},2000);
// this is the will be executed after 2sec
//since javascirpt is non blocking the program will move ahead and execute the next line
//then come back again to execute the above waiting code;
console.log(4);


window.setTimeout(()=>{console.log(5);},3000);

let i = 1;
setTimeout(()=>{
  console.log(i);
},2000);
//

let id = setInterval(()=>{
  console.log(1)
},1000)

setTimeout(()=>{
  clearInterval(id);
},3000)
