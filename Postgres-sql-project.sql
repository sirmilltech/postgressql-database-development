
-- Table: call
CREATE TABLE call (
    id int  NOT NULL IDENTITY(1, 1),
    employee_id int  NOT NULL,  customer_id int  NOT NULL,
    start_time datetime  NOT NULL, end_time datetime  NULL,
    call_outcome_id int  NULL,
    CONSTRAINT call_ak_1 UNIQUE (employee_id, start_time),
    CONSTRAINT call_pk PRIMARY KEY  (id)
);
-- Table: call_outcome
CREATE TABLE call_outcome (
    id int  NOT NULL IDENTITY(1, 1),
    outcome_text char(128)  NOT NULL,
    CONSTRAINT call_outcome_ak_1 UNIQUE (outcome_text),
    CONSTRAINT call_outcome_pk PRIMARY KEY  (id)
);
-- Table: customer
CREATE TABLE customer (
    id int  NOT NULL IDENTITY(1, 1),
    customer_name varchar(255)  NOT NULL,
    city_id int  NOT NULL,
    customer_address varchar(255)  NOT NULL,
    next_call_date date  NULL,
    ts_inserted datetime  NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY  (id)
);
-- Table: employee
CREATE TABLE employee (
    id int  NOT NULL IDENTITY(1, 1),
    first_name varchar(255)  NOT NULL,
    last_name varchar(255)  NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY  (id)
);
-- foreign keys
-- Reference: call_call_outcome (table: call)
ALTER TABLE call ADD CONSTRAINT call_call_outcome
    FOREIGN KEY (call_outcome_id)
    REFERENCES call_outcome (id);
    
-- Reference: call_customer (table: call)
ALTER TABLE call ADD CONSTRAINT call_customer
    FOREIGN KEY (customer_id)
    REFERENCES customer (id);
 
-- Reference: call_employee (table: call)
ALTER TABLE call ADD CONSTRAINT call_employee
    FOREIGN KEY (employee_id)
    REFERENCES employee (id);
 
-- Reference: customer_city (table: customer)
ALTER TABLE customer ADD CONSTRAINT customer_city
    FOREIGN KEY (city_id)
    REFERENCES city (id);
    
-- insert values
INSERT INTO call_outcome (outcome_text) VALUES ('call started');
INSERT INTO call_outcome (outcome_text) VALUES ('finished - successfully');
INSERT INTO call_outcome (outcome_text) VALUES ('finished - unsuccessfully');
    
INSERT INTO employee (first_name, last_name) VALUES ('Thomas (Neo)', 'Anderson');
INSERT INTO employee (first_name, last_name) VALUES ('Agent', 'Smith');
    
INSERT INTO customer (customer_name, city_id, customer_address, next_call_date, ts_inserted) VALUES ('Jewelry Store', 4, 'Long Street 120', '2020/1/21', '2020/1/9 14:1:20');
INSERT INTO customer (customer_name, city_id, customer_address, next_call_date, ts_inserted) VALUES ('Bakery', 1, 'Kurfürstendamm 25', '2020/2/21', '2020/1/9 17:52:15');
INSERT INTO customer (customer_name, city_id, customer_address, next_call_date, ts_inserted) VALUES ('Café', 1, 'Tauentzienstraße 44', '2020/1/21', '2020/1/10 8:2:49');
INSERT INTO customer (customer_name, city_id, customer_address, next_call_date, ts_inserted) VALUES ('Restaurant', 3, 'Ulica lipa 15', '2020/1/21', '2020/1/10 9:20:21');
    
INSERT INTO call (employee_id, customer_id, start_time, end_time, call_outcome_id) VALUES (1, 4, '2020/1/11 9:0:15', '2020/1/11 9:12:22', 2);
INSERT INTO call (employee_id, customer_id, start_time, end_time, call_outcome_id) VALUES (1, 2, '2020/1/11 9:14:50', '2020/1/11 9:20:1', 2);
INSERT INTO call (employee_id, customer_id, start_time, end_time, call_outcome_id) VALUES (2, 3, '2020/1/11 9:2:20', '2020/1/11 9:18:5', 3);
INSERT INTO call (employee_id, customer_id, start_time, end_time, call_outcome_id) VALUES (1, 1, '2020/1/11 9:24:15', '2020/1/11 9:25:5', 3);
INSERT INTO call (employee_id, customer_id, start_time, end_time, call_outcome_id) VALUES (1, 3, '2020/1/11 9:26:23', '2020/1/11 9:33:45', 2);
INSERT INTO call (employee_id, customer_id, start_time, end_time, call_outcome_id) VALUES (1, 2, '2020/1/11 9:40:31', '2020/1/11 9:42:32', 2);
INSERT INTO call (employee_id, customer_id, start_time, end_time, call_outcome_id) VALUES (2, 4, '2020/1/11 9:41:17', '2020/1/11 9:45:21', 2);
INSERT INTO call (employee_id, customer_id, start_time, end_time, call_outcome_id) VALUES (1, 1, '2020/1/11 9:42:32', '2020/1/11 9:46:53', 3);
INSERT INTO call (employee_id, customer_id, start_time, end_time, call_outcome_id) VALUES (2, 1, '2020/1/11 9:46:0', '2020/1/11 9:48:2', 2);
INSERT INTO call (employee_id, customer_id, start_time, end_time, call_outcome_id) VALUES (2, 2, '2020/1/11 9:50:12', '2020/1/11 9:55:35', 2);

INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('India', 42.4387358, -76.4993682, 1, '1', '1','1','1','1','1');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('China', 35.0000663, 104.999955, 2,'2','2','2','2' ,'2','2');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Russia', 64.6863136, 97.7453061, 3,'3','3','3','3', '3','3');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Egypt', 26.2540493, 29.2675469, 4, '4','4','4','4','4','4');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('South Africa',-28.8166236, 24.991639, 5,'5','5','5','5','5','5');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Uganda', 1.5333554, 32.2166578, 6,'6','6','6','6','6','6','6')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Kenya', 1.4419683, 38.4313975, 7,'7','7','7','7','7','7','7');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Senegal', 14.4750607, -14.4529612, 8,'8','8','8','8','8','8','8');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Qatar', 23.9378628, 90.710378, 9,'9','9','9','9','9','9');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Kuwait', 29.2733964, 47.4979476, 10,'10','10','10','10','10','10');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Oman', 21.0000287, 57.0036901, 11,'11','11','11','11','11','11');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Yemen', 16.3471243, 47.8915271, 12,'12','12','12','12','12','12',);
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Pakistan', 30.3308401, 71.247499, 13,'13','13','13','13','13','13',);
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Afghanistan', 33.7680065, 66.2385139, 14,'14','14','14','14','14','14');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Turkey', 38.9597594, 34.9249653, 15,'15','15','15','15','15','15');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Nigeria', 9.6000359,  7.9999721, 17,'17','17','17','17','17','17');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Ghana', 8.0300284, -1.0800271, 18,'18','18','18','18','18','18');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('United Kingdom', 6.3110548, 20.5447525, 19,'19','19','19','19','19','19');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Germany', 51.1638175, 10.4478313, 20.'20'.'20'.'20'.'20'.'20'.'20');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Ireland', 52.865196, -7.9794599, 21,'21','21','21','21','21','21');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Albania', 41.000028, 19.9999619, 23,'23','23','23','23','23','23');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Algeria', 28.0000272, 2.9999825, 24,'24','24','24','24','24','24');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Angola',-11.8775768, 17.5691241, 25,'25','25','25','25','25','25');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Armenia', 40.1843827, 44.5114778, 26,'26','26','26','26','26','26');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Aruba', 12.5013629, -69.9618475, 27,'27','27','27','27','27','27');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Australia', -24.7761086, 134.755, 28,'28','28','28','28','28','28');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Austria', 47.59397, 14.12456, 29,'29','29','29','29','29','29');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Azerbaijan', 47.8222, -0.68333, 30,'30','30','30','30','30','30');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Bahamas', 24.7736546, -78.0000547, 31,'31','31','31','31','31','31');
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Bangladesh', 35.66782, -101.39739, 32,'32','32','32','32','32','32')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Manama', 26.2235041, 50.5822436, 33,'33','33','33','33','33','33')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Barbados', -2.75556, -42.82591, 34,'34','34','34','34','34','34')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Belarus', 53.4250605, 27.6971358, 35,'35','35','35','35','35','35')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Belgium', 50.8662678, 4.3490827, 36,'36','36','36','36','36','36')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Belize', 17.1204943, -88.6859028, 37,'37','37','37','37','37','37')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Botswana', -23.1681782, 24.5928742, 38,'38','38','38','38','38','38')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('British Indian Ocean Territory', 71.24165, -53.5647, 39,'39','39','39','39','39')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Bosnia and Herzegovina', 43.8544557, 4026968, 40,'40','40','40','40','40')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Bermuda', -8.46006, 118.72667, 41,'41','41','41','41','41','41')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Bhutan', 27.4382045, 89.6570135, 42,'42','42','42','42','42','42')
INSERT INTO city(city_name, lat, long, country_id, customer_id, call_id, call_outcome_id, sale_id, orders, product_id) VALUES ('Brazil', -15.7934036, -47.8823172, 43,'43','43','43','43','43','43')



