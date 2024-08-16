const todo = {
    play:{
        text:"Play",
        isDone:true    
    },
    study:{
        text:"Study",
        isDone:false
    }
}

const generateID = (str)=>{
    return str.replace(/[.,\/#!@$%\s\^&\*;:{}=\-_`~()]/g,"").toLowerCase();
}

const addUI = ()=>{
    let text ="";
    for(let i of Object.keys(todo)){
        if(todo[i].isDone){
            text += "<li>\
            <input type='checkbox' id='"+i+"' checked onclick = 'strike(\""+i+"\")'><label for='"+i+"' class='done'>" + todo[i].text+"</label></li>"
        }
        else{
            text += "<li>\
            <input type='checkbox' id='"+i+"' onclick = 'strike(\""+i+"\")'><label for='"+i+"' class='notdone' >" + todo[i].text+"</label></li>"
        }
    }
    console.log(text)
    document.getElementById("listedItems").innerHTML = text
}
const strike= (id)=>{
    console.log(id);
    if(document.getElementById(id).checked){
        document.querySelector("[for = "+id+"]").setAttribute('class',"done");
        todo[id].isDone = true;
    }
    else{
        document.querySelector("[for = "+id+"]").setAttribute('class',"notdone");
        todo[id].isDone = false;
    }
}

const addItem = ()=>{
    
    const str = document.getElementById("todoText").value;
    const idSuffix = generateID(str);
    if (str===''){return}
    item = {
        text:str,
        isDone:false
    };
    todo[idSuffix]=item;
    document.getElementById("todoText").value = "";
    addUI();
}




window.onload = function(){
    addUI();
    
}