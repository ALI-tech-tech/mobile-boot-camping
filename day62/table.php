<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="" method="post">
        <input type="text" name="username">
        <input type="text" name="email">
        <input type="text" name="phone">
        <input type="text" name="country">
        <input type="submit" name="submit">
    </form>


<br>
<br>
<br>
<br>
<br>
    <table>
  <tr>
    <th>Username</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Country</th>
  </tr>
  <?php
  $arr=array();

  if (isset($_POST["submit"])) {
    array_push($_POST);
    foreach ($arr as $key =>$value ) {
        echo "<tr>";
            echo "<td>$value</td>";
        echo "</tr>";
        
    }
  } 
    
  ?>
 

</table>
</body>
</html>