SELECT * FROM customer;, call, city, product;

SELECT* FROM customer
WHERE customer in (SELECT customer from customer
INNER JOIN city ON city.customer_id = customerid
Group by customerid HAVING COUNT(*) =2);

SELECT * FROM CUSTOMER
INNER JOIN city ON city.customer_id = customerid
WHERE city_id = 'Egypt';

SELECT * FROM customer
WHERE customer in (SELECT customer FROM customer
INNER JOIN city ON city.customer_id = customerid
GROUP BY customerid HAVING COUNT(*) = 3/3);


SELECT * FROM p_customer_all()
SELECT * FROM v_customer_all()


SELECT * FROM country
INNER JOIN city ON city.country_id = country.id;

SELECT COUNT(*) AS number_of_rows
FROM country
LEFT JOIN city ON city.country_id = country.id;

SELECT COUNT(country.country_name) AS country,
COUNT(city.city_name) AS cities
FROM country
LEFT JOIN city ON city.country_id = country.id;



SELECT
COUNT(city.lat) AS lat_count, COUNT(city.long) AS lomg_count,
SUM(city.lat) AS lat_sum, SUM(city.long) AS long_sum,
AVG(city.lat) AS lat_avg, AVG(city.long) AS long_avg,
MIN(city.lat) AS lat_min, MIN(city.long) AS long_min,
MAX(city.lat) AS lat_max, MAX(city.long)AS long_max

FROM city;

SELECT
COUNT(city.lat) AS lat_count, COUNT(city.long) AS lomg_count,
SUM(city.lat) AS lat_sum, SUM(city.long) AS long_sum,
AVG(city.lat) AS lat_avg, AVG(city.long) AS long_avg,
MIN(city.lat) AS lat_min, MIN(city.long) AS long_min,
MAX(city.lat) AS lat_max, MAX(city.long)AS long_max

FROM city
INNER JOIN country ON country_id = country.id
GROUP BY country.country_name, country.id;

-- Return all countries together with the number of related calls and 
--their average duration in second. In the result display only countries 
--where average call duration is greater than the average call 
--duration of all calls
--=======================================================

