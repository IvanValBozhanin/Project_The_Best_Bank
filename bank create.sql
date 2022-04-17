CREATE DATABASE IF NOT EXISTS `best_bank`;

CREATE TABLE positions(
    id int AUTO_INCREMENT,
    salary decimal(10, 2) NOT NULL CHECK (salary > 1.00),
    working_hours int NOT NULL CHECK (working_hours > 0),
    PRIMARY KEY(id)
);

CREATE TABLE employee(
    id int AUTO_INCREMENT,
    username char(30) NOT null,
    hash_pass char(100) NOT null,
    pin char(10) NOT null,
    address char(100),
    remaining_days_off int NOT null CHECK(remaining_days_off >= 0),
    position_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (position_id) REFERENCES positions(id)
);

CREATE TABLE client(
    id int AUTO_INCREMENT,
    username char(30) NOT null,
    hash_pass char(100) NOT null,
    pin char(10) NOT null,
    address char(100),
    PRIMARY KEY (id)
);

CREATE TABLE client_employee(
    client_id int NOT null,
    employee_id int NOT null,
    PRIMARY KEY (client_id, employee_id),
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE account(
    id int AUTO_INCREMENT,
    balance decimal(10,2) NOT null CHECK (balance >= 0.0),
    dt date not null,
    PRIMARY KEY (id)
);

CREATE TABLE account_client(
    account_id int NOT null,
    client_id int NOT null,
    PRIMARY KEY (account_id, client_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE deposit(
    id int AUTO_INCREMENT,
    dt date NOT null,
    sum decimal(10,2) NOT null CHECK (sum > 0.0),
    PRIMARY KEY (id)
);

CREATE TABLE draw(
    id int AUTO_INCREMENT,
    dt date NOT null,
    sum decimal(10,2) NOT null CHECK (sum > 0.0),
    PRIMARY KEY (id)
);

CREATE TABLE account_deposit(
    account_id int NOT null,
    deposit_id int NOT null,
    PRIMARY KEY (account_id, deposit_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (deposit_id) REFERENCES deposit(id)
);

CREATE TABLE account_draw(
    account_id int NOT null,
    draw_id int NOT null,
    PRIMARY KEY (account_id, draw_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (draw_id) REFERENCES draw(id)
);

