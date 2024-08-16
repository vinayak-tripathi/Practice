const willCleanTheRoom = new Promise((resolve, reject)=>{
    let cleanRoom = true;
    if(cleanRoom){
      resolve("room is clean");
    }
    else{
      reject("room is still dirty");
    }
  });
  
  const removeGarbage = new Promise((resolve, reject)=>{
    let removeGarbage = false;
    if(removeGarbage){
      resolve('garbage remove');
    }
    else{
      reject("garbage not removed");
    }
  });
  
  const rewards = new Promise((resolve, reject)=>{
    let rewardsGiven = true;
    if(rewardsGiven){
      resolve('Rewards given');
    }
    else{
      reject('Rewards not given');
    }
  })
    
  willCleanTheRoom.then((resolveStatus)=>{
    console.log(resolveStatus);
    return removeGarbage;
  }).then((resolveStatus)=>{
    console.log(resolveStatus);
    return rewards
  }).then((resolveStatus)=>{
    console.log(resolveStatus);
  }).catch(rejectStatus=>{
    console.log(rejectStatus);
  })
  