SELECT country.country_name_eng,
SUM(CASE WHEN call.id IS NULL THEN 1 ELSE 0 END) AS calls,
AVG(COALESCE(EXTRACT(EPOCH FROM (call.end_time, call.start_time)),0)) AS avg_difference
FROM country
LEFT JOIN city ON city.country_id = country 
LEFT JOIN customer ON customer.city_id = city.id
LEFT JOIN call ON call.customer_id = cuatomerid 
GROUP BY 
country.id,
country.country_name_eng 
HAVING(AVG(COALESCE(EXTRACT(EPOCH FROM (call.end_time, call.start_time)),0)) >
(SELECT AVG(EXTRACT(EPOCH FROM (call.end_time, call.start_time))) FROM call)
ORDER BY calls DESC, country.id ASC;

--===============================================================

--Return all countries together with the number of related calls and their 
--average duration in seconds. In the result display only countries where average 
--call duration is greater than the average call duration of all calls.


select* from call;

SELECT 
AVG(COALESCE(EXTRACT(EPOCH FROM (call.end_time - call.start_time)))) 
FROM call;

SELECT
AVG(COALESCE(EXTRACT(EPOCH FROM (call.end_time - call.start_time)), 0))
FROM call;


SELECT country.country_name_eng,
SUM(case when call.id is not null then 1 else 0 end) As calls,
AVG(coalesce(extract(epoch from (call.end_time - call.start_time), 0)) as avg_difference)
From country
LEFT JOIN on city.country_id = country.id
LEFT JOIN customer ON customer.city_id = city.id
LEFT JOIN call ON call.customer_id = customerid

GROUP BY country.id, 
country.country_name_eng
ORDER BY calls DESC, country.id;

---==================================================


SELECT * FROM INFORMATION_SCHEMA.TABLES
SELECT * FROM INFORMATION_SCHEMA.SCHEMATA
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMNS_USAGE
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS


SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE table_name like 'country'


---LIST ALL CUSTOMER WITH EXACTLY 3 CALLS
SELECT customer.* from customer 
where customer in (select customer from customer
inner join call on call.customer_id = customerid
group by customerid having count(*)=3);

SELECT* FROM customer
where customer in (SELECT customer from customer
INNER JOIN city ON city.customer_id = customerid
GROUP BY customerid HAVING COUNT(*)=2);

---LIst all customer from egypt
select customer.* from customer 
inner join city on customer.city_id = city.id
where city_name = 'Egypt';

--======================================================
CREATE OR REPLACE FUNCTION GetCitiesEastWest(city_id INT)
RETURNS TEXT AS
$$
DECLARE
    east_cities TEXT := '';
    west_cities TEXT := '';
    city_longitude FLOAT;
    city_name TEXT;
    rec RECORD;
BEGIN
    -- Find the longitude of the given city
    SELECT longitude INTO city_longitude
    FROM cities
    WHERE id = city_id;

    -- Loop through all cities to find east and west cities
    FOR rec IN
        SELECT name, longitude
        FROM cities
        WHERE id != city_id  -- Exclude the given city itself
    LOOP
        IF rec.longitude > city_longitude THEN
            -- Add to east cities
            east_cities := east_cities || rec.name || ', ';
        ELSIF rec.longitude < city_longitude THEN
            -- Add to west cities
            west_cities := west_cities || rec.name || ', ';
        END IF;
    END LOOP;

    -- Remove trailing comma and space from both east and west cities
    IF LENGTH(east_cities) > 0 THEN
        east_cities := LEFT(east_cities, LENGTH(east_cities) - 2);
    END IF;

    IF LENGTH(west_cities) > 0 THEN
        west_cities := LEFT(west_cities, LENGTH(west_cities) - 2);
    END IF;

    -- Return the result string
    RETURN 'east: ' || east_cities || '; west: ' || west_cities;
END;
$$ LANGUAGE plpgsql;



--CREATE A REPORT THAT RETURNS A LIST OF ALL COUNTRY NAMES (IN ENGLISH) TOGETHR 
---WITH THE NUMBER OF RELATED CITIES WE HAVE IN THE DATABASE. YOU NEED TO SHOW ALL
--COUNTRIES AS WELL AS GIVE A REASONABLE NAME TO THE AGGREGATE COLUMN.
--ORDER THE RESULT BY COUNTRY NAME ASC.

SELECT country.country_name_eng, COUNT(city.id) AS number_of_cities
FROM country
INNER JOIN city ON city.country_id = country.id
GROUP BY country.id, country.country_name_eng 
ORDER BY country.id ASC;


--WRITE A QUERY THAT RETURN CUSTOMER ID AND NAME AND THE NUMBER OF CALLS RELATED TO 
--THAT CUSTOMER. RETURN ONLY CUSTOMERS THAT HAVE MORE THAN THE AVERAGE NUMBER
--OF CALLS OF ALL CUSTOMERS.

SELECT customer.first_name, COUNT(call_id) AS number_of_calls
FROM customer
INNER JOIN call on call.customer_id = customerid
GROUP BY customer.first_name, customerid
ORDER BY customerid Asc;

SELECT customer.first_name, 
Count(call_id) AS calls
FROM customer 
INNER JOIN call on call.customer_id = customerid 
GROUP by customerid, customer.first_name
HAVING COUNT(call_id) > (SELECT CAST(COUNT(*) AS DECIMAL(5,2)) / 
CAST(COUNT(DISTINCT customerid) AS DECIMAL(5,2)) FROM call);

---WE WANT TO EXAMINE WHAT IS IN THE CALL TABLE IN OUR MODEL. THEREFORE, 
--WE NEED TO SELECT ALL ATTRIBUTES AND WE'LL SORT THEM FIRST BY EMPLOYEE AND THEN
--BY START_TIME.

SELECT DISTINCT*
FROM CALL, customer, city, country, product
ORDER BY employee_id asc, call.start_time asc;


--WE NEED A QUERY THAT SHALL RETURN ALL CALL DATA, BUT ALSO THE DURATION OF EACH
-- CALL IN SECONDS, WE'LL USE THE PREVIOUS QUERY AS THE STARTING POINT.

SELECT call.*,
COALESCE(EXTRACT(EPOCH FROM (call.end_time - call.start_time)),0) AS call_duration
FROM call
JOIN employee ON call.employee_id = employee.id
ORDER BY employee.id ASC, call.start_time ASC;


--NOW WE WANT TO RETURN THE TOTAL DURATION OF ALL CALLS FOR EACH EMAPLOYEE.
--SO, WE WANT TO HAVE 1 ROW FOR EACH EMPLOYEE AND THE SUM OF THE DURATION OF 
--ALL CALLS HE EVER MADE. WE'LL CONTINUE FROM WHERE WE STOPPED WITH THE PREVIOUS QUERY

SELECT employee.id, employee.first_name, employee.last_name,
COALESCE(EXTRACT(EPOCH FROM (call.end_time - call.start_time))) AS call_duration_sum
FROM call
INNER JOIN employee ON call.employee_id = employee.id
GROUP BY employee.id, employee.first_name, employee.last_name, call_id
ORDER BY employee.id ASC;
---==============================================================
--FOR EACH EMPLOYEE, WE NEED TO RETURN ALL HIS CALLS WITH THEIR DURATION. 
--WE ALSO WANT TO KNOW THE PERCENTAGE OF TIME AN EMPLOYEE SPENT ON THIS
--CALL, COMPARED TO THE TOTAL CALL TIME OF ALL HIS CALLS
SELECT 
    employee.id, employee.first_name, employee.last_name, call.end_time, call.start_time,
    COALESCE(EXTRACT(EPOCH FROM (call.end_time - call.start_time)), 0) AS call_duration,
    duration_sum.call_duration_sum,
    CAST(COALESCE(EXTRACT(EPOCH FROM (call.end_time - call.start_time)), 0) AS DECIMAL(7,2)) / 
    CAST(duration_sum.call_duration_sum AS DECIMAL(7,2)) AS call_percentage
FROM call
INNER JOIN employee ON call.employee_id = employee.id
INNER JOIN (
    SELECT 
        call.employee_id,
        SUM(COALESCE(EXTRACT(EPOCH FROM (call.end_time - call.start_time)), 0)) AS call_duration_sum
    FROM call
    GROUP BY call.employee_id
) AS duration_sum ON employee.id = duration_sum.employee_id
ORDER BY employee.id ASC, call.start_time ASC;

--================================================
--WE NEED TWO QUERIES. FIRST SHALL RETURN THE AVERAGE CALL DURATION PER
--EMPLOYEE, WHILE THE SECOND SHALL RETURN AVERAGE CALL DURATION FOR ALL CALL
SELECT
employee.id, employee.first_name, employee.last_name,
AVG(COALESCE(EXTRACT(EPOCH FROM (call.end_time - call.start_time)))) as call_duration_avg
FROM call
INNER JOIN employee ON call.employee_id = employee.id
GROUP BY
employee.id, employee.first_name, employee.last_name
ORDER BY employee.id asc;
-------------------------------------------------------
SELECT
avg(coalesce(extract(epoch from(call.end_time - call.start_time))))AS call_duartion_avg
FROM call;

select * from call;

--===============================================================
--WE NEED TO CALCULATE THE DIFFERENCE BETWEEN THE AVERAGE CALL DURATION
--FOR EACH EMPLOYEE AND THE AVERAGE CALL DURATION FOR ALL CALLS
SELECT 
    single_employee.id, single_employee.first_name, single_employee.last_name, single_employee.call_duration_avg,
    single_employee.call_duration_avg - avg_all.call_duration_avg AS avg_difference
FROM (
    SELECT
        employee.id, employee.first_name, employee.last_name,
        AVG(COALESCE(EXTRACT(EPOCH FROM (call.end_time - call.start_time)), 0)) AS call_duration_avg
    FROM call
    INNER JOIN employee ON call.employee_id = employee.id
    GROUP BY employee.id, employee.first_name, employee.last_name
) single_employee
CROSS JOIN (
    SELECT 
        AVG(COALESCE(EXTRACT(EPOCH FROM (call.end_time - call.start_time)), 0)) AS call_duration_avg
    FROM call
) avg_all;

--=======================================================
--WE NOW KNOW WHAT IS IN OUR TABLES AND ARE READY TO CREATE REPORTING
--CATEGORIES. SINCE WE NEED TO COMBINE ALL ROWS FROM ONE TABLE WITH ALL 
--ROWS FROM ANOTHER TABLE, WE'II CREATE A CARTESIAN PRODUCT OF THESE 
--TWO TABLES. WE CAN DO IT SIMPLY AND WE'LL SHOW 2 COMMON WAYS TO DO THAT.

--1 CREATING REPORTING CATEGORIES USING THE CARTESSIAN PRODUCT WITHOUT JOIN
SELECT
   employee.id AS employee_id,
   employee.first_name, employee.last_name,
   customerid AS customer_id, customer.first_name, 
   customer.last_name
FROM employee, customer;

--2 Cartessian product using cross join
SELECT 
employee.id AS employee_id,
employee.first_name, employee.last_name,
customerid AS customer_id, customer.first_name, customer.last_name
FROM employee CROSS JOIN customer;
 --================================================
--THE NEXT STEP IN CREATING REPORT IS TO GRAB THE ACTUAL DATA WE NEED.
--IN OUR CASE WE WANT TO COUNT ALL CONTACTS EMPLOYEES HAS WITH CUSTOMERS.
--WE'LL SIMPLY USE IDS FROM BOTH TABLES, GROUP BY THEM AND COUNT THE 
--NUMBER OF CALLS YOU CAN READ MORE ABOUT AGGREGATE FUNCTIONS(INCLUDING COUNT)

--Get report data
SELECT
 employee.id AS employee_id,
 employee.id AS customerid,
 COUNT(call_id) AS calls
 FROM employee
 INNER JOIN call ON call.employee_id = employee.id
 INNER JOIN customer ON call.customer_id = customerid
 GROUP BY employee.id, customerid;
select * from call;
select * from employee;
--===========================================

--THE LAST THING WE NEED TO DO IN ORDER TO CREATE A REPORT IS TO COMBINE
--REPORTING CATEGORIES WITH THE REPORT DATA. WE'LL SIMPLY USE SQL
--QUERIES CREATED IN # SQL EXAMPLE-CREATE REPORTING CATEGORIES (CARTESIAN
--PRODUCT) AND "#3 SQL EXAMPLE GET REPORT".

--WE'LL USE BOTH THESE SQL QURIES AS A SUBQUERY FORM THE MAIN QUERY. NOTICE 
--THAT THESE SUBQURIES ACT AS "STANDARD" TABLE SO YOU CAN LOOK AT THEM AS ON
--BLACK BOXES AND WHAT IS IN THESE TABLES? WELL, THEY "CONTAIN" THE RESULT
--QURIES CREATED IN THE PROVIOUS 2 PARTS RETURNED.
SELECT
    report_categories.employee_id, report_categories.first_name,
	report_categories.last_name, report_categories.customerid,
	report_categories.customer_name, report_data.calls
