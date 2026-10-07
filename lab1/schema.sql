CREATE TABLE clients (
    client_id       SERIAL PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    email           VARCHAR(50) NOT NULL UNIQUE,
    phone           VARCHAR(16)  NOT NULL,
    birth_date      DATE         NOT NULL,
    driver_license  VARCHAR(18)  NOT NULL UNIQUE,

    CONSTRAINT chk_client_age CHECK (
        birth_date <= CURRENT_DATE - INTERVAL '18 years'
    )
);

CREATE TABLE branches (
    branch_id   SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    address     VARCHAR(255) NOT NULL UNIQUE,
    phone       VARCHAR(16)  NOT NULL
);

CREATE TABLE car_categories (
    category_id        SERIAL PRIMARY KEY,
    name               VARCHAR(50)    NOT NULL UNIQUE,
    description        TEXT,
    base_price_per_day NUMERIC(10, 2) NOT NULL,

    CONSTRAINT chk_category_price CHECK (base_price_per_day > 0)
);

CREATE TABLE cars (
    car_id        SERIAL PRIMARY KEY,
    category_id   INT          NOT NULL,
    branch_id     INT          NOT NULL,
    brand         VARCHAR(50)  NOT NULL,
    model         VARCHAR(50)  NOT NULL,
    year          INT          NOT NULL,
    vin           VARCHAR(17)  NOT NULL UNIQUE,
    license_plate VARCHAR(15)  NOT NULL UNIQUE,
    mileage       INT          NOT NULL,
    status        VARCHAR(20)  NOT NULL DEFAULT 'available',

    CONSTRAINT fk_car_category FOREIGN KEY (category_id)
        REFERENCES car_categories (category_id) ON DELETE RESTRICT,
    CONSTRAINT fk_car_branch FOREIGN KEY (branch_id)
        REFERENCES branches (branch_id) ON DELETE RESTRICT,

    CONSTRAINT chk_car_year CHECK (year >= 2000),
    CONSTRAINT chk_car_mileage CHECK (mileage >= 0),
    CONSTRAINT chk_car_status CHECK (status IN ('available', 'rented', 'maintenance'))
);

CREATE TABLE rentals (
    rental_id   SERIAL PRIMARY KEY,
    client_id   INT            NOT NULL,
    car_id      INT            NOT NULL,
    start_date  DATE           NOT NULL,
    end_date    DATE           NOT NULL,
    total_cost  NUMERIC(10, 2) NOT NULL,
    status      VARCHAR(20)    NOT NULL DEFAULT 'active',

    CONSTRAINT fk_rental_client FOREIGN KEY (client_id)
        REFERENCES clients (client_id) ON DELETE RESTRICT,
    CONSTRAINT fk_rental_car FOREIGN KEY (car_id)
        REFERENCES cars (car_id) ON DELETE RESTRICT,

    CONSTRAINT chk_rental_dates CHECK (end_date >= start_date),
    CONSTRAINT chk_rental_cost CHECK (total_cost > 0),
    CONSTRAINT chk_rental_status CHECK (status IN ('active', 'completed', 'cancelled'))
);

CREATE TABLE payments (
    payment_id     SERIAL PRIMARY KEY,
    rental_id      INT            NOT NULL,
    amount         NUMERIC(10, 2) NOT NULL,
    payment_date   DATE           NOT NULL,
    payment_method VARCHAR(20)    NOT NULL,
    payment_number VARCHAR(50)    NOT NULL UNIQUE,

    CONSTRAINT fk_payment_rental FOREIGN KEY (rental_id)
        REFERENCES rentals (rental_id) ON DELETE CASCADE,

    CONSTRAINT chk_payment_amount CHECK (amount > 0),
    CONSTRAINT chk_payment_method CHECK (payment_method IN ('cash', 'card', 'transfer'))
);