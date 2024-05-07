SELECT * FROM breweries.international_breweries;

-- 1.Total brewery profit

SELECT sum(PROFIT) AS total_profit
FROM breweries.international_breweries;

-- 2. Total profit for anglophone countries

SELECT COUNTRIES, sum(PROFIT) as total_profit
FROM breweries.international_breweries
WHERE COUNTRIES in( 'Ghana', 'Nigeria')
GROUP BY COUNTRIES;


-- Total profit for francophone countries--

SELECT COUNTRIES,sum(PROFIT) as total_profit
FROM breweries.international_breweries
WHERE COUNTRIES in('senegal','togo','benin')
GROUP BY COUNTRIES;

-- 3.Countries that generate the highest profit in 2019

SELECT COUNTRIES,sum(PROFIT) as highest_profit_2019
FROM breweries.international_breweries
WHERE years = 2019 
GROUP BY COUNTRIES
ORDER BY highest_profit DESC
LIMIT 1;

-- 4. Find The Year With The Highest Profit--

SELECT years,sum(profit) as Total_profit 
FROM breweries.International_breweries
GROUP BY years
ORDER BY total_profit DESC
limit 1;

-- 5. Minimum profit for december 2018--

SELECT months, years, sum(profit) as min_profit
FROM breweries.international_breweries
WHERE months = 'December' AND years = 2018
GROUP BY months, years
ORDER BY min_profit ASC
LIMIT 1;

-- 1. Within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries

SELECT brands, years,sum(quantity) as qty_rate
FROM breweries.international_breweries
WHERE Countries in ('senegal','benin','togo')
And years in ('2018','2019')
GROUP BY brands, years
ORDER BY qty_rate DESC
LIMIT 3;


-- 2. top two choice of consumer brands in ghana--
SELECT brands, countries, sum(quantity) as total_qty
FROM breweries.international_breweries
WHERE countries in ('ghana')
GROUP BY brands, countries
ORDER BY Total_qty DESC
LIMIT 2;


-- Favourite malt brand in anglophone region between 2018 and 2019--

SELECT brands, countries, sum(quantity) as total_qty
FROM breweries.international_breweries
WHERE brands in ('grand malt','beta malt')
AND Countries in ('ghana','nigeria')
GROUP BY brands, countries
ORDER BY total_qty;


-- Brands that sold highest in 2019 in nigeria--
SELECT brands,countries, sum(quantity) as total_qty
FROM breweries.international_breweries
WHERE Countries= 'nigeria'
AND brands NOT IN('grand malt','beta malt')
AND YEARS = 2019
GROUP BY brands,countries
ORDER BY total_qty DESC;

-- 5. bear consumption in Nigeria--

SELECT brands,countries, sum(quantity) as qty
FROM breweries.international_breweries
WHERE Countries= 'nigeria'
AND brands NOT IN ('grand malt','beta malt')
GROUP BY brands, countries
ORDER BY qty DESC;

-- Countries with highest consumption of beer--

SELECT brands,countries, sum(quantity) as qtY
FROM breweries.international_breweries
WHERE brands NOT IN ('grand malt','beta malt')
GROUP BY brands, countries
ORDER BY qty DESC
LIMIT 1;

-- Countries with the highest consumption of malt--

SELECT brands,countries, sum(quantity) as qtY
FROM breweries.international_breweries
WHERE brands IN ('grand malt','beta malt')
GROUP BY brands, countries
ORDER BY qty DESC
LIMIT 1;