FROM (---report categories
SELECT employee.id AS employee_id, employee.first_name, employee.last_name,
customerid AS customer_id, customer.customer_name
FROM employee
CROSS JOIN customer ) report_categories
LEFT JOIN (--report categories
SELECT employee.id AS employee_id, customerid AS customer_id,
COUNT(call_id) AS calls
FROM employee
INNER JOIN call ON call.employee_id = employee.id
INNER JOIN customer ON call.customer_id = customerid
GROUP BY employee.id, customerid )
report_data ON report_categories.employee_id = report_data.employee_id
AND report_categories.customerid = report_data.customerid;

--=================================
SELECT
    report_categories.employee_id, report_categories.first_name,
    report_categories.last_name, report_categories.customer_id,
    report_categories.customer_name, report_data.calls
FROM ( -- report categories subquery
    SELECT 
        employee.id AS employee_id, 
        employee.first_name, employee.last_name,
        customerid AS customer_id, 
        customer.first_name
    FROM employee
    CROSS JOIN customer ) report_categories
LEFT JOIN (
    -- report data subquery
    SELECT 
        employee.id AS employee_id, 
        call.customer_id AS customer_id,
        COUNT(call.call_id) AS calls
    FROM employee
    INNER JOIN call ON call.employee_id = employee.id
    INNER JOIN customer ON call.customer_id = customerid
    GROUP BY employee.id, call.customer_id ) report_data 
ON report_categories.employee_id = report_data.employee_id
AND report_categories.customer_id = report_data.customer_id
ORDER BY report_categories.employee_id, report_categories.customer_id;
---=====================================--------------------------
SELECT
    report_categories.employee_id, report_categories.first_name,
	report_categories.last_name, report_categories.customer_id,
	report_categories.first_name, report_data.calls
FROM (
    -- report categories subquery
    SELECT 
        employee.id AS employee_id, employee.first_name, 
		employee.last_name, customerid AS customer_id, 
        customer.first_name
    FROM employee
    CROSS JOIN customer ) report_categories
LEFT JOIN ( -- report data subquery
    SELECT 
        employee.id AS employee_id, 
        call.customer_id AS customer_id,
        COUNT(call.call_id) AS calls
    FROM employee
    INNER JOIN call ON call.employee_id = employee.id
    INNER JOIN customer ON call.customer_id = customerid
    GROUP BY employee.id, call.customer_id ) report_data 
ON report_categories.employee_id = report_data.employee_id
AND report_categories.customer_id = report_data.customer_id
ORDER BY report_categories.employee_id, report_categories.customer_id;
--==================================

SELECT CURRENT_TIMESTAMP AS _CURRENT_TIMESTAMP; -- Equivalent to SQL Server's GETDATE()
SELECT NOW() AS _NOW;  -- Equivalent to GETDATE() or SYSDATETIME()
SELECT CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS _CURRENT_TIMESTAMP_UTC; -- With timezone offset
SELECT CURRENT_TIME AS _CURRENT_TIME; -- Current time without date

--_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-__-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
SELECT NOW() AS _NOW;
SELECT CURRENT_TIME AS _CURRENT_TIME;
SELECT CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS _CURRENT_TIMESTAMP_UTC;

---==================================================================
SELECT 
   EXTRACT(YEAR FROM TIMESTAMP '2020-01-01 11:21:10') AS YEAR,
   EXTRACT(MONTH FROM TIMESTAMP '2020-01-01 11:21:10') AS MONTH,
   EXTRACT(DAY FROM TIMESTAMP '2020-01-01 11:21:10') AS DAY;

--========================================================
---MSSQL-TRANSACT
SELECT
     DATEPART(YEAR, '2020-05-01 14:38:52') AS YEAR,
     DATEPART(MONTH, '2020-05-01 14:38:52') AS month,
     DATEPART(DAY, '2020-05-01 14:38:52') AS DAY,
     DATEPART(HOUR, '2020-05-01 14:38:52') AS HOUR,
     DATEPART(MINUTE, '2020-05-01 14:38:52') AS MINUTE,
     DATEPART(SECOND, '2020-05-01 14:38:52') AS SECOND;
	 
---POSTGRES-SQL
SELECT
     EXTRACT(YEAR FROM TIMESTAMP '2020-05-01 14:38:52') AS YEAR,
     EXTRACT(MONTH FROM TIMESTAMP '2020-05-01 14:38:52') AS month,
     EXTRACT(DAY FROM TIMESTAMP '2020-05-01 14:38:52') AS DAY,
     EXTRACT(HOUR FROM TIMESTAMP '2020-05-01 14:38:52') AS HOUR,
     EXTRACT(MINUTE FROM TIMESTAMP '2020-05-01 14:38:52') AS MINUTE,
     EXTRACT(SECOND FROM TIMESTAMP '2020-05-01 14:38:52') AS SECOND;

--==========================================================
---MSSQL-TRANSACT
SELECT
     DATENAME (YEAR, '2020/05/01 14:38:52') AS YEAR, 
	 DATENAME (MONTH, '2020/05/01 14:38:52') AS MONTH, 
	 DATENAME (DAY, '2020/05/01 14:38:52') AS DAY, 
	 DATENAME (HOUR, '2020/05/01 14:38:52') AS HOUR,
	 DATENAME (MINUTE, '2020/05/01 14:38:52') AS MINUTE, 
	 DATENAME (SECOND, '2020/05/01 14:38:52') AS SECOND;

---POSTGRES-SQL
SELECT
     TO_CHAR(TIMESTAMP '2020-05-01 14:38:52', 'YYYY') AS YEAR,
     TO_CHAR(TIMESTAMP '2020-05-01 14:38:52', 'Month') AS MONTH,
     TO_CHAR(TIMESTAMP '2020-05-01 14:38:52', 'DD') AS DAY,
     TO_CHAR(TIMESTAMP '2020-05-01 14:38:52', 'HH24') AS HOUR,
     TO_CHAR(TIMESTAMP '2020-05-01 14:38:52', 'MI') AS MINUTE,
     TO_CHAR(TIMESTAMP '2020-05-01 14:38:52', 'SS') AS SECOND;
--============================================================
--MSSQL-TRANSACT
SELECT DATEFROMPARTS (2020,5,1) AS _date;
SELECT DATEADD (DAY, -10, '2020-05-01') AS _date_add;
SELECT DATEDIFF (DAY, '2020-05-01', '2020-05-10') AS _date_difference;

--==POSTGRES-SQL
SELECT DATE '2020-05-01' AS _date;-- Create a date
SELECT '2020-05-01'::DATE - INTERVAL '10 days' AS _date_add; -- Subtract 10 days from a date
SELECT DATE '2020-05-10' - DATE '2020-05-01' AS _date_difference; -- Calculate the difference in days between two dates

--=============================================================
---MSSQL - TRANSACT
--=========================================================
--POSTGRES-SQL
SELECT CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS _GETUTCDATE; -- Get UTC Date and Time
SELECT CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS _SYSUTCDATETIME; -- Get UTC Date and Time with fractional seconds
SELECT CURRENT_TIMESTAMP AS _SYSDATETIMEOFFSET; -- Get Date and Time with time zone offset

--==============================================
--MSSQL-TRANSACT
SELECT EOMONTH('2020-02-12')AS EOM;
--POSTGRES-SQL
SELECT (DATE_TRUNC('MONTH', '2020-02-12'::DATE) + INTERVAL '1 MONTH' - INTERVAL '1 day')::DATE AS EOM;

--========================================================
---MSSQL-TRANSACT
----dates in rage 
---declaring all DATE variables we'll use
DECLARE @date DATE; DECLARE @start_date DATE;
DECLARE @end_date DATE; DECLARE @loop_date DATE;

----declaring a table variable
DECLARE @dates TABLE (date DATE);

---setting the first and the last date in the month given by date
SET @date = '2020/05/12';
SET @start_date = DATEFROMPARTS (YEAR(@date), MONTH(@date), '01');
SET @end_date = EOMONTH (@date);

