CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100),
    description VARCHAR(255)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    contact_phone VARCHAR(20)
);

CREATE TABLE Shippers (
    shipper_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    support_email VARCHAR(100)
);

-- 2. Associative Entities (The Verbs/Relationships)
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Inventory_Restock (
    restock_id INT PRIMARY KEY,
    product_id INT,
    supplier_id INT,
    restock_date DATE,
    quantity_received INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    shipper_id INT,
    ship_date DATE,
    tracking_number VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (shipper_id) REFERENCES Shippers(shipper_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT,
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);