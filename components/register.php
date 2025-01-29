<?php
include('./database/db.php');
$errors = [];
$now = new DateTime('now');
$now = $now->format('Y-m-d H:i:s');

if (isset($_POST['register'])) {
    // echo "Hello"; //OK
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $password2 = trim($_POST['password2']);
    $phone = trim($_POST['phone']);
    $address = trim($_POST['address']);
    $role = trim($_POST['role']);

    empty($name) ? $errors['name'] = 'Name is required' : '';
    empty($email) ? $errors['email'] = 'Email is required' : '';
    empty($password) ? $errors['password'] = 'Password is required' : '';
    empty($password2) ? $errors['password2'] = 'Confirm password is required' : '';
    empty($phone) ? $errors['phone'] = 'Phone number is required' : '';
    empty($address) ? $errors['address'] = 'Address is required' : '';
    empty($role) ? $errors['role'] = 'Role is required' : '';


    if (filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
        $errors['email'] = 'Invalid email address';
    }

    if (strcmp($password, $password2) !== 0) {
        $errors['password'] = 'Passwords do not match';
    }

    $user_exist_qry = 'SELECT * FROM Users WHERE email = :email';
    $stmt = $pdo->prepare($user_exist_qry);
    $stmt->bindParam(':email', $email);
    $stmt->execute();
    // echo($stmt->rowCount()); //exist is return 1, not exist is return 0

    if ($stmt->rowCount() > 0) {
        $errors[] = 'Email address already exists';
    }

    $password = password_hash($password, PASSWORD_BCRYPT);
    $insert_user_qry = 'INSERT INTO Users (email, password, role,created_at,updated_at) VALUES (:email, :password, :role, :created_at, :updated_at)';
    $stmt = $pdo->prepare($insert_user_qry);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':password', $password);
    $stmt->bindParam(':role', $role);
    $stmt->bindParam(':created_at', $now);
    $stmt->bindParam(':updated_at', $now);
    $stmt->execute();
    $user_id = $pdo->lastInsertId();
    // echo $user_id;
    // echo $role;


    // echo $user_id;
    // echo $role;
    if ($role === 'Teacher') {
        $hire_date = trim($_POST['hire_date']);
        $salary = trim($_POST['salary']);
        empty($hire_date) ? $errors['hire_date'] = 'Hire date is required' : '';
        empty($salary) ? $errors['salary'] = 'Salary is required' : '';
        $insert_teacher_qry = 'INSERT INTO Teachers (user_id, name, phone, hire_date, salary, address) VALUES (:user_id, :name, :phone, :hire_date, :salary, :address)';
        $stmt = $pdo->prepare($insert_teacher_qry);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':phone', $phone);
        $stmt->bindParam(':hire_date', $hire_date);
        $stmt->bindParam(':salary', $salary);
        $stmt->bindParam(':address', $address);
        $res =  $stmt->execute();
    } elseif ($role === 'Staff') {
        $staff_role = trim($_POST['staff_role']);
        $hire_date = trim($_POST['hire_date']);
        $salary = trim($_POST['salary']);
        empty($staff_role) ? $errors['staff_role'] = 'Staff role is required' : '';
        empty($hire_date) ? $errors['hire_date'] = 'Hire date is required' : '';
        empty($salary) ? $errors['salary'] = 'Salary is required' : '';
        $insert_staff_qry = 'INSERT INTO Staff (user_id, name, phone, staff_role, hire_date, salary, address) VALUES (:user_id, :name, :phone, :staff_role, :hire_date, :salary, :address)';
        $stmt = $pdo->prepare($insert_staff_qry);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':phone', $phone);
        $stmt->bindParam(':staff_role', $staff_role);
        $stmt->bindParam(':hire_date', $hire_date);
        $stmt->bindParam(':salary', $salary);
        $stmt->bindParam(':address', $address);
        $stmt->execute();
    } else if ($role === 'Parent') {
        $parent_id = null;
        $insert_parent_qry = 'INSERT INTO Parents (parent_id, user_id, name, phone, address) VALUES (:parent_id, :user_id, :name, :phone, :address)';
        $stmt = $pdo->prepare($insert_parent_qry);
        $stmt->bindParam(':parent_id', $parent_id);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':phone', $phone);
        $stmt->bindParam(':address', $address);
        $res = $stmt->execute();
    }

    if ($stmt) {
        $success['register_success'] = true;
    } else {
        $success['register_success'] = false;
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
            <h1 class="mb-3">Register Form</h1>
        </div>
        <div class="row g-4">
            <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                <form action="" method="post" class="m-auto w-50 shadow rounded-2 p-5">
                    <div class="mb-3">
                        <label for="">Name</label>
                        <input type="text" class="form-control" name="name" placeholder="Name" id="">
                        <p class="text-danger"><?php echo $errors['name'] ?? ''; ?></p>
                    </div>
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
                    <div class="mb-3">
                        <label for="">Contirm Password</label>
                        <input type="password" class="form-control" name="password2" placeholder="Password" id="">
                        <p class="text-danger"><?php echo $errors['password2'] ?? ''; ?></p>
                    </div>
                    <div class="mb-3">
                        <label for="">Phone</label>
                        <input type="tel" class="form-control" name="phone" placeholder="Phone" id="">
                        <p class="text-danger"><?php echo $errors['phone'] ?? ''; ?></p>
                    </div>
                    <div class="mb-3">
                        <label for="">Address</label>
                        <textarea name="address" class="form-control" id="" placeholder="Address"></textarea>
                        <p class="text-danger"><?php echo $errors['address'] ?? ''; ?></p>
                    </div>
                    <div class="mb-3">
                        <label for="">Role</label>
                        <select name="role" id="role" class="form-control">
                            <option value="">Select Role</option>
                            <option value="Teacher">Teacher</option>
                            <option value="Staff">Staff</option>
                            <option value="Parent">Parent</option>
                            <option value="Admin">Admin</option>
                        </select>
                    </div>
                    <div id="teacher"></div>
                    <div id="staff"></div>
                    <div class="text-center">
                        <input type="submit" value="Register" class="btn btn-primary text-white" name="register" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    let role = document.querySelector("#role");
    let teacher = document.querySelector("#teacher");
    let staff = document.querySelector("#staff");

    role.onchange = function(e) {
        e.preventDefault();
        //   console.log(this.value)
        if (this.value === "Teacher") {
            let teacherData = `
            <div class="mb-3">
                <label for="">Hire Date</label>
                <input type="date" class="form-control" name="hire_date" id="">
            </div>
            <div class="mb-3">
                <label for="">Salary</label>
                <input type="text" class="form-control" name="salary" id="">
            </div>
            `;
            teacher.innerHTML = teacherData;
            staff.innerHTML = '';
        } else if (this.value === "Staff") {
            let staffData = `
            <div class="mb-3">
                <label for="">Role</label>
                <select name="staff_role" id="role" class="form-control">
                    <option value="">Select Role</option>
                    <option value="Admin">Admin</option>
                    <option value="Assistant">Assistant</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="">Hire Date</label>
                <input type="date" class="form-control" name="hire_date" id="">
            </div>
            <div class="mb-3">
                <label for="">Salary</label>
                <input type="nu" class="form-control" name="salary" id="">
            </div>
            `;
            staff.innerHTML = staffData;
            teacher.innerHTML = ""
            // teacher.style.display = "none";
            // staff.style.display = "block";
        } else if (this.value === "Parent") {
            teacher.innerHTML = '';
            staff.innerHTML = '';
        } else if (this.value === "Admin") {
            teacher.innerHTML = '';
            staff.innerHTML = '';
        }
    }
</script>