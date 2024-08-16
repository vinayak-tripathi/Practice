 const profile = {
   name:"john",
   age:30,
   single:true,
   "got a job": true,
   kids:[{
     name:"peter",
     age: 3
   },{
       name:"peter",
       age:2
   }]
 };

for (let prop in profile){
  console.log(`${prop}--> ${profile[prop]}`);
  
}

for (let key of Object.keys(profile)){
  console.log(`${key} --> ${profile[key]}`);
}

