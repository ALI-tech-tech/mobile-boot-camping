<?php
// Include the model
include 'customer.php';

// Create a database connection
$db = new mysqli('localhost', 'root', "", 'bootcampp_db');
if ($db->connect_error) {
    die("Connection failed: " . $db->connect_error);
}
$editMode=false;
// Create an instance of the model
$customerModel = new Customer($db,'phptable');

// Check the requested action
$action = isset($_POST['action']) ? $_POST['action'] : '';

// Handle the actions
switch ($action) {
    case 'create':
        // Retrieve the form data
        $name = $_POST['name'];
        $type = $_POST['type'];
        $phone = $_POST['phone'];
        $content = $_POST['content'];

        // Create 
        $customerModel->add($name,$phone,$type,$content);
        break;
        case 'edit':
            $customer=array();
            $id = $_POST['Id'];
            $selectedCustomer = $customerModel->getCustomer($id);
            $selectedCustomer=$selectedCustomer->fetch_assoc();
            
            $editMode = true;
            
            break;
    case 'update':
        $id = $_POST['id'];

        // Retrieve the form data
        $name = $_POST['name'];
        $type = $_POST['type'];
        $phone = $_POST['phone'];
        $content = $_POST['content'];

        // Update 
        $customerModel->update($id, $name, $phone,$type,$content);
        break;

    case 'delete':
        $id = $_POST['id'];

        //Delete 
        $customerModel->delete($id);
        break;
}

// Get all 
$customers = $customerModel->getAllCustomers();


?>