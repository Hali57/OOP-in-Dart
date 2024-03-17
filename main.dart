// create a class that uses inheritance and abstraction
// showcase a class that overrides an inherited method
// create an instance of the class and initialize it with data from a file.
//showcase a method that utilizes a loop.

import "dart:io";

abstract class Vehicle{ //abstraction
  // abstract methods
  void startCar();

  void stopCar();
}

class Car extends Vehicle{ // inheritance
  String? make;
  String? model;
  int? year;

  //constructor
  Car(this.make, this.model, this.year);

  @override
  void startCar(){
    print("The car is Starting \n");
  }

  @override
  void stopCar(){
    print("The car is stopping \n");
  }

  void accelerate(){
    print("Pedal to the metal!!! \n");
  }

  // a method that utilizes a loop
  void needService(){
    stdout.write("Does your car need servicing? y / n:  \n");
    String? choice = stdin.readLineSync();

    for(int i=0; i<3; i++){
      if(choice == 'y' || choice =="Y"){
        print("Repairs In Progress. Please wait..... ");
      }
    }
    print("You are all set!!. Happy driving and remember to stay safe out there. Goodbye.");

  }

}

void main(){
  // initialize a class instance with values from a file
  // open file
  File file = File("file.txt");

  // read lines from the file
  List<String> lines = file.readAsLinesSync();

   // initialize the class instance with file data
   List<Car> myCar = lines.map((line){
              List<String> sections = line.split(",");
              String make =sections[0];
              String model = sections[1];
              int year = int.parse(sections[2]);

              return Car(make, model, year);
   }).toList();

   for(var car in myCar){
    print("Your favorite car is the ${car.make}, its model is the ${car.model} and it was launched in the year ${car.year} \n");

    car.needService();
   }
}