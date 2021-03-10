-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
SELECT avg(dau) FROM (SELECT count(distinct user_id) as dau FROM login_history WHERE strftime('%Y-%m-%d', login_timestamp, 'unixepoch') < DATE("2018-06-02") GROUP BY strftime('%Y-%m-%d', login_timestamp, 'unixepoch'));
SELECT avg(dau) FROM (SELECT count(distinct user_id) as dau FROM login_history WHERE strftime('%Y-%m-%d', login_timestamp, 'unixepoch') >= DATE("2018-06-02") GROUP BY strftime('%Y-%m-%d', login_timestamp, 'unixepoch'));

-- PART 2: Create a SQL query that indicates the number of status changes by card
SELECT cardID, count(cardID) FROM (SELECT cardID FROM card_change_history) GROUP BY cardID;
-- This includes the first change, going from null to some status