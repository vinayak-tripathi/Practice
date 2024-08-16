const doChore= async ()=>{
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
      let removeGarbage = false ;
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
    });
      try{
        let isRoomClean = await willCleanTheRoom;
      }catch(err){
        console.log(err);
      }
      
      try{
        let isGarbageRemoved = await removeGarbage;
      }catch(err){
        console.log(err);
      }
      
      try{
        let isRewardGiven = await rewards;
      }catch(err){
        console.log(err);
      }
      console.log(isRoomClean, isGarbageRemoved, isRewardGiven);
    };
    
    doChore();
      
    
    