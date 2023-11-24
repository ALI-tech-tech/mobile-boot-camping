<?php
class Customer{
    private $db;
    private $tableName;
   

    public function __construct($db,$tableName)
    {
        $this->db=$db;
        $this-> tableName= $tableName;
      
    }

    
    public function getAllCustomers() {
        $sql = "SELECT * FROM $this->tableName";
         $result = $this->db->query($sql);
         return $result;
     }
     public function getCustomer($id) {
        $sql = "SELECT * FROM `$this->tableName` where `Id`=$id";
         $result = $this->db->query($sql);
         return $result;
     }
 
     
 function add($name,$phone, $type,$content )
 {
     
     $sql = "INSERT INTO  `$this->tableName` (name, phone,type, content) VALUES ('$name', '$phone','$type', '$content')";
     return $this->db->query($sql);
     $this->db->close();
 }
 
 function delete($id)  {
     

     $sql = "delete from `$this->tableName` where Id= $id";
     if ($this->db->query($sql) === true) {
         return true;
     } else {
         return false;
     }
 
 
     $this->db->close();
 }
 function update($id,$name,$phone, $type,$content)  {

     $sql = "UPDATE `$this->tableName` SET name='$name', phone='$phone',type='$type',content='$content' WHERE id=$id";
     if ($this->db->query($sql) === true) {
         return true;
     } else {
         return false;
     }
 
 
     $this->db->close();
 }
}



?>