---check date
SELECT @date as cur_date,  @start_date as first_date, @end_date as last_date;

---populating a table (variable) with all dates in a given month
SET @loop_date = @start_date;
WHILE @loop_date <= @end_date
BEGIN 
     INSERT INTO @dates(date) VALUES (@loop_date);
	 SET @loop_date = DATEADD (DAY, 1, @loop_date);
	 END; ---selecting report date
SELECT * FROM @dates;
--============================================================
--POSTGRES-SQL
DO $$
DECLARE
    date DATE := '2020-05-12';
    start_date DATE; end_date DATE; loop_date DATE;
BEGIN
    start_date := DATE_TRUNC('MONTH', date)::DATE;     -- Set the start and end dates of the given month
    end_date := (DATE_TRUNC('MONTH', date) + INTERVAL '1 MONTH' - INTERVAL '1 day')::DATE;
    CREATE TEMP TABLE dates (date DATE);     -- Create a temporary table to store the dates
	
    -- Populate the temporary table with all dates in the given month
    loop_date := start_date;
    WHILE loop_date <= end_date LOOP
        INSERT INTO dates (date) VALUES (loop_date);
        loop_date := loop_date + INTERVAL '1 day';
    END LOOP;
    -- Select the result
    RAISE NOTICE 'Current Date: %, Start Date: %, End Date: %', date, start_date, end_date;
    -- Return the dates (can be queried from the temporary table)
    PERFORM * FROM dates;
END $$;
--=======================================
--MSSQL-TARNSACT
declare @date DATE;
declare @start_date DATE;
declare @end_date DATE;
declare @loop_date DATE;

--- declaring a table variables
declare @dates TABLE (date DATE);

--setting the first and the last date in the month given by date
SET @date = '2020/01/12';
SET @start_date = DATEFROMPARTS(YEAR(@date), MONTH(@date), '01');
SET @end_date = EOMONTH(@date);
--populating a table (variable) with all dates in a given month
SET @loop_date = @start_date;
WHILE @loop_date <= @end_date
BEGIN
       INSERT INTO @dates (date) VALUES (@loop_date);
	   SET @loop_date = DATEADD (DAY, 1, @loop_date); 
END;
	 SELECT
      d.date,
	  COUNT(call.id) AS calls FROM @dates d
	LEFT JOIN call ON d.date = CAST(call.start_time AS DATE)
	GROUP BY d.date;
--================================================================
--POSTGRES-SQL
DO $$
DECLARE
    date DATE := '2020-05-12';
    start_date DATE;    end_date DATE;    loop_date DATE;
BEGIN
    -- Set the start and end dates of the given month
    start_date := DATE_TRUNC('MONTH', date)::DATE;
    end_date := (DATE_TRUNC('MONTH', date) + INTERVAL '1 MONTH' - INTERVAL '1 day')::DATE;
    -- Create a temporary table to store the dates
    CREATE TEMP TABLE dates (date DATE);
    -- Populate the temporary table with all dates in the given month
    loop_date := start_date;
    WHILE loop_date <= end_date LOOP
        INSERT INTO dates (date) VALUES (loop_date);
        loop_date := loop_date + INTERVAL '1 day';
    END LOOP;
    -- Select the result
    RAISE NOTICE 'Current Date: %, Start Date: %, End Date: %', date, start_date, end_date;
    -- Return the dates (can be queried from the temporary table)
    PERFORM * FROM dates;
 END $$;
--=================================================================
--MSSQL-TRANSACT
-- number of calls with predefined start time, end time and interval
Declare @start_time DATETIME; --starting from here
Declare @end_time DATETIME; -- untill the time is under this value
Declare @interval CHAR(3);  -- interval definition (e.g. day, minute etc.)
Declare @increment INT;     -- interval increment
Declare @loop_time DATETIME;-- variable used in the loop
Declare @times TABLE(start_time DATETIME, end_time DATETIME);

SET @start_time = '2020-01-11 09:00:00';
SET @end_time = '2020-01-11 10:00:00';
SET @interval = 'MI';
SET @increment = 10;

SET @loop_time = @start_time;

WHILE @loop_time < @end_time
BEGIN 
IF @interval = 'yy'	 SET @loop_time = DATEADD(yy, @increment, @loop_time); -- year
IF @interval = 'qq' SET @loop_time = DATEADD(qq, @increment, @loop_time); ---quarter
 IF @interval = 'mm' SET @loop_time = DATEADD (mm, @increment, @loop_time); --month
	IF @interval = 'dy' SET @loop_time = DATEADD(dy, @increment, @loop_time);-- day of year
IF @interval = 'dd' SET @loop_time = DATEADD(dd, @increment, @loop_time);--day
  IF @interval = 'wk' SET @loop_time = DATEADD(wk, @increment, @loop_time);--week
IF @interval = 'dw' SET @loop_time =DATEADD (dw, @increment, @loop_time); --day of week
  IF @interval = 'hh' SET @loop_time = DATEADD(hh, @increment, @loop_time); --hour
IF @interval = 'mi' SET @loop_time = DATEADD(mi, @increment,@loop_time); --Minute
  IF @interval = 'ss' SET @loop_time = DATEADD (ss, @increment, @loop_time); -- seconds
IF @interval = 'ms' SET @loop_time = DATEADD(ms, @increment, @loop_time); -- millisecond
IF @interval ='mcs' SET  @loop_time = DATEADD(mcs, @increment, @loop_time); --microsecond
IF @interval = 'ns' SET @loop_time = DATEADD(ns, @increment, @loop_time); --nanosecond

INSERT INTO @times(start_time, end_time) VALUES (@start_time, @loop_time);
 SET @start_time = @loop_time;
 END;
 SELECT 
         t.start_time, t.end_time, 
		 COUNT(call.id) AS calls
		 FROM @times t
		 LEFT JOIN call ON t.start_time < call.start_time AND call.start_time <=t.end_time
GROUP BY 
     t.start_time,
	 t.end_time;
--===============================================
--POSTGRES-SQL
DO $$
DECLARE
    start_time TIMESTAMP := '2020-01-11 09:00:00';
    end_time TIMESTAMP := '2020-01-11 10:00:00';
    interval CHAR(3) := 'MI'; -- Interval (e.g., 'MI' for minutes)
    increment INT := 10; -- Interval increment
    loop_time TIMESTAMP;
    times RECORD;
BEGIN
    -- Create a temporary table to store start_time and end_time
    CREATE TEMP TABLE times (start_time TIMESTAMP, end_time TIMESTAMP);

    -- Initialize loop time with the start time
    loop_time := start_time;

    -- Loop to generate intervals
    WHILE loop_time < end_time LOOP
        IF interval = 'yy' THEN loop_time := loop_time + INTERVAL '1 year' * increment;
        ELSIF interval = 'qq' THEN loop_time := loop_time + INTERVAL '3 month' * increment;
        ELSIF interval = 'mm' THEN loop_time := loop_time + INTERVAL '1 month' * increment;
        ELSIF interval = 'dy' THEN loop_time := loop_time + INTERVAL '1 day' * increment;
        ELSIF interval = 'dd' THEN loop_time := loop_time + INTERVAL '1 day' * increment;
        ELSIF interval = 'wk' THEN loop_time := loop_time + INTERVAL '1 week' * increment;
        ELSIF interval = 'dw' THEN loop_time := loop_time + INTERVAL '1 day' * increment;
        ELSIF interval = 'hh' THEN loop_time := loop_time + INTERVAL '1 hour' * increment;
        ELSIF interval = 'mi' THEN loop_time := loop_time + INTERVAL '1 minute' * increment;
        ELSIF interval = 'ss' THEN loop_time := loop_time + INTERVAL '1 second' * increment;
        ELSIF interval = 'ms' THEN loop_time := loop_time + INTERVAL '1 millisecond' * increment;
        ELSIF interval = 'mcs' THEN loop_time := loop_time + INTERVAL '1 microsecond' * increment;
        ELSIF interval = 'ns' THEN loop_time := loop_time + INTERVAL '1 nanosecond' * increment;
        END IF;
        -- Insert the interval start and end times into the temporary table
        INSERT INTO times(start_time, end_time) VALUES (start_time, loop_time);
        -- Update start_time for next iteration
        start_time := loop_time;
    END LOOP;
    -- Select the results
    SELECT
        t.start_time,
        t.end_time,
        COUNT(call.id) AS calls
    FROM times t
    LEFT JOIN call ON t.start_time < call.start_time AND call.start_time <= t.end_time
    GROUP BY t.start_time, t.end_time; END $$;
