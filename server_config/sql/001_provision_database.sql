-- skip-grant-tables有効化して認証外したのでコメントアウト
-- 初回のパスワードポリシーを満たすパスワードを設定（適当でよい）
-- SET password FOR root@localhost=password('uQvdquWj3=bW');
-- パスワードポリシーの変更
-- SET global validate_password_policy=LOW;
-- SET global validate_password_length=6;
-- パスワードの変更
-- SET password FOR root@localhost=password('admin');
-- 各種初期設定
DROP DATABASE IF EXISTS gotrading;

CREATE DATABASE gotrading DEFAULT CHARACTER SET utf8mb4;

-- # skip-grant-tables有効化して認証外したのでコメントアウト
-- GRANT USAGE ON *.* TO 'tradeuser'@'localhost' IDENTIFIED BY 'pass';
-- GRANT ALL PRIVILEGES ON `gotrading`.* TO 'tradeuser'@'localhost' WITH GRANT OPTION;
-- GRANT ALL PRIVILEGES ON `gotrading%`.* TO 'tradeuser'@'localhost' WITH GRANT OPTION;
-- GRANT USAGE ON *.* TO 'tradeuser'@'%' IDENTIFIED BY 'pass';
-- GRANT ALL PRIVILEGES ON `gotrading`.* TO 'tradeuser'@'%' WITH GRANT OPTION;
-- GRANT ALL PRIVILEGES ON `gotrading%`.* TO 'tradeuser'@'%' WITH GRANT OPTION;
-- CREATE USER 'tradeuser'@'*';