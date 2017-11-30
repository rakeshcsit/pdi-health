-- the day they report their first inr

-- and then they need an inr every 7 days after that or by at least that day next week?

-- so 

-- last inr was reported 3 days

-- if 4 days then since last inr 

-- this could be a fucking case statement or some shit

-- how many inrs did patient do

-- 4. How does Remote Cardiac Services help assure compliance?
-- A comprehensive system to encourage testing schedule adherence is provided to each patient. If a patient misses 1 test, an automated reminder call is sent. If 2 tests are missed, both an automated and live call are made. If 3 tests are missed, a live call is made and contact is made with the prescribing office. If 4 tests are missed, a letter is sent to both the patient and doctor. The patient will also receive periodic mail reminders throughout the year regarding the importance of self-testing. If a patient fails to resume scheduled testing without reason the physician is notified and the patient is removed from service.




--This code just generates 30 day windows.

DROP TABLE temp_dates;

CREATE TEMPORARY TABLE temp_dates (
	inr_date DATE
	,customer_id INT PRIMARY KEY
	);

INSERT INTO temp_dates (
	inr_date
	,customer_id
	)
VALUES (
	'2016-09-01'
	,1
	)
	,(
	'2016-07-23'
	,2
	)
	,(
	'2017-09-14'
	,3
	)
	,(
	'2015-08-08'
	,4
	);

SELECT *
FROM temp_dates;

WITH RECURSIVE interval_cte (
	customer_id
	,inr_date
	)
AS (
	SELECT customer_id
		,CAST(inr_date AS DATE)
	FROM temp_dates

	UNION ALL

	SELECT d.customer_id
		,CAST(interval_cte.inr_date + CAST('30 days' AS INTERVAL) AS DATE) AS inr_date
	FROM temp_dates AS d
	INNER JOIN interval_cte ON interval_cte.customer_id = d.customer_id
	WHERE interval_cte.inr_date < '2017-09-01'
	)

SELECT i.customer_id
	,i.inr_date AS interval_start
	,CAST(i.lag - CAST('1 day' AS INTERVAL) AS DATE) AS interval_end
FROM (
	SELECT customer_id
		,inr_date
		,LEAD(inr_date) OVER (
			PARTITION BY customer_id ORDER BY inr_date
			) AS lag
	FROM interval_cte
	ORDER BY interval_cte.customer_id
		,interval_cte.inr_date
	) AS i;