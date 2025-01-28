<?php
// dsn = data source name

$host = "127.0.0.1";
$dbname = "pre_school";
$user = "root";
$password = "";
$dsn = "mysql:host=$host;dbname=$dbname;charset=UTF8";
try {
    $pdo = new PDO($dsn, $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo $e->getMessage();
}
