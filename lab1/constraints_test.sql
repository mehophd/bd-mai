-- Тест 1. Клиент младше 18 лет
INSERT INTO clients (first_name, last_name, email, phone, birth_date, driver_license)
VALUES ('Тест', 'Младший', 'young@test.ru', '+7-900-000-00-00', '2025-01-01', 'DL-999-ZZZ');

-- Тест 2. Дублирование email клиента
INSERT INTO clients (first_name, last_name, email, phone, birth_date, driver_license)
VALUES ('Дубль', 'Петров', 'ivan.petrov@mail.ru', '+7-900-999-99-99', '1995-06-01', 'DL-100-XXX');

-- Тест 3. Отрицательный пробег автомобиля
INSERT INTO cars (category_id, branch_id, brand, model, year, vin, license_plate, mileage, status)
VALUES (1, 1, 'Lada', 'Granta', 2022, 'XTA21901010000001', 'Z999ZZ777', -500, 'available');

-- Тест 4. Дата окончания раньше даты начала аренды
INSERT INTO rentals (client_id, car_id, start_date, end_date, total_cost, status)
VALUES (1, 1, '2025-06-10', '2025-06-01', 5000.00, 'active');

-- Тест 5. Недопустимый способ оплаты
INSERT INTO payments (rental_id, amount, payment_date, payment_method, payment_number)
VALUES (1, 5000.00, '2025-05-01', 'bitcoin', 'PAY-2025-9999');