//Class and Prototyping
const Car = function(color){
    // this will be constructor of the Car class
    // it takes the argument color
    // we can restrict the user for defining this class as a function(without new keyword)
    // as  
    //if (!new.target) throw "Car is a class. Use new keyword to initialize it";
    this._color = color;// this suggests that the _color is internal property of the Car class
    
  }
  
  Car.prototype.getColor = function(){
    return this._color;
  }
  
  const ToyCar = function(color,model){
    Car.call(this, color); //this call the Car object with argument value as color
    this._model = model;
  }
  
  
  ToyCar.prototype = Object.create(Car.prototype);
  //If you add the toycar prototype before inheriting it from car, it will be overwritten by the prototype of the inherited class
  //so to add new protopype to the class , do it after inheriting the protoypes from the parent class
  ToyCar.prototype.getModel = function(){
    return this._model;
  }
  // THis defines that toycar prototype will contain the protypes contianed by Car
  // Bsically it inherits the car
  const blueCar = new Car('blue');
  console.log(blueCar.getColor());
  console.dir(Car);
  console.dir(ToyCar);
  const blueSpeedCar = new ToyCar('blue','speed');
  console.log(blueSpeedCar);
  //const grayCar = Car('gray');
  //above line call Car as function which has return undefined
  
  