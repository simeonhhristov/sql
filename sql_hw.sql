CREATE SCHEMA BankAccounts;
USE BankAccounts;

CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(256) NOT NULL,
  email VARCHAR(256) NOT NULL,
  phone_number CHAR(10)
);

ALTER TABLE users
ADD CONSTRAINT validEmail CHECK ( email LIKE '%_@__%.__%');

CREATE TABLE accounts(
  id INT(11) NOT NULL  AUTO_INCREMENT PRIMARY KEY,
  account_balance DECIMAL(16, 2) NOT NULL  DEFAULT 0,
  user INT(11),
  FOREIGN KEY (user) REFERENCES users(id)
);

INSERT INTO users(username, email, phone_number)
VALUES ('user1', 'user1@email.com', '0881234567'),
       ('user2', 'user2@email.com', '0881234568'),
       ('user3', 'user3@email.com', '0881234569');

INSERT INTO accounts (account_balance, user)
VALUES (1900.20, 1),
       (200000.30, 3),
       (212124.95, 1),
       (124124.40, 2),
       (90.20, 1);

SELECT users.username, accounts.id, accounts.account_balance
FROM accounts JOIN users on users.id = accounts.user
WHERE account_balance >1000;

INSERT INTO users (username, email, phone_number)
SELECT username, email, phone_number FROM users
WHERE username = 'user2';