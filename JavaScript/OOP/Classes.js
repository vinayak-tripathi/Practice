//This internally uses ptototype internally
class Car{
  constructor(color){
    this._color = color;
  }
  
  getColor(){
    return this._color;
  }
  
  setColor(color){
    this._color = color;
  }
}

class ToyCar extends Car{
  constructor(color,model){
    super(color);
    this._model = model;
  }
  
  getModel(){
    return this._model;
  }
  
  setModel(model){
    this._model = model;
  }
}

let blueSpeedCar = new ToyCar("Blue","Speed");

console.dir(blueSpeedCar);

const blueCar = new Car('blue');
