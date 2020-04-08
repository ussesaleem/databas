--
-- Example transactions
--
DROP TABLE IF EXISTS account;
CREATE TABLE account
(
	`id` CHAR(4) PRIMARY KEY,
    `name` VARCHAR(8),
    `balance` DECIMAL(4, 2)
);

-- DELETE FROM account;
INSERT INTO account
VALUES
	("1111", "Adam", 10.0),
    ("2222", "Eva", 7.0)
;

SELECT * FROM account;

--
-- Move the money
--
UPDATE account
SET
	balance = balance + 1.5
WHERE
	id = "2222";

UPDATE account
SET
	balance = balance - 1.5
WHERE
	id = "1111";
    
SELECT * FROM account;

-- The database is not consistent in the above example as there is more money in the
-- database between the transaction. Thus we use the method TRANSACTION.

--
-- Move the money, within a transaction
--
START TRANSACTION;

UPDATE account
SET
	balance = balance + 1.5
WHERE
	id = "2222";

UPDATE account
SET
	balance = balance - 1.5
WHERE
	id = "1111";

COMMIT;
ROLLBACK;

SELECT * FROM account;