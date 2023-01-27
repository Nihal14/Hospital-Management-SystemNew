<?php
$con=mysqli_connect("localhost","root","","hospitalms");
global $con;
if(isset($_POST['update'])){
  $id= $_POST['ID'];
  $fname = $_POST['fname'];
  $lname = $_POST['lname'];
  $email = $_POST['email'];

  $query = "UPDATE patreg SET fname='$fname', lname='$lname', email='$email' WHERE pid='$id'";
  $result = mysqli_query($con, $query);

  if($result){
    echo("<script>alert('Record Updated Successfully.');
        window.location.href = 'admin-panel1.php';</script>");
  } else {
    echo "</script>alert('Error updating record: ')</script>" . mysqli_error($con);
  }
}
?>
