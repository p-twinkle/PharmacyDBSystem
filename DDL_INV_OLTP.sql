DROP TABLE OrderDetail;
DROP TABLE Orders;
DROP TABLE Store_Inventory;
DROP TABLE Supplier_Product_Mapping;
DROP TABLE Product;
DROP TABLE Suppliers;
DROP TABLE Customer;

-- Create Customer Table
CREATE TABLE Customer (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    contact_number VARCHAR2(20),
    email VARCHAR2(100)
);

-- Create Suppliers Table
CREATE TABLE Suppliers (
    supplier_id NUMBER PRIMARY KEY,
    supplier_name VARCHAR2(100),
    contact_number VARCHAR2(20),
    email VARCHAR2(100)
);

-- Create Product Table
CREATE TABLE Product (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    description VARCHAR2(200),
    category VARCHAR2(50),
    price NUMBER(10,2),
    expiration_date DATE,
    indication VARCHAR2(100)
);

-- Create Supplier_Product_Mapping Table
CREATE TABLE Supplier_Product_Mapping (
    mapping_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    supplier_id NUMBER,
    CONSTRAINT fk_prod FOREIGN KEY (product_id) REFERENCES Product(product_id),
    CONSTRAINT fk_supp FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Create Store_Inventory Table
CREATE TABLE Store_Inventory (
    store_id NUMBER,
    product_id NUMBER,
    quantity_on_hand NUMBER,
    reorder_level NUMBER
    --CONSTRAINT pk_store_inventory PRIMARY KEY (store_id, product_id),
    --CONSTRAINT fk_prod_inv FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Create Orders Table
CREATE TABLE Orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE,
    status VARCHAR2(20),
    store_id NUMBER
    --CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
    --CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES Store_Inventory(store_id)
);


-- Create OrderDetail Table
CREATE TABLE OrderDetail (
    order_detail_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER
    --CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    --CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Product(product_id)
);



-- Create indexes for better query performance
CREATE INDEX idx_order_date ON Orders(order_date);
CREATE INDEX idx_product_category ON Product(category);
CREATE INDEX idx_customer_name ON Customer(customer_name);
CREATE INDEX idx_supplier_name ON Suppliers(supplier_name);



----------- Insert Statements -----------------

-- 1. Supplier table

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (1, 'JJ', '+1-692-920-5567x350', 'zneal@singh.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (2, 'GSK', '587.309.1806x056', 'alexandhnson@hodges.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (3, 'Novartis', '001-621-798-7068', 'ryanheath@rogers.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (4, 'Merck', '+1-438-4x41751', 'james87@foster.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (5, 'Pfizer', '263.992.6572x4265', 'rweaver@perez-arroyo.org');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (6, 'Bristol Myers Squibb', '266-582-6730x98418', 'lynnamanda@watson.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (7, 'Abbott', '(844)463-9543x5059', 'patrick09@herrera-kane.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (8, 'Merck', '206.385.8021x04072', 'brownangela@wright.net');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (9, 'Roche', '001-358-283-3681x384', 'barbara00@taylor.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (10, 'Merck', '(831)349-7153', 'johnnyalvarado@dixon.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (11, 'ABC', '001-792-505-9743', 'joanfrost@vaughn-butler.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (12, 'GSK', '757-227-9687', 'clarkbrittany@boyle.net');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (13, 'AstraZeneca', '001-292-442-4512', 'melody54@oneal.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (14, 'Kite', '497.844.6687', 'diazlindsay@garcia.net');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (15, 'Bristol Myers Squibb', '969-909-1707', 'williamsjames@richard-hughes.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (16, 'Pfizer', '805-341-8772', 'chankevin@buckley.biz');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (17, 'Pfizer', '563-820-6018', 'montgomerykatherine@oconnell.org');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (18, 'Abbott', '902.880.7548x29826', 'ericluna@calhoun.org');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (19, 'Abbott', '001-391877', 'iswanson@smith.com');

INSERT INTO Suppliers (supplier_id, supplier_name, contact_number, email) 
VALUES (20, 'Pfizer', '(868)855-8768x800', 'kevin54@perkins.org');


SELECT * FROM Suppliers;

----------------- Product

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (1, 'Aspirin', 'Used for treating High Blood Pressure', 'Mental Health', 70.79, TO_DATE('2026-04-17', 'YYYY-MM-DD'), 'Bacterial Infection');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (2, 'Metoprolol', 'Used for treating Depression', 'Respiratory', 106.95, TO_DATE('2026-08-23', 'YYYY-MM-DD'), 'Depression');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (3, 'Cetirizine', 'Used for treating Asthma', 'Antibiotics', 199.47, TO_DATE('2026-10-21', 'YYYY-MM-DD'), 'Diabetes');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (4, 'Sertraline', 'Used for treating Depression', 'Antibiotics', 107.97, TO_DATE('2025-12-30', 'YYYY-MM-DD'), 'High Cholesterol');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (5, 'Acetaminophen', 'Used for treating High Blood Pressure', 'Mental Health', 106.11, TO_DATE('2026-06-23', 'YYYY-MM-DD'), 'Asthma');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (6, 'Gabapentin', 'Used for treating Acid Reflux', 'Cholesterol', 185.73, TO_DATE('2026-04-22', 'YYYY-MM-DD'), 'High Cholesterol');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (7, 'Amlodipine', 'Used for treating High Cholesterol', 'Mental Health', 86.52, TO_DATE('2025-12-18', 'YYYY-MM-DD'), 'Diabetes');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (8, 'Simvastatin', 'Used for treating High Cholesterol', 'Diabetes', 150.35, TO_DATE('2026-01-24', 'YYYY-MM-DD'), 'Acid Reflux');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (9, 'Sertraline', 'Used for treating Diabetes', 'Antibiotics', 137.48, TO_DATE('2026-08-29', 'YYYY-MM-DD'), 'High Blood Pressure');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (10, 'Gabapentin', 'Used for treating Asthma', 'Cardiovascular', 184.07, TO_DATE('2026-05-19', 'YYYY-MM-DD'), 'Asthma');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (11, 'Lisinopril', 'Used for treating Asthma', 'Respiratory', 75.1, TO_DATE('2026-06-30', 'YYYY-MM-DD'), 'High Cholesterol');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (12, 'Metformin', 'Used for treating Bacterial Infection', 'Diabetes', 19.69, TO_DATE('2026-07-07', 'YYYY-MM-DD'), 'High Cholesterol');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (13, 'Metformin', 'Used for treating Asthma', 'Respiratory', 68.82, TO_DATE('2026-11-20', 'YYYY-MM-DD'), 'High Cholesterol');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (14, 'Metoprolol', 'Used for treating Acid Reflux', 'Cholesterol', 138.92, TO_DATE('2026-07-14', 'YYYY-MM-DD'), 'High Cholesterol');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (15, 'Amoxicillin', 'Used for treating Acid Reflux', 'Antibiotics', 16.41, TO_DATE('2026-08-27', 'YYYY-MM-DD'), 'Diabetes');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (16, 'Amoxicillin', 'Used for treating High Blood Pressure', 'Antibiotics', 116.11, TO_DATE('2026-04-24', 'YYYY-MM-DD'), 'High Cholesterol');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (17, 'Metoprolol', 'Used for treating High Cholesterol', 'Gastrointestinal', 139.6, TO_DATE('2026-05-25', 'YYYY-MM-DD'), 'High Cholesterol');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (18, 'Amoxicillin', 'Used for treating Bacterial Infection', 'Respiratory', 13.37, TO_DATE('2026-09-12', 'YYYY-MM-DD'), 'High Blood Pressure');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (19, 'Simvastatin', 'Used for treating Asthma', 'Antibiotics', 50.69, TO_DATE('2026-02-18', 'YYYY-MM-DD'), 'Diabetes');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (20, 'Cetirizine', 'Used for treating Depression', 'Cholesterol', 76.1, TO_DATE('2026-03-17', 'YYYY-MM-DD'), 'Bacterial Infection');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (21, 'Amlodipine', 'Used for treating Diabetes', 'Cholesterol', 110.45, TO_DATE('2026-04-04', 'YYYY-MM-DD'), 'Diabetes');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (22, 'Metoprolol', 'Used for treating High Blood Pressure', 'Cardiovascular', 166.34, TO_DATE('2026-04-24', 'YYYY-MM-DD'), 'High Blood Pressure');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (23, 'Cetirizine', 'Used for treating High Cholesterol', 'Pain Management', 59.67, TO_DATE('2026-11-07', 'YYYY-MM-DD'), 'Asthma');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (24, 'Omeprazole', 'Used for treating Acid Reflux', 'Cardiovascular', 70.07, TO_DATE('2026-02-13', 'YYYY-MM-DD'), 'High Cholesterol');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (25, 'Amoxicillin', 'Used for treating Asthma', 'Cholesterol', 81.11, TO_DATE('2026-09-07', 'YYYY-MM-DD'), 'High Blood Pressure');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (26, 'Acetaminophen', 'Used for treating Asthma', 'Cholesterol', 179.51, TO_DATE('2025-11-25', 'YYYY-MM-DD'), 'Diabetes');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (27, 'Acetaminophen', 'Used for treating High Blood Pressure', 'Diabetes', 199.14, TO_DATE('2026-05-27', 'YYYY-MM-DD'), 'Diabetes');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (28, 'Amoxicillin', 'Used for treating High Cholesterol', 'Diabetes', 166.67, TO_DATE('2026-02-07', 'YYYY-MM-DD'), 'Asthma');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (29, 'Gabapentin', 'Used for treating Asthma', 'Pain Management', 168.72, TO_DATE('2026-02-21', 'YYYY-MM-DD'), 'Asthma');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (30, 'Metformin', 'Used for treating High Blood Pressure', 'Antibiotics', 186.78, TO_DATE('2026-02-09', 'YYYY-MM-DD'), 'Asthma');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (31, 'Metformin', 'Used for treating Asthma', 'Gastrointestinal', 104.68, TO_DATE('2026-04-03', 'YYYY-MM-DD'), 'Diabetes');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (32, 'Albuterol', 'Used for treating High Cholesterol', 'Antibiotics', 166.5, TO_DATE('2026-03-07', 'YYYY-MM-DD'), 'High Blood Pressure');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (33, 'Omeprazole', 'Used for treating Asthma', 'Pain Management', 103.73, TO_DATE('2026-01-11', 'YYYY-MM-DD'), 'Diabetes');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (34, 'Ibuprofen', 'Used for treating Bacterial Infection', 'Respiratory', 143.87, TO_DATE('2026-06-17', 'YYYY-MM-DD'), 'Acid Reflux');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (35, 'Loratadine', 'Used for treating Depression', 'Antibiotics', 119.57, TO_DATE('2026-03-27', 'YYYY-MM-DD'), 'Acid Reflux');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (36, 'Cetirizine', 'Used for treating High Blood Pressure', 'Cardiovascular', 85.61, TO_DATE('2026-08-24', 'YYYY-MM-DD'), 'Acid Reflux');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (37, 'Ibuprofen', 'Used for treating Depression', 'Antibiotics', 65.1, TO_DATE('2026-01-19', 'YYYY-MM-DD'), 'Diabetes');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (38, 'Loratadine', 'Used for treating Bacterial Infection', 'Antibiotics', 107.07, TO_DATE('2026-11-16', 'YYYY-MM-DD'), 'Asthma');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (39, 'Metoprolol', 'Used for treating High Cholesterol', 'Mental Health', 65.84, TO_DATE('2026-02-01', 'YYYY-MM-DD'), 'Depression');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (40, 'Gabapentin', 'Used for treating Diabetes', 'Mental Health', 122.28, TO_DATE('2026-04-07', 'YYYY-MM-DD'), 'Acid Reflux');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (41, 'Aspirin', 'Used for treating Bacterial Infection', 'Pain Management', 197.89, TO_DATE('2026-09-24', 'YYYY-MM-DD'), 'Acid Reflux');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (42, 'Aspirin', 'Used for treating High Blood Pressure', 'Gastrointestinal', 72.16, TO_DATE('2026-04-03', 'YYYY-MM-DD'), 'Bacterial Infection');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (43, 'Acetaminophen', 'Used for treating Depression', 'Cardiovascular', 127.97, TO_DATE('2025-12-30', 'YYYY-MM-DD'), 'Asthma');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (44, 'Amlodipine', 'Used for treating Bacterial Infection', 'Respiratory', 88.43, TO_DATE('2026-09-30', 'YYYY-MM-DD'), 'Bacterial Infection');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (45, 'Loratadine', 'Used for treating High Cholesterol', 'Mental Health', 178.1, TO_DATE('2026-06-06', 'YYYY-MM-DD'), 'High Blood Pressure');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (46, 'Metoprolol', 'Used for treating Depression', 'Pain Management', 42.58, TO_DATE('2026-07-10', 'YYYY-MM-DD'), 'High Blood Pressure');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (47, 'Amoxicillin', 'Used for treating Bacterial Infection', 'Cholesterol', 44.89, TO_DATE('2026-03-16', 'YYYY-MM-DD'), 'High Cholesterol');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (48, 'Omeprazole', 'Used for treating Bacterial Infection', 'Antibiotics', 109.76, TO_DATE('2026-01-13', 'YYYY-MM-DD'), 'Asthma');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (49, 'Ibuprofen', 'Used for treating Bacterial Infection', 'Antibiotics', 159.78, TO_DATE('2026-10-03', 'YYYY-MM-DD'), 'High Blood Pressure');

INSERT INTO Product (product_id, product_name, description, category, price, expiration_date, indication) 
VALUES (50, 'Amoxicillin', 'Used for treating High Cholesterol', 'Gastrointestinal', 126.49, TO_DATE('2026-07-28', 'YYYY-MM-DD'), 'High Cholesterol');

---- Supplier Product Mapping ------

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (1, 14, 18);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (2, 28, 1);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (3, 17, 14);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (4, 35, 17);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (5, 36, 12);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (6, 22, 8);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (7, 44, 20);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (8, 4, 7);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (9, 16, 14);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (10, 28, 11);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (11, 16, 17);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (12, 18, 19);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (13, 20, 8);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (14, 28, 17);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (15, 21, 13);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (16, 10, 2);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (17, 10, 9);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (18, 18, 1);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (19, 16, 17);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (20, 2, 3);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (21, 29, 8);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (22, 9, 6);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (23, 48, 6);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (24, 44, 18);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (25, 15, 9);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (26, 30, 14);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (27, 48, 13);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (28, 5, 17);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (29, 38, 7);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (30, 39, 19);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (31, 18, 8);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (32, 48, 1);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (33, 22, 20);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (34, 24, 8);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (35, 16, 12);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (36, 4, 17);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (37, 10, 10);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (38, 30, 14);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (39, 14, 17);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (40, 6, 18);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (41, 1, 4);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (42, 31, 17);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (43, 20, 19);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (44, 39, 2);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (45, 9, 7);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (46, 47, 14);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (47, 23, 7);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (48, 17, 13);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (49, 27, 17);

INSERT INTO Supplier_Product_Mapping (mapping_id, product_id, supplier_id) 
VALUES (50, 40, 11);

SELECT * FROM Product;
SELECT * FROM Suppliers;


------- customer-----


INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (1, 'Robert Camacho', '354.200.4829x2085', 'morganrose@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (2, 'Misty Parker', '(560)905-8954x036', 'gprice@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (3, 'Jeffrey Erickson', '7479520100', 'thompsonmariah@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (4, 'Kristin Vargas', '(918)572-8038', 'michael88@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (5, 'Kimberly Hall', '001-221-899-0822x824', 'william16@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (6, 'Dr. Michele Carroll', '001-410-984-8895', 'shawn24@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (7, 'Peter Johnson', '622-272-0958x550', 'wmolina@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (8, 'Adriana Roberts', '338.911.8127x074', 'gilbertedward@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (9, 'Monica Cordova', '993.282.0249', 'perrycindy@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (10, 'Susan Wheeler', '697.721.6640', 'hamiltonchristine@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (11, 'Michael Miller', '+1-799-983-9534', 'gregoryvictor@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (12, 'Sheila Ryan', '7845263333', 'kjones@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (13, 'Casey Hays', '001-841-4x17717', 'gloriafranco@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (14, 'Laura Carroll', '(504)461-1714', 'kelleythomas@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (15, 'Jennifer Garza', '(496)224-7001x92283', 'qgarcia@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (16, 'Michelle Pollard', '(535)604-4111x655', 'srussell@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (17, 'Ashley Holland', '(688)545-6168x15744', 'clarkdavid@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (18, 'Jessica Travis', '+1-649-212-2536', 'pball@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (19, 'Maria Gonzalez', '001-767-3719x03084', 'haleybarrett@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (20, 'Scott Anderson', '(236)447-8554x363', 'moradaniel@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (21, 'Deborah Jones', '525.596.8902', 'samantha32@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (22, 'Jennifer Moore', '001-468-995-3447x578', 'clifford69@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (23, 'Kimberly Brooks', '868.472.9670', 'brittany05@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (24, 'Brianna Hart', '(598)258-8269x1993', 'jeffrey46@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (25, 'Tracy Gilmore', '743-363-7927', 'phillipskathryn@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (26, 'Anna Morris', '+1-353-275-4008', 'samantha13@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (27, 'Dylan Hernandez', '(813)226-8915x7278', 'romerolaura@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (28, 'Lisa Terry', '835-757-0562', 'kathryn32@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (29, 'Connie Kirby', '(235)751-5237', 'ktran@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (30, 'Jessica Romero', '229-447-5627x09419', 'julie77@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (31, 'Casey Garcia', '227.304.3279x40291', 'arichardson@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (32, 'Kenneth Bennett', '00493-0763x61889', 'jennifermeyer@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (33, 'Kimberly Knight', '+1-672-896-2195x591', 'jmendoza@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (34, 'William Willis', '001-368-690x49257', 'louis94@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (35, 'Katherine Zhang', '(603)373-3651', 'john38@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (36, 'Joyce Henry', '+1-301-746-5602', 'jonathon93@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (37, 'Crystal Newton', '+1-375-831-1241x5385', 'joshuasmith@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (38, 'Melissa Elliott', '781.531.5220x18043', 'jonathanguzman@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (39, 'Jeffrey Lowe', '939.684.7074x5334', 'jacqueline51@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (40, 'Dawn Barnett', '(244)856-3290x522', 'robynfoster@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (41, 'Bruce Curry', '(387)439-3491', 'steven18@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (42, 'Nicholas Lee', '779.650.0935x796', 'ylowe@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (43, 'Kristen Gallegos', '658-866-6133x06853', 'huertarobert@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (44, 'Richard Martin', '+1-430-420x73315', 'rhonda04@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (45, 'William Kelley', '(463)317-5691x14659', 'williamsscott@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (46, 'Johnny Rosales', '(778)426-7097', 'baxterjeremy@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (47, 'Patrick Lyons', '001-36368x57415', 'ramseycarolyn@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (48, 'Nathan Smith', '+1-253-316-3788x826', 'ronaldsimmons@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (49, 'David Alvarez', '001-738388x40412', 'gsmith@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (50, 'Robert Ford', '(257)866-8785x26050', 'ggill@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (51, 'Amber Jones', '(815)878-3877', 'zacharysmith@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (52, 'Deborah James', '001-766-528x78169', 'pflynn@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (53, 'Matthew Ewing', '(816)571-3856x2679', 'fredericksusan@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (54, 'Jonathan Miller', '001-471-434-3572', 'conniesmith@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (55, 'Alyssa Porter', '438.258.1166x4806', 'urobinson@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (56, 'Felicia Moon', '228-949-5924', 'daniellefrancis@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (57, 'Jason Silva', '284.379.4409x547', 'vazquezkelly@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (58, 'Haley King', '+1-726-483-7893', 'melissa52@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (59, 'John Miller', '(570)211-6232', 'rowejesse@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (60, 'Kristopher Nelson', '238-467-4x6828', 'john53@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (61, 'Michelle Johnson', '+1-959-710-93x999', 'tylerfoley@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (62, 'Mario Moore', '438-891-1329x2310', 'ufoster@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (63, 'Michael Boyd', '3088025090', 'nicholas40@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (64, 'Lisa Browning', '233.609.3605', 'davidgray@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (65, 'James Weber', '(611)440-6048x424', 'robinsonalicia@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (66, 'Megan Smith', '+1-340-204x8635', 'ulopez@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (67, 'John Jackson', '+1-634-797-0890x4250', 'jerome70@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (68, 'Courtney Olson', '+1-572-496-4437x363', 'chaneyangela@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (69, 'Rebecca Lee', '972.787.8856x7513', 'westbrittany@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (70, 'Patrick Cox', '768.769.5201x602', 'wilsonanthony@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (71, 'Kim Robinson', '205.536.4349', 'allisonlauren@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (72, 'Melinda Ross', '935.916.6944', 'gonzalesbrian@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (73, 'Terri Smith', '587-347-7944', 'gregorymorrison@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (74, 'Jose Mclean', '605.554.2035x664', 'alexandra62@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (75, 'Brenda Anderson', '001-554-2528x350', 'uwilliams@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (76, 'Lauren Wheeler', '001-901-924-3662', 'gillsamantha@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (77, 'Angela Hunter', '724-398-4550x607', 'debbiehebert@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (78, 'Susan Reed', '251-618-2358', 'wilkersonlogan@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (79, 'Destiny Scott', '+1-927-576-6816x234', 'charlesclay@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (80, 'Alexandra Brown', '001-776-8981x41116', 'stephen54@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (81, 'Sarah Wilson', '784-799-2701x3247', 'zmoore@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (82, 'Dr. Michelle Frazier', '001-999-953-3588', 'erikmayo@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (83, 'Mariah Hall', '951.982.7684', 'calvin68@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (84, 'Peggy Cox', '(288)254-2271', 'terrellcarolyn@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (85, 'Donna Morris', '4117255356', 'guzmannicole@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (86, 'Thomas Nguyen', '+1-213-894x97595', 'fhuffman@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (87, 'Christopher Swanson', '3259138194', 'amorris@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (88, 'Stuart Jennings', '565.201.4253x140', 'harrisian@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (89, 'Jacqueline Foster', '(534)639-1747', 'jessicahoward@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (90, 'Jennifer Campbell', '(509)604-6550x142', 'chelseafuentes@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (91, 'Mr. Jeremy Miller', '+1-863-3826x2393', 'connorgomez@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (92, 'Samantha Smith', '9672847825', 'gillstephen@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (93, 'Elizabeth Mejia', '836.870.4314x781', 'melissberson@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (94, 'Michelle Lopez', '547-315-5403', 'perezangela@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (95, 'Kevin Dougherty', '001-757-816-0886', 'ewatts@example.net');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (96, 'Louis Monroe', '690-407-3571x3024', 'khendrix@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (97, 'Tiffany Roth', '(892)874-2332x1791', 'blairtravis@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (98, 'Lawrence Jackson', '(892)956-9141x8646', 'christiancampbell@example.com');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (99, 'Stephanie Woods', '(702)928-6495x609', 'paul39@example.org');

INSERT INTO Customer (customer_id, customer_name, contact_number, email) 
VALUES (100, 'Todd Bonilla', '001-579-4344x0847', 'daniel90@example.org');


-- Store Inventory---

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (4, 20, 0, 29);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 3, 0, 25);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 46, 0, 24);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (3, 6, 2, 24);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (1, 43, 3, 36);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (3, 2, 3, 37);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (3, 35, 3, 20);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 15, 3, 25);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 7, 4, 43);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (1, 40, 5, 37);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (8, 34, 5, 42);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (5, 4, 6, 45);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 24, 6, 49);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 29, 7, 34);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 5, 7, 20);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 19, 8, 30);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 12, 8, 23);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (5, 45, 9, 40);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 4, 9, 43);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 36, 9, 40);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 31, 10, 45);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (2, 14, 11, 22);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 32, 11, 27);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (5, 42, 12, 24);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 49, 12, 43);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (8, 16, 12, 42);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (3, 44, 13, 25);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (4, 15, 13, 31);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 11, 13, 39);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (5, 37, 15, 35);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 38, 15, 44);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 34, 15, 26);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 41, 15, 43);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (4, 50, 16, 27);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (5, 28, 16, 31);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (8, 21, 16, 34);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 39, 17, 39);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (2, 46, 18, 48);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (3, 42, 18, 20);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (4, 14, 18, 49);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 26, 19, 41);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 22, 19, 49);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (2, 9, 20, 23);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (3, 3, 20, 44);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (8, 17, 20, 30);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 8, 20, 30);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (1, 37, 21, 20);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 4, 22, 38);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 48, 22, 26);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 24, 38, 20);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (5, 25, 39, 21);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (8, 46, 39, 34);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 33, 39, 25);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 39, 39, 30);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (4, 39, 40, 40);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (3, 22, 41, 33);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (3, 25, 41, 42);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 16, 41, 24);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 45, 41, 47);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 6, 41, 47);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 17, 42, 24);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (8, 13, 42, 34);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (8, 47, 42, 37);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 38, 42, 34);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (5, 49, 43, 42);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 13, 43, 47);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 18, 43, 39);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (4, 49, 43, 43);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 21, 44, 50);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 15, 44, 37);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 14, 44, 38);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 46, 44, 44);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 35, 44, 44);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 32, 45, 45);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 42, 45, 45);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 27, 45, 45);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (8, 38, 45, 45);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 1, 46, 47);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 21, 46, 45);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (8, 8, 46, 25);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (7, 36, 47, 35);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (4, 47, 47, 23);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 49, 48, 46);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 45, 48, 41);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 12, 49, 24);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 47, 50, 27);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 19, 50, 34);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 28, 53, 41);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (3, 34, 53, 23);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (4, 44, 54, 43);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (2, 36, 54, 35);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (5, 12, 54, 29);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 26, 55, 22);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (10, 43, 55, 49);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (1, 22, 56, 36);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 44, 56, 27);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (9, 42, 56, 23);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (6, 48, 57, 33);

INSERT INTO Store_Inventory (store_id, product_id, quantity_on_hand, reorder_level) 
VALUES (8, 4, 58, 31);


SELECT STORE_ID, PRODUCT_ID, COUNT(*) FROM Store_Inventory
GROUP BY STORE_ID, PRODUCT_ID
HAVING COUNT(*) > 1
; -- composite Key: STORE_ID, PRODUCT_ID


--- Order Table -----
INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (1, 51, TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Cancelled', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (2, 21, TO_DATE('2024-03-08', 'YYYY-MM-DD'), 'Cancelled', 9);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (3, 15, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 'Cancelled', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (4, 100, TO_DATE('2024-09-28', 'YYYY-MM-DD'), 'Cancelled', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (5, 95, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'Cancelled', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (6, 14, TO_DATE('2024-09-18', 'YYYY-MM-DD'), 'Completed', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (7, 1, TO_DATE('2024-10-26', 'YYYY-MM-DD'), 'Processing', 2);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (8, 91, TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'Cancelled', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (9, 24, TO_DATE('2024-01-22', 'YYYY-MM-DD'), 'Ready for Pickup', 5);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (10, 13, TO_DATE('2024-02-22', 'YYYY-MM-DD'), 'Processing', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (11, 33, TO_DATE('2024-07-09', 'YYYY-MM-DD'), 'Cancelled', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (12, 10, TO_DATE('2024-10-16', 'YYYY-MM-DD'), 'Filled', 2);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (13, 16, TO_DATE('2024-05-26', 'YYYY-MM-DD'), 'Completed', 7);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (14, 51, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 'Ready for Pickup', 5);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (15, 78, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 'Processing', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (16, 21, TO_DATE('2024-05-06', 'YYYY-MM-DD'), 'Cancelled', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (17, 58, TO_DATE('2024-01-18', 'YYYY-MM-DD'), 'Ready for Pickup', 5);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (18, 4, TO_DATE('2024-01-22', 'YYYY-MM-DD'), 'Completed', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (19, 18, TO_DATE('2024-08-26', 'YYYY-MM-DD'), 'Processing', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (20, 18, TO_DATE('2024-09-06', 'YYYY-MM-DD'), 'Completed', 9);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (21, 60, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Filled', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (22, 22, TO_DATE('2024-01-06', 'YYYY-MM-DD'), 'Cancelled', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (23, 69, TO_DATE('2024-02-23', 'YYYY-MM-DD'), 'Filled', 5);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (24, 67, TO_DATE('2024-11-20', 'YYYY-MM-DD'), 'Processing', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (25, 56, TO_DATE('2024-04-16', 'YYYY-MM-DD'), 'Filled', 9);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (26, 74, TO_DATE('2024-05-11', 'YYYY-MM-DD'), 'Filled', 1);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (27, 13, TO_DATE('2024-08-23', 'YYYY-MM-DD'), 'Cancelled', 7);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (28, 86, TO_DATE('2024-04-09', 'YYYY-MM-DD'), 'Cancelled', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (29, 76, TO_DATE('2024-11-22', 'YYYY-MM-DD'), 'Filled', 7);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (30, 52, TO_DATE('2024-07-11', 'YYYY-MM-DD'), 'Filled', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (31, 70, TO_DATE('2024-09-29', 'YYYY-MM-DD'), 'Completed', 2);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (32, 57, TO_DATE('2024-04-02', 'YYYY-MM-DD'), 'Cancelled', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (33, 73, TO_DATE('2024-02-29', 'YYYY-MM-DD'), 'Completed', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (34, 78, TO_DATE('2024-02-24', 'YYYY-MM-DD'), 'Completed', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (35, 22, TO_DATE('2024-03-30', 'YYYY-MM-DD'), 'Processing', 7);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (36, 14, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Cancelled', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (37, 62, TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Processing', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (38, 89, TO_DATE('2024-04-18', 'YYYY-MM-DD'), 'Filled', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (39, 48, TO_DATE('2024-06-03', 'YYYY-MM-DD'), 'Cancelled', 9);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (40, 66, TO_DATE('2024-05-13', 'YYYY-MM-DD'), 'Cancelled', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (41, 76, TO_DATE('2024-05-08', 'YYYY-MM-DD'), 'Processing', 5);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (42, 8, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Cancelled', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (43, 88, TO_DATE('2024-07-23', 'YYYY-MM-DD'), 'Completed', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (44, 72, TO_DATE('2024-11-05', 'YYYY-MM-DD'), 'Processing', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (45, 8, TO_DATE('2024-09-11', 'YYYY-MM-DD'), 'Processing', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (46, 35, TO_DATE('2024-09-29', 'YYYY-MM-DD'), 'Processing', 2);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (47, 99, TO_DATE('2024-07-27', 'YYYY-MM-DD'), 'Filled', 1);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (48, 23, TO_DATE('2024-06-20', 'YYYY-MM-DD'), 'Cancelled', 2);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (49, 100, TO_DATE('2024-02-19', 'YYYY-MM-DD'), 'Filled', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (50, 6, TO_DATE('2024-07-08', 'YYYY-MM-DD'), 'Ready for Pickup', 9);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (51, 94, TO_DATE('2024-05-29', 'YYYY-MM-DD'), 'Processing', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (52, 67, TO_DATE('2024-05-19', 'YYYY-MM-DD'), 'Cancelled', 3);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (53, 84, TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'Ready for Pickup', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (54, 27, TO_DATE('2024-03-26', 'YYYY-MM-DD'), 'Cancelled', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (55, 88, TO_DATE('2024-01-26', 'YYYY-MM-DD'), 'Filled', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (56, 2, TO_DATE('2024-10-24', 'YYYY-MM-DD'), 'Completed', 1);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (57, 59, TO_DATE('2024-06-02', 'YYYY-MM-DD'), 'Completed', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (58, 89, TO_DATE('2024-02-08', 'YYYY-MM-DD'), 'Filled', 9);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (59, 31, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Cancelled', 9);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (60, 45, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Processing', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (61, 1, TO_DATE('2024-10-03', 'YYYY-MM-DD'), 'Filled', 3);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (62, 59, TO_DATE('2024-07-13', 'YYYY-MM-DD'), 'Processing', 9);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (63, 13, TO_DATE('2024-03-09', 'YYYY-MM-DD'), 'Ready for Pickup', 2);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (64, 96, TO_DATE('2024-09-23', 'YYYY-MM-DD'), 'Processing', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (65, 9, TO_DATE('2024-10-08', 'YYYY-MM-DD'), 'Processing', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (66, 36, TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'Cancelled', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (67, 11, TO_DATE('2024-03-12', 'YYYY-MM-DD'), 'Ready for Pickup', 5);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (68, 52, TO_DATE('2024-10-24', 'YYYY-MM-DD'), 'Ready for Pickup', 3);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (69, 79, TO_DATE('2024-03-22', 'YYYY-MM-DD'), 'Ready for Pickup', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (70, 83, TO_DATE('2024-03-11', 'YYYY-MM-DD'), 'Filled', 9);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (71, 56, TO_DATE('2024-10-06', 'YYYY-MM-DD'), 'Cancelled', 3);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (72, 62, TO_DATE('2024-11-03', 'YYYY-MM-DD'), 'Cancelled', 9);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (73, 92, TO_DATE('2024-03-26', 'YYYY-MM-DD'), 'Processing', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (74, 97, TO_DATE('2024-04-27', 'YYYY-MM-DD'), 'Filled', 3);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (75, 64, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'Ready for Pickup', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (76, 76, TO_DATE('2024-05-31', 'YYYY-MM-DD'), 'Filled', 1);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (77, 50, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Completed', 3);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (78, 79, TO_DATE('2024-04-24', 'YYYY-MM-DD'), 'Cancelled', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (79, 59, TO_DATE('2024-03-06', 'YYYY-MM-DD'), 'Cancelled', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (80, 99, TO_DATE('2024-10-01', 'YYYY-MM-DD'), 'Processing', 7);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (81, 93, TO_DATE('2024-02-12', 'YYYY-MM-DD'), 'Ready for Pickup', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (82, 73, TO_DATE('2024-08-18', 'YYYY-MM-DD'), 'Processing', 5);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (83, 55, TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'Ready for Pickup', 1);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (84, 98, TO_DATE('2024-06-22', 'YYYY-MM-DD'), 'Filled', 3);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (85, 30, TO_DATE('2024-06-07', 'YYYY-MM-DD'), 'Filled', 10);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (86, 17, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 'Ready for Pickup', 7);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (87, 47, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 'Completed', 2);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (88, 91, TO_DATE('2024-07-29', 'YYYY-MM-DD'), 'Completed', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (89, 45, TO_DATE('2024-08-09', 'YYYY-MM-DD'), 'Cancelled', 4);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (90, 44, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Cancelled', 1);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (91, 94, TO_DATE('2024-05-11', 'YYYY-MM-DD'), 'Cancelled', 3);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (92, 14, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Processing', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (93, 87, TO_DATE('2024-03-16', 'YYYY-MM-DD'), 'Ready for Pickup', 3);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (94, 16, TO_DATE('2024-06-22', 'YYYY-MM-DD'), 'Cancelled', 2);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (95, 47, TO_DATE('2024-10-16', 'YYYY-MM-DD'), 'Filled', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (96, 59, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Filled', 2);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (97, 66, TO_DATE('2024-06-20', 'YYYY-MM-DD'), 'Cancelled', 2);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (98, 52, TO_DATE('2024-09-02', 'YYYY-MM-DD'), 'Processing', 6);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (99, 62, TO_DATE('2024-06-12', 'YYYY-MM-DD'), 'Processing', 8);

INSERT INTO Orders (order_id, customer_id, order_date, status, store_id) 
VALUES (100, 56, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 'Completed', 10);

-------- Order Details -------


INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (1, 24, 20, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (2, 10, 5, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (3, 17, 50, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (4, 60, 35, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (5, 94, 6, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (6, 50, 23, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (7, 18, 15, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (8, 61, 29, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (9, 84, 17, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (10, 51, 13, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (11, 50, 1, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (12, 13, 38, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (13, 29, 26, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (14, 51, 22, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (15, 18, 27, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (16, 73, 16, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (17, 2, 36, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (18, 23, 4, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (19, 62, 25, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (20, 86, 2, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (21, 72, 11, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (22, 58, 34, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (23, 78, 45, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (24, 54, 15, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (25, 88, 38, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (26, 38, 48, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (27, 96, 31, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (28, 66, 7, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (29, 47, 9, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (30, 93, 19, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (31, 32, 31, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (32, 5, 24, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (33, 43, 36, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (34, 5, 19, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (35, 42, 48, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (36, 43, 26, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (37, 55, 18, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (38, 91, 31, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (39, 72, 44, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (40, 88, 27, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (41, 8, 29, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (42, 17, 4, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (43, 28, 2, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (44, 9, 6, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (45, 54, 11, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (46, 27, 3, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (47, 73, 33, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (48, 49, 28, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (49, 28, 41, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (50, 61, 33, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (51, 37, 27, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (52, 40, 13, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (53, 5, 24, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (54, 62, 38, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (55, 1, 5, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (56, 97, 36, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (57, 17, 36, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (58, 83, 26, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (59, 34, 30, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (60, 23, 20, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (61, 79, 14, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (62, 3, 43, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (63, 55, 15, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (64, 28, 43, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (65, 6, 20, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (66, 99, 8, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (67, 90, 49, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (68, 82, 43, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (69, 96, 50, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (70, 47, 32, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (71, 34, 32, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (72, 75, 1, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (73, 80, 3, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (74, 57, 10, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (75, 34, 32, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (76, 93, 25, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (77, 10, 25, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (78, 94, 4, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (79, 68, 30, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (80, 58, 38, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (81, 10, 38, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (82, 70, 40, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (83, 32, 28, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (84, 93, 1, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (85, 18, 38, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (86, 69, 16, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (87, 28, 21, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (88, 88, 1, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (89, 83, 50, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (90, 40, 45, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (91, 35, 49, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (92, 42, 26, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (93, 89, 16, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (94, 80, 26, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (95, 99, 39, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (96, 70, 5, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (97, 23, 3, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (98, 21, 10, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (99, 6, 28, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (100, 61, 17, 5);


INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (151, 27, 23, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (152, 84, 2, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (153, 82, 41, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (154, 50, 4, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (155, 18, 25, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (156, 56, 42, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (157, 87, 43, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (158, 37, 21, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (159, 43, 13, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (160, 82, 48, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (161, 36, 29, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (162, 85, 4, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (163, 29, 34, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (164, 89, 3, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (165, 18, 36, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (166, 87, 45, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (167, 80, 45, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (168, 35, 13, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (169, 90, 38, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (170, 48, 26, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (171, 18, 16, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (172, 85, 41, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (173, 61, 40, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (174, 87, 27, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (175, 30, 23, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (176, 41, 39, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (177, 11, 30, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (178, 37, 15, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (179, 62, 40, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (180, 2, 30, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (181, 73, 16, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (182, 31, 8, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (183, 14, 15, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (184, 72, 39, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (185, 32, 41, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (186, 87, 46, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (187, 70, 9, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (188, 92, 18, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (189, 100, 26, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (190, 55, 30, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (191, 86, 28, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (192, 63, 17, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (193, 98, 26, 5);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (194, 10, 26, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (195, 63, 3, 3);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (196, 27, 9, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (197, 78, 50, 4);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (198, 70, 24, 1);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (199, 76, 37, 2);

INSERT INTO OrderDetail (order_detail_id, order_id, product_id, quantity) 
VALUES (200, 59, 7, 4);

----- END of DDL ------

SELECT * FROM OrderDetail;
SELECT * FROM Orders;
SELECT * FROM Store_Inventory;
SELECT * FROM Supplier_Product_Mapping;
SELECT * FROM Product;
SELECT * FROM Suppliers;
SELECT * FROM Customer;