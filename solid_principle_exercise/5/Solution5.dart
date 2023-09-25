/*
-create classes user,manageemail,Security & Db  (Single Responsibility Principle)
-
*/
 class UserService
{
  Db db=Db();
  manageemail mgemil=manageemail();
    void Register(String email, String password)
   {
      if (mgemil.ValidateEmail(email)){
         var user = new User(email, password);
         db.saveuser(user);
         mgemil.SendEmail(email);
        }
   }    
}
class User {
  String?email;
  String? password;
  Security sec=Security();
  User(this.email,String password){
     this.password=sec.hashPassword(password);
  }  
}

class manageemail {
    bool ValidateEmail(String email)
   {
     return email.contains("@");
   }
    bool SendEmail(String? message)
   {
     //_smtpClient.Send(message);
     return true;
   }
}

class Security {
  String hashPassword(String password)
    {
        //hashing implementation
        return "Password hashing";
    }
}

class Db {
  void saveuser(User user)
    {
        //save to the db
    }
}

