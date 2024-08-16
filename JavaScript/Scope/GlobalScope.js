let globalVar = 2; //Since this is at the topmost this will become the property of window
window.globalVariable = 2;

if (true){
  let localVar = 45;
  //THis will remain in the scope of this block only not outside this
  invalid = -1;
  // Here no keyword is used before then it will automatically put it in the global scope
  // This should not be done 
}

if (true){
  console.log(globalVar);
  console.log(globalVariable);
  console.log(invalid);
  globalVar = 56565;
  console.log(globalVar);//THis changes the global variable
}
console.log(window);
console.log(globalVar);