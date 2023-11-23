<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php

$arr=array("Mohammed","Ali","Salem","Amal","Amani");
$search=$arr;
function contain($arr, $string){
    $res=array();
    foreach ($arr as $val) {

        if (str_contains( $val, $string) !== FALSE) {
            array_push($res, $val);
            
        }
    }
    return $res;
}

?>
<form  method="post">
<input type="text" name="searchtxt" >
<input type="submit" name="submit">

</form>

<?php

if (isset($_POST["submit"])) {
    $search=contain($arr, $_POST["searchtxt"]);
    display($search);
}else{
    $search=$arr;
    display($search);
}
function display($search){
    foreach ($search as $key) {
        echo $key;
        echo"<br>";
    }
}



?>
</body>
</html>