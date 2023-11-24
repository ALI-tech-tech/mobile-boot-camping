<?php
include 'vm.php';

?>

<!DOCTYPE html>
<html>

<head>
    <title>Display Data</title>
    <style>
        table {
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid black;
            padding: 5px;
        }
    </style>
</head>

<body>
    <center>
        <h1>Mobile Bootcamp </h1>
        <form method="POST" action="">
            <?php if ($editMode) : ?>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<?php echo $selectedUser['Id']; ?>">

            <?php else : ?>
                <input type="hidden" name="action" value="create">
            <?php endif; ?>
            <label for="name">Name:</label>
            <input type="text" name="name" value="<?php echo $editMode ? $selectedUser['name'] : ''; ?>" required><br><br>

            <label for="phone">Phone:</label>
            <input type="number" name="phone" value="<?php echo $editMode ? $selectedUser['phone'] : ''; ?>" required><br><br>

            <?php
            $type = array("Suggeestion", "Complain");
            echo '<select name="type" >';
            
            foreach ($type as  $value) {
                echo "<option value='$value' >$value</option>";
            }
            echo "</select><br><br>";
            ?>

            <textarea cols=10 rows=4  name="content">
            <?php echo $editMode ? $selectedUser['content'] : ''; ?>
            </textarea><br><br>

            <input type="submit" name="submit" value="Submit">

        </form>
    </center>
    <center>
        <h2>Data in the Table</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Type</th>
                <th>Content</th>
                <th></th>
                <th></th>
            </tr>
            <?php
            // Display the data from the table
            if ($customers->num_rows > 0) {
                while ($row = $customers->fetch_assoc()){
                    echo '<tr>';
                    echo '<td>' . $row['name'] . '</td>';
                    echo '<td>' . $row['phone'] . '</td>';
                    echo '<td>' . $row['type'] . '</td>';
                    echo '<td>' . $row['content'] . '</td>';

            ?>
                    <td>
                        <form method="post" action="">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="Id" value="<?php echo $row['Id']; ?>">
                            <input type="submit" value="Edit">
                        </form>
                    </td>
                    <td>
                        <form action="" method="post">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value=<?php echo $row["Id"]; ?>>
                            <input type="submit" value="Delete">
                        </form>
                    </td>
            <?php
                    echo '</tr>';
                }
            } else {
                echo '<tr><td colspan="2">No data available</td></tr>';
            }
            ?>
        </table>
    </center>
</body>

</html>