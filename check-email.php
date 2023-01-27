<?php
    try {
        $conn = new PDO("mysql:host=localhost;dbname=hospitalms", "root");
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $stmt = $conn->prepare("SELECT email FROM users WHERE email=:email");
        $stmt->bindParam(':email', $_POST['email']);
        $stmt->execute();
        $result = $stmt->fetch();
        if($result) {
            echo json_encode(array("exists" => true));
        } else {
            echo json_encode(array("exists" => false));
        }
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
?>