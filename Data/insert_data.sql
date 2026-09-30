INSERT INTO Categories (category_id, category_name, description) VALUES
(1, 'Electronics', 'Phones, laptops, and gadgets'),
(2, 'Apparel', 'Clothing and accessories'),
(3, 'Home & Garden', 'Furniture and outdoor equipment');

INSERT INTO Customers (customer_id, first_name, last_name, email, city) VALUES
(1, 'Aarav', 'Sharma', 'aarav@example.com', 'Bhopal'),
(2, 'Priya', 'Singh', 'priya@example.com', 'Indore'),
(3, 'Rohan', 'Gupta', 'rohan@example.com', 'Bangalore');

INSERT INTO Suppliers (supplier_id, company_name, contact_phone) VALUES
(1, 'TechSource India', '9876543210'),
(2, 'Global Fabrics', '8765432109');

INSERT INTO Shippers (shipper_id, company_name, support_email) VALUES
(1, 'FastTrack Logistics', 'support@fasttrack.in'),
(2, 'SafeDrop Couriers', 'help@safedrop.in');

-- 2. Insert Products (Depends on Categories)
INSERT INTO Products (product_id, name, price, stock_quantity, category_id) VALUES
(1, 'Wireless Mouse', 1500.00, 50, 1),
(2, 'Mechanical Keyboard', 4500.00, 30, 1),
(3, 'Cotton T-Shirt', 800.00, 100, 2),
(4, 'Desk Lamp', 1200.00, 20, 3);

-- 3. Insert Orders (Depends on Customers)
INSERT INTO Orders (order_id, customer_id, order_date, status, total_amount) VALUES
(101, 1, '2026-09-25', 'Shipped', 6000.00),
(102, 2, '2026-09-28', 'Pending', 800.00),
(103, 3, '2026-09-30', 'Delivered', 1200.00);

-- 4. Insert Associative Entities (Depends on multiple tables)
INSERT INTO Order_Items (item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 101, 1, 1, 1500.00),
(2, 101, 2, 1, 4500.00),
(3, 102, 3, 1, 800.00),
(4, 103, 4, 1, 1200.00);

INSERT INTO Inventory_Restock (restock_id, product_id, supplier_id, restock_date, quantity_received) VALUES
(1, 1, 1, '2026-09-01', 100),
(2, 3, 2, '2026-09-15', 200);

INSERT INTO Shipments (shipment_id, order_id, shipper_id, ship_date, tracking_number) VALUES
(1, 101, 1, '2026-09-26', 'TRK99887766'),
(2, 103, 2, '2026-10-01', 'TRK55443322');

INSERT INTO Reviews (review_id, product_id, customer_id, rating, review_date) VALUES
(1, 1, 1, 5, '2026-09-27'),
(2, 4, 3, 4, '2026-10-02');