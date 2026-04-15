INSERT INTO customers VALUES
(1, 'Amit Sharma', 'Delhi'),
(2, 'Priya Singh', 'Mumbai'),
(3, 'Rahul Verma', 'Bangalore'),
(4, 'Sneha Kapoor', 'Delhi'),
(5, 'Arjun Mehta', 'Chennai');

INSERT INTO products VALUES
(101, 'Laptop', 60000),
(102, 'Mobile', 20000),
(103, 'Headphones', 2000),
(104, 'Keyboard', 1500),
(105, 'Mouse', 800);

INSERT INTO orders VALUES
(1001, 1, '2024-01-10'),
(1002, 2, '2024-01-12'),
(1003, 1, '2024-01-15'),
(1004, 3, '2024-01-18'),
(1005, 4, '2024-01-20');

INSERT INTO order_details VALUES
(1001, 101, 1),
(1001, 103, 2),
(1002, 102, 1),
(1003, 104, 3),
(1004, 101, 1),
(1004, 105, 2),
(1005, 103, 1);

