-- BUYER Data
INSERT INTO buyer (buyername, department, position, supervisor) VALUES
('Mary Smith', 'Purchasing', 'Manager', NULL),
('Pete Hansen', 'Purchasing', 'Buyer 3', 'Mary Smith'),
('Nancy Meyers', 'Purchasing', 'Buyer 1', 'Pete Hansen'),
('Cindy Lo', 'Purchasing', 'Buyer 2', 'Mary Smith'),
('Jerry Martin', 'Purchasing', 'Buyer 1', 'Cindy Lo');

-- RETAIL_ORDER Data
INSERT INTO retail_order (ordernumber, storenumber, storezip, ordermonth, orderyear, ordertotal) VALUES
(1000, 10, '98110', 'December', 2020, 445.00),
(2000, 20, '02335', 'December', 2020, 310.00),
(3000, 10, '98110', 'January', 2021, 480.00);

-- SKU_DATA Data
INSERT INTO sku_data (sku, sku_description, department, buyer) VALUES
(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 'Pete Hansen'),
(100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 'Pete Hansen'),
(100300, 'Std. Scuba Tank, Light Blue', 'Water Sports', 'Pete Hansen'),
(100400, 'Std. Scuba Tank, Dark Blue', 'Water Sports', 'Pete Hansen'),
(100500, 'Std. Scuba Tank, Light Green', 'Water Sports', 'Pete Hansen'),
(100600, 'Std. Scuba Tank, Dark Green', 'Water Sports', 'Pete Hansen'),
(101100, 'Dive Mask, Small Clear', 'Water Sports', 'Nancy Meyers'),
(101200, 'Dive Mask, Med Clear', 'Water Sports', 'Nancy Meyers'),
(201000, 'Half-dome Tent', 'Camping', 'Cindy Lo'),
(202000, 'Half-dome Tent Vestibule', 'Camping', 'Cindy Lo'),
(203000, 'Half-dome Tent Vestibule - Wide', 'Camping', 'Cindy Lo'),
(301000, 'Light Fly Climbing Harness', 'Climbing', 'Jerry Martin'),
(302000, 'Locking Carabiner, Oval', 'Climbing', 'Jerry Martin');

-- ORDER_ITEM Data
INSERT INTO order_item (ordernumber, sku, quantity, price, extendedprice) VALUES
(1000, 201000, 1, 300.00, 300.00),
(1000, 202000, 1, 130.00, 130.00),
(2000, 101100, 4, 50.00, 200.00),
(2000, 101200, 2, 50.00, 100.00),
(3000, 100200, 1, 300.00, 300.00),
(3000, 101100, 2, 50.00, 100.00),
(3000, 101200, 1, 50.00, 50.00);

-- WAREHOUSE Data
INSERT INTO warehouse (warehouseid, warehousecity, warehousestate, manager, squarefeet) VALUES
(100, 'Atlanta', 'GA','Dave Jones', 125000),
(200, 'Chicago', 'IL', 'Lucille Smith', 100000),
(300, 'Bangor', 'ME', 'Bart Evans', 150000),
(400, 'Seattle', 'WA','Dale Rogers', 130000),
(500, 'San Francisco', 'CA','Grace Jefferson', 200000);

