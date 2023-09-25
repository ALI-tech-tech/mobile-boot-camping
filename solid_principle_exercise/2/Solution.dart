/*
-Gmail & Yahoo & Hotmail have the same method (send()) (need to use DEPENDENCY INVERSION PRINCIPLE)

*/


class message  {
  String? _msg;
 String? get getMsg => this._msg;

 set setMsg(String? msg) => this._msg = msg;
  void send() {
    print(getMsg);
  }
}

class Gmail extends message  {
  
}

class Yahoo extends message {
  
}

class Hotmail extends message {
 
}

class Notification {
  
 Send(message msgclass){
  
   msgclass.send();
 }
  
}

void main() {
  Notification notification = Notification();
  Gmail gmail=Gmail();
  Yahoo yahoo=Yahoo();
  Hotmail hotmail=Hotmail();
  notification.Send(gmail);
  notification.Send(yahoo);
  notification.Send(hotmail);

}