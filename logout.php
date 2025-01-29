<?php
session_start();
session_destroy();
unset($_SESSION['user_id']);
unset($_SESSION['role']);
header("Location: index.php");
exit;
