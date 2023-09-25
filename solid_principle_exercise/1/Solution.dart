/* 
-from violation1.dart file seen three classes (TeamLead,Manager,Programmer) 
-TeamLead & Manager have two method seems to other : solution create  class(manage) as interface & 
-make it abstract to prevent create object then create two method (AssignTask(),CreateSubTask()),
-next implement manage class to (TeamLead & Manager) & remove old method then implement parent class method
-TeamLead & Programmer hav the same method solution create  class(work) as interface &
-make it abstract to prevent create object then create  method (WorkOnTask),
-then implement it;
==> TeamLead has some method of manager & method of Programmer (need to apply Interface Segregation Principle )
 
-Create two class as interfaces (manage,work) 
*/
abstract class work{
  void WorkOnTask() {}
}
abstract class manage {
  void AssignTask() {}
  void CreateSubTask() {}
}

class TeamLead implements manage,work {
  @override
  void AssignTask() {
    // TODO: implement AssignTask
  }
  
  @override
  void CreateSubTask() {
    // TODO: implement CreateSubTask
  }
  
  @override
  void WorkOnTask() {
    // TODO: implement WorkOnTask
  }
}

class Manager implements manage {
  @override
  void AssignTask() {
    // TODO: implement AssignTask
  }

  @override
  void CreateSubTask() {
    // TODO: implement CreateSubTask
  }
  
  
}

class Programmer implements work {
  @override
  void WorkOnTask() {
    // TODO: implement WorkOnTask
  }
  
}