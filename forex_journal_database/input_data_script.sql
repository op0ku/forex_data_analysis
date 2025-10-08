-- select db
USE forex_journal;

-- check current sql mode for data storage
SELECT @@GLOBAL.sql_mode;

-- remove strict constraint
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';

-- temporarily turn off auto commit
SET autocommit=0;

-- disable foreign key check constraint
SET FOREIGN_KEY_CHECKS=0;

-- import Trade.csv
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/trade_table_no_fvg.csv'
INTO TABLE trade
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Trade_id, Trade_open, Trade_close, Session, Asset, Position, Bias, Profile, Entry, Confirmation);
SET Fvg_level = NULLIF(TRIM(@Fvg_level), '');

-- show trade table
SELECT * FROM trade;

-- Import risk_management.csv
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Risk_Management.csv'
INTO TABLE risk_management
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Risk_id, Trade_id,Stop_loss_pips, Take_profit_pips, Risk_to_reward, Risk_usd, Profit_loss, Trail_stop, Outcome, Balance);

-- show risk_management table
SELECT * FROM risk_management;

-- Import daily_candle_data.csv
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/dcd.csv'
INTO TABLE daily_candle_data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DCD_id, Trade_id, Daily_candle, Candle_range_pips);

-- show daily_candle_data table
SELECT * FROM daily_candle_data;
    
    -- Import psychology.csv
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/psychology.csv'
INTO TABLE psychology
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Psychology_id, Trade_id, Setup_alignment, Pre_emotion, Post_emotion, Retake_trade, Mental_state);

-- show psychology table
SELECT * FROM psychology;

-- restore constraints
SET GLOBAL sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
SET FOREIGN_KEY_CHECKS=1;
SET autocommit=1;

COMMIT;