--=============================================
SELECT 
      C.id AS city_id, c.city_name,
	  co.id AS call_outcome_id, co.outcome_text
FROM call_outcome co
CROSS JOIN city c
ORDER BY c.id ASC, co.id ASC;
--==================================================

--- report data
SELECT 
     ci.id AS city_id, 
	 co.id AS call_outcome_id,
COALESCE(EXTRACT(EPOCH FROM(c.end_time - c.start_time))) as call_duration
FROM call c
INNER JOIN call_outcome co ON c.call_outcome_id = co.id
INNER JOIN customer cu ON c.customer_id = co.id
INNER JOIN city Ci ON cu.city_id = ci.id;

--=================================================================
-- MSSQL-TRANSACT
--==== report categories & data (without pivot)
SELECT
      rc.city_id, rc.city_name, rc.call_outcome_id, rc.outcome_text, rd.call_duration
FROM (SELECT c.id AS city_id, c.city_id, co.id AS call_outcome_id, co.outcome_text
FROM call_outcome co
CROSS JOIN city c) co
LEFT JOIN
    (SELECT ci_id AS city_id, co.id AS call_outcome_id
COALESCE(EXTRACT(EPOCH FROM(c.end_time - c.start_time))) AS call_duration
FROM CALL c
INNER JOIN call_outcome co ON c.call_outcome_id = co.id
INNER JOIN customer cu ON c.customer_id = cu.id
INNER JOIN city ci ON cu.city_id = ci.id
)rd ON rc.city_id = rd.city_id AND rc.call_outcome_id = rd.call_outcome_id
ORDER BY rc.city_id, rc.call_outcome_id;
--======================================================
--POSTGRES-SQL
SELECT
    rc.city_id, rc.city_name, rc.call_outcome_id, rc.outcome_text,
    COALESCE(rd.call_duration, 0) AS call_duration
FROM ( -- report categories: generating all combinations of cities and call outcomes
    SELECT c.id AS city_id, c.city_name, co.id AS call_outcome_id, co.outcome_text
FROM city c
    CROSS JOIN call_outcome co
) rc
LEFT JOIN (   -- report data: calculating call duration for each city and outcome
    SELECT ci.id AS city_id, co.id AS call_outcome_id,
COALESCE(EXTRACT(EPOCH FROM (c.end_time - c.start_time)), 0) AS call_duration
    FROM call c
    INNER JOIN call_outcome co ON c.call_outcome_id = co.id
    INNER JOIN customer cu ON c.customer_id = cO.id
    INNER JOIN city ci ON cu.city_id = ci.id
) rd ON rc.city_id = rd.city_id AND rc.call_outcome_id = rd.call_outcome_id
ORDER BY rc.city_id, rc.call_outcome_id;
--=======================================================================
--======================================================
--POSTGRES-SQL
SELECT
    rc.city_id, rc.city_name, rc.call_outcome_id, rc.outcome_text,
    COALESCE(rd.call_duration, 0) AS call_duration
FROM ( -- report categories: generating all combinations of cities and call outcomes
    SELECT c.id AS city_id, c.city_name, co.id AS call_outcome_id, co.outcome_text
FROM city c
    CROSS JOIN call_outcome co
) rc
LEFT JOIN (   -- report data: calculating call duration for each city and outcome
    SELECT ci.id AS city_id, co.id AS call_outcome_id,
COALESCE(EXTRACT(EPOCH FROM (c.end_time - c.start_time)), 0) AS call_duration
    FROM call c
    INNER JOIN call_outcome co ON c.call_outcome_id = co.id
    INNER JOIN customer cu ON c.customer_id = cO.id
    INNER JOIN city ci ON cu.city_id = ci.id
) rd ON rc.city_id = rd.city_id AND rc.call_outcome_id = rd.call_outcome_id
ORDER BY rc.city_id, rc.call_outcome_id;

--=========================================================================================
--MSSQL-TRANSACT
--report (including static PIVOT)
SELECT * FROM 
( SELECT   --rc.city_id,
		rc.city_name,   --rc.call_outcome_id, 
		rc.outcome_text, rd.call_duration
FROM (SELECT 
        c.id AS city_id, c.city_name, co.id AS call_outcome_id, co.outcome_text
FROM call_outcome co
CROSS JOIN city c ) rc LEFT JOIN
(SELECT
 ci.id AS city_id, co.id AS call_outcome_id,
 Datediff(second, c.start_time, c.end_time) as call_duration
 FROM call c
      INNER JOIN call_outcome co ON c.call_outcome_id = co.id
	  INNER JOIN customer cu ON c.customer_id = cu.id
	  INNER JOIN city ci ON cu.city_id = ci.id
) rd ON rc.city_id = rd.city_id AND rc.call_outcome_id = rd.call_outcome_id
) report_data
PIVOT (
      COUNT(call_duration)
	  FOR outcome_text IN ( 
	  [call started],   [finished - successfully],  [finished - unsuccessfully] )
) AS pivot_table;
---===========================================================================================
---REPORT (INCLUDING STATIC PIVOT)
SELECT 
    rc.city_name,
    rc.outcome_text,
    COUNT(CASE WHEN rd.outcome_text = 'call started' THEN 1 END) AS "call_started",
    COUNT(CASE WHEN rd.outcome_text = 'finished - successfully' THEN 1 END) AS "finished_successfully",
    COUNT(CASE WHEN rd.outcome_text = 'finished - unsuccessfully' THEN 1 END) AS "finished_unsuccessfully"
FROM (  -- Generating combinations of cities and outcomes
    SELECT c.city_name, co.outcome_text
    FROM city c
    CROSS JOIN call_outcome co
) rc
LEFT JOIN ( -- Calculate call duration and link to city and outcome
    SELECT 
        ci.id AS city_id, ci.city_name, co.id AS call_outcome_id,  co.outcome_text,
        COALESCE(EXTRACT(EPOCH FROM (c.end_time - c.start_time)), 0) AS call_duration
    FROM 
        call c
    INNER JOIN call_outcome co ON c.call_outcome_id = co.id
    INNER JOIN customer cu ON c.customer_id = co.id
    INNER JOIN city ci ON cu.city_id = ci.id
) rd ON rc.city_name = rd.city_name AND rc.outcome_text = rd.outcome_text
GROUP BY rc.city_name, rc.outcome_text
ORDER BY rc.city_name;
--=================================================================
---MSSQL-TRANSACT
-- report categories & data (without pivot)
SELECT
    rc.city_id, rc.city_name, rc.call_outcome_id,rc.outcome_text,
	rd.call_duration
FROM
   (SELECT 
         c.id AS city_id, c.city_name, co.id AS call_outcome_id, co.outcome_text
FROM call_outcome co
CROSS JOIN city c
) rc
LEFT JOIN
(SELECT 
       ci.id AS city_id,
	   co.id AS call_outcome_id,
	   DATEDIFF(SECOND, c.start_time, c.end_time) AS call_duration
FROM call c
INNER JOIN call_outcome co ON c.call_outcome_id = co.id
INNER JOIN customer cu ON c.customer_id = cu.id
INNER JOIN city ci ON cu.city_id = ci.id
) rd ON rc.city_id = rd.city_id AND rc.call_outcome_id = rd.call_outcome_id
ORDER BY
rc.city_id, rc.call_outcome_id;
--===============================================================
--POSTGRES-SQL
SELECT
    rc.city_id, rc.city_name, rc.call_outcome_id,rc.outcome_text, rd.call_duration
FROM
    (SELECT 
        c.id AS city_id, c.city_name, co.id AS call_outcome_id, co.outcome_text
    FROM call_outcome co
    CROSS JOIN city c
    ) rc
