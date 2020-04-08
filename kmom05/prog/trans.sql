--
-- Create procedures and triggers in KMOM05
-- By Usama Saleem for course Database Technologies for the Web.
-- 2020-03-24
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
-- Log table
--
DROP TABLE IF EXISTS account_log;
CREATE TABLE account_log
(
	`id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `when` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `what` VARCHAR(20),
    `account` CHAR(4),
    `balance` DECIMAL(4, 2),
    `amount` DECIMAL(4, 2)
);

-- DELETE FROM account_log;
SELECT * FROM account_log;

--
-- Procedure move_money()
--
DROP PROCEDURE IF EXISTS move_money;

DELIMITER ;;

CREATE PROCEDURE move_money(
	from_account CHAR(4),
	to_account CHAR(4),
	amount NUMERIC(4, 2)
)
MAIN:BEGIN
	DECLARE current_balance NUMERIC(4, 2);
    
	START TRANSACTION;
    
    SET current_balance = (SELECT balance FROM account WHERE id = from_account);
    SELECT current_balance;
    
    IF current_balance - amount < 0 THEN
		ROLLBACK;
        SELECT 'Amount on the account is not enought to make transaction.' AS message;
        LEAVE MAIN;
	END IF;
    
	UPDATE account
		SET
			balance = balance + 1.5
		WHERE
			id = to_account;

	UPDATE account
		SET
			balance = balance - 1.5
		WHERE
			id = from_account;
	
    -- INSERT INTO
	-- account_log (what, account, amount)
    -- VALUES
	-- 	('move_money from', from_account, -amount),
    --  ('move_money to', to_account, amount);
	
    COMMIT;
	SELECT * FROM account;
END
;;

DELIMITER ;

CALL move_money('1111', '2222', 1.5);

-- 
-- Trigger for logging updating balance
--
DROP TRIGGER IF EXISTS log_balance_update;

CREATE TRIGGER log_balance_update
AFTER UPDATE
ON account FOR EACH ROW
	INSERT INTO account_log (`what`, `account`, `balance`, `amount`)
		VALUES ('trigger', NEW.id, NEW.balance, NEW.balance - OLD.balance);

--
-- Trigger with compound statement
--
-- DROP TRIGGER IF EXISTS trigger_test1;
-- 
-- DELIMITER ;;
-- 
-- CREATE TRIGGER trigget_test1
-- AFTER UPDATE
-- ON account FOR EACH ROW
-- BEGIN
-- 	-- Some compound statements
-- END
-- ;;

-- DELIMITER ;

--
-- Trigger with compound statement and user defined errors
--
-- DROP TRIGGER IF EXISTS trigger_test2;
-- 
-- DELIMITER ;;
-- 
-- CREATE TRIGGER trigger_test2
-- BEFORE UPDATE
-- ON account FOR EACH ROW
-- BEGIN
--     SIGNAL SQLSTATE '45000' SET message_text = 'My Error Message';
-- END
-- ;;
-- 
-- DELIMITER ;
-- 
-- UPDATE account
-- SET
-- 	balance = 10.0
-- ;

--
-- To see what triggers are in the database
--
-- SHOW TRIGGERS;
-- SHOW TRIGGERS LIKE 'account' \G;
-- SHOW TRIGGERS FROM dbwebb \G;