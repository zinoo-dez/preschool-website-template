<?php
// Database connection
$conn = new mysqli('localhost', 'root', 'password', 'preschool_db');

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$email = $_POST['email'];
$password = password_hash($_POST['password'], PASSWORD_BCRYPT); // Hash password
$role = $_POST['role']; // Teacher, Staff, or Parent
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$contact_number = $_POST['contact_number'];
$address = $_POST['address'];

// Insert into Users table
$sql = "INSERT INTO Users (email, password_hash, role) VALUES ('$email', '$password', '$role')";
if ($conn->query($sql) === TRUE) {
    $user_id = $conn->insert_id; // Get the user_id of the newly created user

    // Insert into role-specific table
    if ($role === 'Teacher') {
        $hire_date = $_POST['hire_date'];
        $salary = $_POST['salary'];
        $sql = "INSERT INTO Teachers (user_id, first_name, last_name, contact_number, hire_date, salary, address)
                VALUES ('$user_id', '$first_name', '$last_name', '$contact_number', '$hire_date', '$salary', '$address')";
    } elseif ($role === 'Staff') {
        $staff_role = $_POST['staff_role']; // Admin, Assistant, etc.
        $hire_date = $_POST['hire_date'];
        $salary = $_POST['salary'];
        $sql = "INSERT INTO Staff (user_id, first_name, last_name, contact_number, role, hire_date, salary, address)
                VALUES ('$user_id', '$first_name', '$last_name', '$contact_number', '$staff_role', '$hire_date', '$salary', '$address')";
    } elseif ($role === 'Parent') {
        $sql = "INSERT INTO Parents (user_id, first_name, last_name, contact_number, address)
                VALUES ('$user_id', '$first_name', '$last_name', '$contact_number', '$address')";
    }

    if ($conn->query($sql) === TRUE) {
        echo "Registration successful!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>