
 class UserService
{
    void Register(String email, String password)
   {
      if (!ValidateEmail(email))
         throw new Exception("Email is not an email");
         //var user = new User(email, password);
         //SendEmail(new MailMessage("mysite@nowhere.com", email) { Subject="HEllo foo" });

   }
     bool ValidateEmail(String email)
   {
     return email.contains("@");
   }
    bool SendEmail(String? message)
   {
     //_smtpClient.Send(message);
     return true;
   }

    void hashAndSavePassword(String password)
    {
        hashPassword();
        savePassword();
    }

     void hashPassword()
    {
        //hashing implementation
    }
     void savePassword()
    {
        //save to the db
    }
}

