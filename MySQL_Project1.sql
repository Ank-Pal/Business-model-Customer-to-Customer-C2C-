-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* PROJECT is based on : Business model Customer to Customer (C2C) allows customers to do business with each other. This model is growing fast with e-commerce platforms where sellers may be required to pay some amount and buyer can buy it without paying anything E-Commerce website brings the seller and buyer to the same platform. 
Analyzing the user's database will lead to understanding the business perspective. Behaviour of the users can be traced in terms of business with exploration of the users's database.
*/
 # Task to be performed. 
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Q1. Create new schema as ecommerce. 
-- Ans: 
CREATE DATABASE ecommerce;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Q2. Import .csv file users_data into MySQL
       (right click on ecommerce schema -> Table Data import Wizard -> Give path of the file -> Next -> choose
       options: Create a new table, select delete if exist -> next -> next). 
   */
-- Ans: Done, imort user_data in schema ecommerce .
SELECT * FROM users_data;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q3. Run SQL command to see the structure of table.
-- Ans:
USE ecommerce;
DESC users_data;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q4. Run SQL command to select first 100 rows of the database.
-- Ans:
SELECT 
    *
FROM
    users_data
LIMIT 100;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q5. How many distinct values exist in table for field country and language. 
-- Ans:
SELECT 
    COUNT(DISTINCT country) country,
    COUNT(DISTINCT language) language
FROM
    users_data;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q6. Check whether male users are having maximum followers or female users.
-- Ans:
SELECT 
    gender Gender, SUM(socialNbFollowers) Total_Followers
FROM
    users_data
GROUP BY gender;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Q7. Calculate the total users those 
         a. Uses Profile Picture in their Profile
         b. Uses Appliction for Ecommerce platform
         c. Uses Android app
         d. Uses ios app
*/
-- a:--------------------------------------------------------
SELECT 
    COUNT(hasProfilePicture)
FROM
    users_data
WHERE
    hasProfilePicture = 'True';
-- b:---------------------------------------------------------
SELECT 
    COUNT(hasAnyApp) Application_for_Ecommerce_platform
FROM
    users_data
WHERE
    hasAnyApp = 'True';
-- c:---------------------------------------------------------- 
SELECT 
    COUNT(hasAndroidApp) Android_App
FROM
    users_data
WHERE
    hasAndroidApp = 'True';
-- d:---------------------------------------------------------- 
SELECT 
    COUNT(hasIosApp) Uses_Ios_App
FROM
    users_data
WHERE
    hasIosApp = 'True';

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q8. Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.
--      (Hint: consider only those users having at least 1 product bought.)
-- Ans:
SELECT 
    country, COUNT(productsBought) Buyers
FROM
    users_data
GROUP BY country
ORDER BY Buyers DESC;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q9. Caculate the total number of sellers for each country and sort the result in ascending order of total numbers of sellers.
--    (Hint: consider only those users having at least 1 product sold.)
SELECT 
    country, COUNT(productsSold) Sellers
FROM
    users_data
GROUP BY country
ORDER BY Sellers ASC;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q10. Display  name of top 10 countries having maximum products pass rate. 
-- Ans:
SELECT 
    country, SUM(productsPassRate) Product_pass_rate
FROM
    users_data
GROUP BY country
ORDER BY Product_pass_rate DESC
LIMIT 10;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q11. Calculate the number of users on an ecommerce platform for different language choices. 
-- Ans:
SELECT 
    language, COUNT(language)
FROM
    users_data
GROUP BY language;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q12. Check the coice of female users about putting the product in a wishlist or to like socially on an ecommerce platform.
--     (Hint: use UNION to answer this question.) 
SELECT 
    SUM(productsWished)
FROM
    users_data
WHERE
    gender = 'F' 
UNION SELECT 
    SUM(socialProductsLiked)
FROM
    users_data
WHERE
    gender = 'F';
 
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q13. Check the choice of male users about being seller or buyer.(Hint: use UNION to solve this question.) 
-- Ans:
SELECT 
    SUM(productsSold)
FROM
    users_data
WHERE
    gender = 'M' 
UNION SELECT 
    SUM(productsBought)
FROM
    users_data
WHERE
    gender = 'M';

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q14. Which country is having maximum numbers of buyers?
-- Ans:
SELECT 
    country, SUM(productsBought) Buyers
FROM
    users_data
GROUP BY country
ORDER BY Buyers DESC;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q15. List the name of 10 countries having zero number of sellers. 
-- Ans:
SELECT 
    country, SUM(productsSold) Sellers
FROM
    users_data
GROUP BY country
ORDER BY Sellers
LIMIT 10;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 16. Display record of top 110 users who have used ecommerce platform recently.
-- Ans:
SELECT 
    *
FROM
    users_data
ORDER BY daysSinceLastLogin
LIMIT 110;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 17. Calculate the number of female users those who have not logged in since last 100 days.
-- Ans:
SELECT 
    COUNT(daysSinceLastLogin) No_of_females_Who_not_logged_in_100days
FROM
    users_data
WHERE
    gender = 'F'
        AND daysSinceLastLogin > 100;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 18. Display the number of female users of each country at ecommerce platform. 
-- Ans:
SELECT 
    country, COUNT(*) No_of_females
FROM
    users_data
WHERE
    gender = 'F'
GROUP BY country;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 19. Display the number of male users of each country at ecommerce platform. 
-- Ans:
SELECT 
    country, COUNT(*) No_of_males
FROM
    users_data
WHERE
    gender = 'M'
GROUP BY country;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Q20. Calculate the average number of products sold and bought on ecommerce platform by male users for each country. 
-- Ans:
SELECT 
    country,
    AVG(productsSold) Average_no_of_productsSold,
    AVG(productsBought) Average_no_of_productsBought
FROM
    users_data
WHERE
    gender = 'M'
GROUP BY country;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 