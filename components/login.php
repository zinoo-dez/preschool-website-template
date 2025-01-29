<?php
session_start();
include('./database/db.php');
$errors = [];
$now = new DateTime('now');
$now = $now->format('Y-m-d H:i:s');

if (isset($_POST['login'])) {
    // echo "Hello"; //OK
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    empty($email) ? $errors['email'] = 'Email is required' : '';
    empty($password) ? $errors['password'] = 'Password is required' : '';
    if (filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
        $errors['email'] = 'Invalid email address';
    }
    $user_exist_qry = 'SELECT * FROM Users WHERE email = :email';
    $stmt = $pdo->prepare($user_exist_qry);
    $stmt->bindParam(':email', $email);
    $stmt->execute();
    // echo($stmt->rowCount()); //exist is return 1, not exist is return 0
    if ($stmt->rowCount() === 0) {
        $errors[] = 'Email not found';
    } else {
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($email === $user['email'] && password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['role'] = $user['role'];
            header('Location: index.php?success=true');
            exit;
        }
    }
}

?>
<div class="container-xxl py-5" id="classes">
    <div class="container">
        <?php
        if (isset($success['register_success']) && $success['register_success']) {
            echo '<div class="alert alert-success text-center">Register success</div>';
        } elseif (isset($success['register_success']) && !$success['register_success']) {
            echo '<div class="alert alert-danger text-center">Register failed</div>';
        }
        ?>
        <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px">
            <h1 class="mb-3">Login Form</h1>
        </div>
        <div class="row g-4">
            <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                <form action="" method="post" class="m-auto w-50 shadow rounded-2 p-5">

                    <div class="mb-3">
                        <label for="">Email</label>
                        <input type="email" class="form-control" name="email" placeholder="Email Address" id="">
                        <p class="text-danger"><?php echo $errors['email'] ?? ''; ?></p>
                    </div>
                    <div class="mb-3">
                        <label for="">Password</label>
                        <input type="password" class="form-control" name="password" placeholder="Password" id="">
                        <p class="text-danger"><?php echo $errors['password'] ?? ''; ?></p>
                    </div>
                    <div class="text-center">
                        <input type="submit" value="Login" class="btn btn-primary text-white" name="login" />
                    </div>
                    <hr>
                    <a href="register.php" class="btn btn-warning rounded-pill px-3 d-none d-lg-block">Register Now <i
                            class="fa fa-arrow-right ms-3"></i></a>
                </form>

            </div>
        </div>
    </div>
</div>