-- INVENTORY Data
INSERT INTO inventory (warehouseid, sku, sku_description, quantityonhand, quantityonorder) VALUES
(100, 100100, 'Std. Scuba Tank, Yellow', 250, 0),
(200, 100100, 'Std. Scuba Tank, Yellow', 100, 50),
(300, 100100, 'Std. Scuba Tank, Yellow', 100, 0),
(400, 100100, 'Std. Scuba Tank, Yellow', 200, 0),
(100, 100200, 'Std. Scuba Tank, Magenta', 200, 30),
(200, 100200, 'Std. Scuba Tank, Magenta', 75, 75),
(300, 100200, 'Std. Scuba Tank, Magenta', 100, 100),
(400, 100200, 'Std. Scuba Tank, Magenta', 250, 0),
(100, 101100, 'Dive Mask, Small Clear', 0, 500),
(200, 101100, 'Dive Mask, Small Clear', 0, 500),
(300, 101100, 'Dive Mask, Small Clear', 300, 200),
(400, 101100, 'Dive Mask, Small Clear', 450, 0),
(100, 101200, 'Dive Mask, Med Clear', 100, 500),
(200, 101200, 'Dive Mask, Med Clear', 50, 500),
(300, 101200, 'Dive Mask, Med Clear', 475, 0),
(400, 101200, 'Dive Mask, Med Clear', 250, 250),
(100, 201000, 'Half-dome Tent', 2, 100),
(200, 201000, 'Half-dome Tent', 10, 250),
(300, 201000, 'Half-dome Tent', 250, 0),
(400, 201000, 'Half-dome Tent', 0, 250),
(100, 202000, 'Half-dome Tent Vestibule', 10, 250),
(200, 202000, 'Half-dome Tent Vestibule', 1, 250),
(300, 202000, 'Half-dome Tent Vestibule', 100, 0),
(400, 202000, 'Half-dome Tent Vestibule', 0, 200),
(100, 301000, 'Light Fly Climbing Harness', 300, 250),
(200, 301000, 'Light Fly Climbing Harness', 250, 250),
(300, 301000, 'Light Fly Climbing Harness', 0, 250),
(400, 301000, 'Light Fly Climbing Harness', 0, 250),
(100, 302000, 'Locking Carabiner, Oval', 1000, 0),
(200, 302000, 'Locking Carabiner, Oval', 1250, 0),
(300, 302000, 'Locking Carabiner, Oval', 500, 500),
(400, 302000, 'Locking Carabiner, Oval', 0, 1000);

-- CATALOG_SKU_2019 Data
INSERT INTO catalog_sku_2019 (sku, sku_description, department, catalogpage, dateonwebsite) VALUES
(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '2019-01-01'),
(100500, 'Std. Scuba Tank, Light Green', 'Water Sports', NULL, '2019-07-01'),
(100600, 'Std. Scuba Tank, Dark Green', 'Water Sports', NULL, '2019-07-01'),
(101100, 'Dive Mask, Small Clear', 'Water Sports', 24, '2019-01-01'),
(101200, 'Dive Mask, Med Clear', 'Water Sports', 24, '2019-01-01'),
(201000, 'Half-dome Tent', 'Camping', 45, '2019-01-01'),
(202000, 'Half-dome Tent Vestibule', 'Camping', 47, '2019-01-01'),
(301000, 'Light Fly Climbing Harness', 'Climbing', 76, '2019-01-01'),
(302000, 'Locking Carabiner, Oval', 'Climbing', 78, '2019-01-01');

-- CATALOG_SKU_2020 Data
INSERT INTO catalog_sku_2020 (sku, sku_description, department, catalogpage, dateonwebsite) VALUES
(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '2020-01-01'),
(100300, 'Std. Scuba Tank, Light Blue', 'Water Sports', 23, '2020-01-01'),
(100400, 'Std. Scuba Tank, Dark Blue', 'Water Sports', NULL, '2020-08-01'),
(101100, 'Dive Mask, Small Clear', 'Water Sports', 26, '2020-01-01'),
(101200, 'Dive Mask, Med Clear', 'Water Sports', 26, '2020-01-01'),
(201000, 'Half-dome Tent', 'Camping', 46, '2020-01-01'),
(202000, 'Half-dome Tent Vestibule', 'Camping', 46, '2020-01-01'),
(301000, 'Light Fly Climbing Harness', 'Climbing', 77, '2020-01-01'),
(302000, 'Locking Carabiner, Oval', 'Climbing', 79, '2020-01-01');

-- CATALOG_SKU_2021 Data
INSERT INTO catalog_sku_2021 (sku, sku_description, department, catalogpage, dateonwebsite) VALUES
(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '2021-01-01'),
(100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 23, '2021-01-01'),
(101100, 'Dive Mask, Small Clear', 'Water Sports', 27, '2021-01-01'),
(101200, 'Dive Mask, Med Clear', 'Water Sports', 27, '2021-01-01'),
(201000, 'Half-dome Tent', 'Camping', 45, '2021-01-01'),
(202000, 'Half-dome Tent Vestibule', 'Camping', 45, '2021-01-01'),
(203000, 'Half-dome Tent Vestibule - Wide', 'Camping', NULL, '2021-04-01'),
(301000, 'Light Fly Climbing Harness', 'Climbing', 76, '2021-01-01'),
(302000, 'Locking Carabiner, Oval', 'Climbing', 78, '2021-01-01');
