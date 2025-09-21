-- δημιουργεί DB + app user την πρώτη φορά που ανοίγει άδειος ο data dir
CREATE DATABASE IF NOT EXISTS payment_service;

CREATE USER IF NOT EXISTS 'appuser'@'%' IDENTIFIED BY 'appsecretSTRONG!';
GRANT ALL PRIVILEGES ON payment_service.* TO 'appuser'@'%';
FLUSH PRIVILEGES;