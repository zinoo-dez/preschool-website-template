CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL, -- Store hashed passwords
    role ENUM(
        'Teacher',
        'Staff',
        'Parent',
        'Admin'
    ) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_verified BOOLEAN DEFAULT FALSE -- For email verification
);
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    parent_id INT NOT NULL, -- Links to Parents table
    enrollment_date DATE NOT NULL,
    class_id INT,
    FOREIGN KEY (parent_id) REFERENCES Parents (parent_id),
    FOREIGN KEY (class_id) REFERENCES Classes (class_id)
);
CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL, -- Links to Users table
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2),
    address TEXT,
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL, -- Links to Users table
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    role ENUM('Admin', 'Assistant', 'Other') NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2),
    address TEXT,
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);
CREATE TABLE Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    teacher_id INT, -- Links to Teachers table
    max_students INT,
    schedule TEXT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers (teacher_id)
);
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    class_id INT,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Late') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students (student_id),
    FOREIGN KEY (class_id) REFERENCES Classes (class_id)
);
CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    event_time TIME,
    location VARCHAR(100),
    description TEXT
);
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    payment_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM(
        'Cash',
        'Credit Card',
        'Bank Transfer'
    ) NOT NULL,
    description TEXT,
    FOREIGN KEY (student_id) REFERENCES Students (student_id)
);
CREATE TABLE Messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT, -- Can be staff_id or parent_id (if parents are stored separately)
    receiver_id INT,
    message TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE
);

CREATE TABLE Gallery (
    media_id INT AUTO_INCREMENT PRIMARY KEY,
    file_path VARCHAR(255) NOT NULL,
    description TEXT,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    event_id INT,
    FOREIGN KEY (event_id) REFERENCES Events (event_id)
);
CREATE TABLE Parents (
    parent_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL, -- Links to Users table
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    address TEXT,
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);


-- fot teacher
-- Insert into Users table
INSERT INTO
    Users (email, password_hash, role)
VALUES (
        'teacher@example.com',
        'hashed_password',
        'Teacher'
    );

-- Get the user_id of the newly created user
SET @user_id = LAST_INSERT_ID();

-- Insert into Teachers table
-- INSERT INTO
--     Teachers (
--         user_id,
--         first_name,
--         last_name,
--         contact_number,
--         hire_date,
--         salary,
--         address
--     )
-- VALUES (
--         @user_id,
--         'Emily',
--         'Johnson',
--         '1112223333',
--         '2021-06-01',
--         3000.00,
--         '789 Oak St, City, Country'
--     );

-- for staff
-- Insert into Users table
INSERT INTO
    Users (email, password_hash, role)
VALUES (
        'staff@example.com',
        'hashed_password',
        'Staff'
    );

-- Get the user_id of the newly created user
SET @user_id = LAST_INSERT_ID();

-- Insert into Staff table
-- INSERT INTO
--     Staff (
--         user_id,
--         first_name,
--         last_name,
--         contact_number,
--         role,
--         hire_date,
--         salary,
--         address
--     )
-- VALUES (
--         @user_id,
--         'John',
--         'Doe',
--         '1234567890',
--         'Admin',
--         '2021-06-01',
--         2500.00,
--         '123 Main St, City, Country'
--     );  

-- for parent        
-- Insert into Users table
INSERT INTO
    Users (email, password_hash, role)
VALUES (
        'parent@example.com',
        'hashed_password',
        'Parent'
    );

-- Get the user_id of the newly created user
-- SET @user_id = LAST_INSERT_ID();

-- Insert into Parents table
-- INSERT INTO
--     Parents (
--         user_id,
--         first_name,
--         last_name,
--         contact_number,
--         address
--     )
-- VALUES (
--         @user_id,
--         'Jane',
--         'Doe',
--         '0987654321',
--         '456 Elm St, City, Country'
--     );  