LEFT JOIN
    (SELECT 
        ci.id AS city_id,co.id AS call_outcome_id,
        COALESCE(EXTRACT(EPOCH FROM (c.end_time - c.start_time)), 0) AS call_duration
    FROM call c
    INNER JOIN call_outcome co ON c.call_outcome_id = co.id
    INNER JOIN customer cu ON c.customer_id = cO.id
    INNER JOIN city ci ON cu.city_id = ci.id
    ) rd 
    ON rc.city_id = rd.city_id AND rc.call_outcome_id = rd.call_outcome_id
ORDER BY
    rc.city_id, rc.call_outcome_id;
---=====================================================================
----MSSQL-TRANSACT
-- declare variables used in cursor
DECLARE @city_name VARCHAR(128);
DECLARE @country_name VARCHAR(128);
DECLARE @city_id INT;
 
-- declare cursor
DECLARE cursor_city_country CURSOR FOR
  SELECT city.id, TRIM(city.city_name), TRIM(country.country_name)
  FROM city
  INNER JOIN country ON city.country_id = country.id;
 
-- open cursor
OPEN cursor_city_country;
 
-- loop through a cursor
FETCH NEXT FROM cursor_city_country INTO @city_id, @city_name, @country_name;
WHILE @@FETCH_STATUS = 0
    BEGIN
    PRINT CONCAT('city id: ', @city_id, ' / city name: ', @city_name, ' / country name: ', @country_name);
    FETCH NEXT FROM cursor_city_country INTO @city_id, @city_name, @country_name;
    END;
 
-- close and deallocate cursor
CLOSE cursor_city_country; DEALLOCATE cursor_city_country;

--======================================================
----POSTGRES-SQL
DO $$ 
DECLARE 
    city_id INT; city_name VARCHAR(128); country_name VARCHAR(128); city_country_cursor CURSOR FOR
        SELECT city.id, TRIM(city.city_name), TRIM(country.country_name)
        FROM city
        INNER JOIN country ON city.country_id = country.id;
BEGIN  -- Open the cursor and loop through each record
    OPEN city_country_cursor;
    LOOP
        FETCH city_country_cursor INTO city_id, city_name, country_name; -- Exit the loop when no more rows are found
        EXIT WHEN NOT FOUND; -- Print the information (use RAISE NOTICE in PostgreSQL)
        RAISE NOTICE 'city id: %, city name: %, country name: %', city_id, city_name, country_name;
    END LOOP; -- Close the cursor after processing
    CLOSE city_country_cursor;
END $$;
--=======================================================================================
---MSSQL-TRANSACT

--declare veriable use in cursor (This time we’ll query the information schema 
--database to return the first 5 tables ordered by table name. While there’s not 
--much sense in using such a query, this example shows you)

declare @table_name varchar(128);
declare @table_names_5 varchar(128);
--declare cursor
declare cursor_table_names cursor for
select top 5 table_name
from INFORMATION_SCHEMA.TABLES
order by table_name asc;

set @table_names_5 = 'first 5 tables are: ' 
--open cursor
open cursor_table_names;
--loop through a cursor
fetch next from cursor_table_names into @table_name;
while @@FETCH_STATUS = 0
begin
if @table_names_5 = 'first 5 tables are: '
set @table_names_5 = CONCAT(@table_names_5, @table_name) else 
set @table_names_5 = CONCAT(@table_names_5, ',', @table_name);
fetch next from cursor_table_names into @table_name; end; 
print @table_names_5;
-----close and deallocate the cursor
close cursor_table_names; deallocate cursor_table_names;
--======================================================
--POSTGRES-SQL
DO $$ 
DECLARE 
    table_name VARCHAR(128);
    table_names_5 VARCHAR(1024) := 'First 5 tables are: ';
    table_cursor CURSOR FOR 
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public'  -- assuming you're interested in the 'public' schema
        ORDER BY table_name
        LIMIT 5;
BEGIN  -- Open the cursor
    OPEN table_cursor; -- Loop through the cursor
    LOOP
        FETCH table_cursor INTO table_name;
        -- Exit the loop when no more rows are found
        EXIT WHEN NOT FOUND;
        IF table_names_5 = 'First 5 tables are: ' THEN        -- Concatenate table names
            table_names_5 := table_names_5 || table_name;
        ELSE
            table_names_5 := table_names_5 || ', ' || table_name;
        END IF;
    END LOOP;
    CLOSE table_cursor;     -- Close the cursor
    -- Print the result
    RAISE NOTICE '%', table_names_5;
END $$;
--=======================================================================================
--MSSQL-TRANSACT
--primary key & feriegn key used in this table (relation to another table)
SELECT
tc.CONSTRAINT_TYPE, tc.CONSTRAINT_NAME, tc.TABLE_NAME

FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
WHERE tc.TABLE_CATALOG = 'our_first_database' AND tc.TABLE_NAME = 'customer'

UNION  --- another table referencing this table
SELECT CONCAT('referenced in table: ', tc1.TABLE_NAME) AS CONSTRAINT_TYPE,
          tc1.CONSTRAINT_NAME,
		  tc2.TABLE_NAME
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc
INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc1 ON rc.CONSTRAINT_NAME = tc1.CONSTRAINT_NAME
INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc2 ON rc.UNIQUE_CONSTRAINT_NAME = tc2.CONSTRAINT_NAME
WHERE rc.CONSTRAINT_CATALOG = 'our_first_database' AND tc2.TABLE_NAME = 'customer';
---===================================================================
--POSTGRES-SQL
-- Primary Key and Foreign Key relationships for the 'customer' table
SELECT 
    tc.CONSTRAINT_TYPE, tc.CONSTRAINT_NAME, tc.TABLE_NAME
FROM 
    information_schema.table_constraints tc
WHERE 
    tc.table_catalog = 'our_first_database' AND tc.table_name = 'customer'
UNION
-- Tables referencing the 'customer' table through foreign keys
SELECT 
    CONCAT('referenced in table: ', tc1.table_name) AS CONSTRAINT_TYPE,
    tc1.constraint_name,
    tc2.table_name
FROM 
    information_schema.referential_constraints rc
INNER JOIN 
    information_schema.table_constraints tc1 ON rc.constraint_name = tc1.constraint_name
INNER JOIN 
    information_schema.table_constraints tc2 ON rc.unique_constraint_name = tc2.constraint_name
WHERE 
    rc.constraint_catalog = 'our_first_database' 
    AND tc2.table_name = 'customer';
--======================================================
---MSSQL-TRANSACT
As a business analyst you could expect that you’ll write queries like the following ones:
---the difference between AVG call duration per employee and AVG call duration
SELECT
single_employee.id, single_employee.first_name, single_employee.last_name,
single_employee.call_duration_avg,
single_employee.call_duration_avg - avg_all.call_duration_avg AS avg_difference
FROM 
(SELECT 
         1 AS join_id, employee.id, employee.first_name, employee.last_name,
		 avg(datediff(second, call.start_time, call.end_time)) AS call_duration_avg
FROM CALL 
INNER JOIN employee ON call.employee_id = employee.id
GROUP BY 
       employee.id, employee.first_name, employee.last_name
)single_employee
INNER JOIN
( SELECT
        1 AS join_id,
		avg(datediff("second", call.start_time, call.end_time)) AS call_duration_avg
	FROM call
)	avg_all ON avg_all.join_id = single_employee.join_id;
---====================================================================
--POSTGRES-SQL
-- The difference between AVG call duration per employee and AVG call duration for all calls
SELECT
    single_employee.id, single_employee.first_name, single_employee.last_name,single_employee.call_duration_avg,
    single_employee.call_duration_avg - avg_all.call_duration_avg AS avg_difference
FROM (
        SELECT 
            1 AS join_id, employee.id, employee.first_name, employee.last_name,
            AVG(EXTRACT(EPOCH FROM (call.end_time - call.start_time))) AS call_duration_avg
        FROM 
            call
        INNER JOIN 
            employee ON call.employee_id = employee.id
        GROUP BY 
            employee.id, employee.first_name, employee.last_name
    ) AS single_employee
