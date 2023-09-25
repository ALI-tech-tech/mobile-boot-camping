/*
-class Animal has properties do not suit with all subclass (need to use Liskov Substitution Principle)
-create new class Flying & extends from Animal class then move fly() method to Flying class 
-next make Bird class extend from Flying class (Note* : Flying class & Animal class are interface's)
*/

abstract class Animal {
  void makeSound();

  void walk();

  void eat();

  
}
abstract class Flying extends Animal {
  void fly();
}
class Cat extends Animal {
  @override
  void eat() {
    // implement eat
  }

  @override
  void makeSound() {
    // implement makeSound
  }

  @override
  void walk() {
    // implement walk
  }
}

class Dog extends Animal {
  @override
  void eat() {
    // implement eat
  }

  @override
  void makeSound() {
    // implement makeSound
  }

  @override
  void walk() {
    // implement walk
  }
}

class Bird extends Flying {
  @override
  void eat() {
    // implement eat
  }

  @override
  void fly() {
    // implement fly
  }

  @override
  void walk() {
    // implement walk
  }

  @override
  void makeSound() {
    // implement makeSound
  }
}

void main() {}