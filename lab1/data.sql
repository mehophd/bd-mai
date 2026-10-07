INSERT INTO car_categories (name, description, base_price_per_day) VALUES
('Economy',    'Небольшие экономичные автомобили',       1500.00),
('Comfort',    'Автомобили среднего класса',             3000.00),
('Premium',    'Автомобили премиум-класса',              7000.00),
('SUV',        'Внедорожники и кроссоверы',              5000.00);

INSERT INTO branches (name, address, phone) VALUES
('Главный',		 'г. Мытищи, ул. Пушкина, 52',       '+7-800-555-35-35'),
('Аэропорт',     'г. Москва, Шереметьево, терминал B', '+7-495-222-22-22'),
('Южный',        'г. Москва, Варшавское шоссе, 50',   '+7-495-333-33-33');

INSERT INTO clients (first_name, last_name, email, phone, birth_date, driver_license) VALUES
('Иван',   'Петров',    'ivan.petrov@mail.ru',    '+7-900-111-11-11', '1990-05-15', 'DL-001-AAA'),
('Мария',  'Сидорова',  'maria.sidorova@mail.ru', '+7-900-222-22-22', '1985-11-20', 'DL-002-BBB'),
('Алексей', 'Козлов',   'alex.kozlov@mail.ru',    '+7-900-333-33-33', '1998-03-08', 'DL-003-CCC'),
('Ольга',  'Новикова',  'olga.novikova@mail.ru',  '+7-900-444-44-44', '1992-07-25', 'DL-004-DDD'),
('Михаил', 'Бурмакин',  'michael.dengee@mai.ru',  '+7-800-555-35-35', '2006-02-23', 'DL-005-CBO');

INSERT INTO cars (category_id, branch_id, brand, model, year, vin, license_plate, mileage, status) VALUES
(1, 1, 'Hyundai',  'Solaris',    2022, 'KMHCT41DB1U000001', 'A001AA777', 15000,  'available'),
(2, 1, 'Toyota',   'Camry',      2023, 'JTDKN3DU5A0000002', 'B002BB777', 8000,   'rented'),
(3, 2, 'BMW',      'X5',         2023, 'WBAJB9C50KB000003', 'C003CC777', 3000,   'available'),
(4, 2, 'Toyota',   'RAV4',       2021, 'JTMBFREV5JD000004', 'D004DD777', 45000,  'maintenance'),
(1, 3, 'Kia',      'Rio',        2022, 'KMHCT41DB2U000005', 'E005EE777', 22000,  'available'),
(2, 3, 'Volkswagen','Passat',    2021, 'WVWZZZ3CZWE000006', 'F006FF777', 35000,  'available'),
(3, 1, 'Mercedes', 'E-Class',    2023, 'WDD2130481A000007', 'G007GG777', 5000,   'available');

INSERT INTO rentals (client_id, car_id, start_date, end_date, total_cost, status) VALUES
(1, 2, '2025-01-10', '2025-01-15', 15000.00, 'completed'),
(2, 3, '2025-02-01', '2025-02-05', 28000.00, 'completed'),
(3, 1, '2025-03-01', '2025-03-10', 13500.00, 'active'),
(4, 5, '2025-03-15', '2025-03-20', 7500.00,  'active'),
(1, 7, '2025-04-01', '2025-04-07', 42000.00, 'active');

INSERT INTO payments (rental_id, amount, payment_date, payment_method, payment_number) VALUES
(1, 15000.00, '2025-01-10', 'card',    'PAY-2025-0001'),
(2, 14000.00, '2025-02-01', 'card',    'PAY-2025-0002'),
(2, 14000.00, '2025-02-05', 'cash',    'PAY-2025-0003'),
(3, 5000.00,  '2025-03-01', 'transfer','PAY-2025-0004'),
(4, 7500.00,  '2025-03-15', 'card',    'PAY-2025-0005'),
(5, 20000.00, '2025-04-01', 'card',    'PAY-2025-0006');