INNER JOIN(
        SELECT
            1 AS join_id,
            AVG(EXTRACT(EPOCH FROM (call.end_time - call.start_time))) AS call_duration_avg
        FROM 
            call
    ) AS avg_all ON avg_all.join_id = single_employee.join_id;
--==================================================================================================
--MSSQL-TRANSACT
CREATE PROCEDURE p_dynamic_sql (@employee_id INT, @customer_id INT)
AS BEGIN
       DECLARE
	       @sql NVARCHAR(MAX);
	   SET @sql = N'SELECT * FROM call';
	   IF  (@employee_id IS NOT NULL OR @customer_id IS NOT NULL)
	   SET @sql = @sql + N'WHERE';
	   IF @employee_id IS NOT NULL BEGIN
SET @sql = @sql + N' employee_id = ' + CAST(@employee_id AS char (10));
IF @customer_id IS NOT NULL SET @sql = @sql + N' AND ';
END;
     IF @customer_id IS NOT NULL SET @sql = @sql + N' customer_id = '
	 + CAST(@customer_id AS CHAR (10));
	 SELECT @sql AS query; 
	 EXEC sp_executesql @sql;
END;
--======================================================================
--POSTGRES-SQL
CREATE OR REPLACE FUNCTION p_dynamic_sql(employee_id INT, customer_id INT)
RETURNS VOID AS $$
DECLARE
    sql_query TEXT;
BEGIN
    -- Start building the dynamic SQL query
    sql_query := 'SELECT * FROM call';
    -- Check if employee_id or customer_id is provided
    IF employee_id IS NOT NULL OR customer_id IS NOT NULL THEN
        sql_query := sql_query || ' WHERE';
    END IF;
    -- If employee_id is provided, add the filter for employee_id
    IF employee_id IS NOT NULL THEN
        sql_query := sql_query || ' employee_id = ' || employee_id;
        -- If customer_id is also provided, add AND clause
        IF customer_id IS NOT NULL THEN
            sql_query := sql_query || ' AND';
        END IF;
    END IF;
    -- If customer_id is provided, add the filter for customer_id
    IF customer_id IS NOT NULL THEN
        sql_query := sql_query || ' customer_id = ' || customer_id;
    END IF;
    -- Print the final query (for debugging purposes, remove in production)
    RAISE NOTICE 'Query: %', sql_query;
    -- Execute the dynamic SQL query
    EXECUTE sql_query;
END;
$$ LANGUAGE plpgsql;
--========================================================
--MSSQL-TRANSACT

/* returns 1 if the input string is ok or 0 if otherwise*/

CREATE FUNCTION f_check_string (@string VARCHAR(MAX))
RETURNS INT AS BEGIN
  DECLARE  
        @ret_val INT;
    SET @ret_val =1 ;
	IF (@string like '%''%') SET @ret_val = 0 	ELSE IF (@string like '%--%') SET @ret_val=0
	ELSE IF (@string like '%/*%') SET @ret_val =0 ELSE IF (@string like '%*/%') SET @ret_val=0 
	ELSE IF (@string like '%@') SET @ret_val=0 ELSE IF (@string like '%@@%') SET @ret_val=0 
	ELSE IF (@string like '%char%') SET @ret_val=0 ELSE IF (@string like '%nchar%') SET @ret_val=0 
	ELSE IF (@string like '%varchar%') SET @ret_val=0 ELSE IF (@string like '%nvarchar%') SET @ret_val=0

	ELSE IF (@string like '%select%') SET @ret_val=0 ELSE IF (@string LIKE '%insert%') set @ret_val=0
	ELSE IF (@string like '%update%') SET @ret_val=0 ELSE IF (@string like '%updated%') SET @ret_val=0
	ELSE IF (@string like '%select%') SET @ret_val=0 ELSE IF (@string like '%from%') SET @ret_val=0
	ELSE IF (@string like '%table%') SET @ret_val=0 ELSE IF (@string like '%drop%') SET @ret_val=0
	ELSE IF (@string like '%create%') SET @ret_val=0 ELSE IF (@string like '%alter%') SET @ret_val=0

	ELSE IF (@string like '%begin%') SET @ret_val=0 ELSE IF (@string like '%end%') SET @ret_val=0
	ELSE IF (@string like '%grant%') SET @ret_val=0 ELSE IF (@string like '%deny%') SET @ret_val=0
	ELSE IF (@string like '%exec%') SET @ret_val=0 ELSE IF (@string like '%sp_%') SET @ret_val=0
	ELSE IF (@string like '%xp%') SET @ret_val=0  ELSE IF (@string like '%cursor%') SET @ret_val=0
	ELSE IF (@string like '%fetch%') SET @ret_val=0 ELSE IF (@string like '%kill%') SET @ret_val=0 
	ELSE IF (@string like '%open%') SET @ret_val=0 ELSE IF (@string like '%sysobjects%') SET @ret_val=0
	ELSE IF (@string like '%syscolumns%') SET @ret_val=0 ELSE IF (@string like '%sys%') SET @ret_val=0;
RETURN (@ret_val);
END; 
---====================================================================
--POSTGRES-SQL
CREATE OR REPLACE FUNCTION f_check_string(input_string TEXT)
RETURNS INT AS $$
DECLARE
    ret_val INT := 1;
BEGIN
    -- Check for single quote
    IF input_string LIKE '%''%' THEN  ret_val := 0;
    -- Check for SQL comment pattern
    ELSIF input_string LIKE '%--%' THEN  ret_val := 0;  ELSIF input_string LIKE '%/*%' THEN  ret_val := 0;
    ELSIF input_string LIKE '%*/%' THEN  ret_val := 0;
    -- Check for certain characters or keywords
    ELSIF input_string LIKE '%@%' THEN       ret_val := 0;  ELSIF input_string LIKE '%@@%' THEN      ret_val := 0;
    ELSIF input_string LIKE '%char%' THEN     ret_val := 0; ELSIF input_string LIKE '%nchar%' THEN    ret_val := 0;
    ELSIF input_string LIKE '%varchar%' THEN  ret_val := 0; ELSIF input_string LIKE '%nvarchar%' THEN ret_val := 0;
    ELSIF input_string LIKE '%select%' THEN  ret_val := 0;  ELSIF input_string LIKE '%insert%' THEN  ret_val := 0;
    ELSIF input_string LIKE '%update%' THEN  ret_val := 0;  ELSIF input_string LIKE '%updated%' THEN ret_val := 0;
    ELSIF input_string LIKE '%from%' THEN    ret_val := 0;  ELSIF input_string LIKE '%table%' THEN   ret_val := 0;
    ELSIF input_string LIKE '%drop%' THEN    ret_val := 0;  ELSIF input_string LIKE '%create%' THEN  ret_val := 0;
    ELSIF input_string LIKE '%alter%' THEN   ret_val := 0;  ELSIF input_string LIKE '%begin%' THEN   ret_val := 0;
    ELSIF input_string LIKE '%end%' THEN     ret_val := 0;  ELSIF input_string LIKE '%grant%' THEN   ret_val := 0;
    ELSIF input_string LIKE '%deny%' THEN    ret_val := 0;  ELSIF input_string LIKE '%exec%' THEN    ret_val := 0;
    ELSIF input_string LIKE '%sp_%' THEN     ret_val := 0;  ELSIF input_string LIKE '%xp%' THEN      ret_val := 0;
    ELSIF input_string LIKE '%cursor%' THEN  ret_val := 0;  ELSIF input_string LIKE '%fetch%' THEN   ret_val := 0;
    ELSIF input_string LIKE '%kill%' THEN    ret_val := 0;  ELSIF input_string LIKE '%open%' THEN    ret_val := 0;
    ELSIF input_string LIKE '%sysobjects%' THEN   ret_val := 0;   ELSIF input_string LIKE '%syscolumns%' THEN   ret_val := 0;
    ELSIF input_string LIKE '%sys%' THEN   ret_val := 0;
    END IF;
    RETURN ret_val;
END;
$$ LANGUAGE plpgsql;
--=======================================================================================================

SELECT f_check_string('some input string');





--=======================================

