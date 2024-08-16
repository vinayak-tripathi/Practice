console.dir(localStorage)
localStorage.setItem("name","Vinayak");
localStorage.getItem(localStorage.getItem('name'));

const profile = {name:'Vinayak',age :21};

localStorage.setItem('profile',JSON.stringify(profile));

console.log(JSON.parse(localStorage.getItem('profile')));

for(let i =0 ; i<localStorage.length; i++){
  console.log(localStorage.key(i));
}


// for(let i =0 ; i<localStorage.length; i++){
//  console.log(localStorage.removeItem(localStorage.key(i));
// }
localStorage.clear();
console.log(localStorage)