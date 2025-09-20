ALTER TABLE transactions
  DROP FOREIGN KEY fk_status;

ALTER TABLE transactions
  MODIFY COLUMN status VARCHAR(32) NOT NULL;
