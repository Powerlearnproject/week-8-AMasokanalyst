
-- 1. Retrieve Land Ownership by Community:
   SELECT c.Name AS Community_Name, lo.Owner_Name, lo.Race, lo.Land_Size, lo.Land_Type
   FROM Land_Ownership lo
   JOIN Community c ON lo.Community_ID = c.Community_ID
   ORDER BY c.Name, lo.Land_Size DESC;
   -- This query retrieves the land ownership data for each community, showing the owner’s name, race, land size, and land type. 
   -- It helps in understanding the distribution of land within different communities.

   -- 2. Retrieve Economic Data by Community:
	SELECT c.Name AS Community_Name, ed.Year, ed.Average_Income, ed.Employment_Rate, ed.Poverty_Rate
	FROM Economic_Data ed
	JOIN Community c ON ed.Community_ID = c.Community_ID
	ORDER BY ed.Year DESC, c.Name;
   -- This query retrieves economic data for each community, including average income, employment rate, and poverty rate, providing 
   -- insights into the economic status of each community.

   -- 3. Retrieve Resource Access by Community:**
   SELECT c.Name AS Community_Name, ra.Year, ra.Access_to_Credit, ra.Access_to_Agricultural_Resources, ra.Government_Support
   FROM Resource_Access ra
   JOIN Community c ON ra.Community_ID = c.Community_ID
   ORDER BY ra.Year DESC, c.Name;
   -- This query retrieves data about communities' access to credit, agricultural resources, and government support. 
   -- It helps assess whether communities have access to resources necessary for economic mobility.

	-- 4. Retrieve Survey Data for Perception of Land Ownership:
   SELECT c.Name AS Community_Name, sd.Year, sd.Perception_of_Land_Ownership, sd.Food_Security_Level, sd.Mental_Health_Status
   FROM Survey_Data sd
   JOIN Community c ON sd.Community_ID = c.Community_ID
   ORDER BY sd.Year DESC, c.Name;
   -- This query retrieves the perception of land ownership, food security levels, and mental health status for each community, 
   -- providing qualitative insights into the impact of land ownership on well-being.

--  Data Analysis

-- The following SQL queries help analyze the data and generate insights based on the retrieved data:

-- 1. Analyze Correlation Between Land Ownership and Economic Outcomes:
   SELECT c.Name AS Community_Name, SUM(lo.Land_Size) AS Total_Land_Owned, AVG(ed.Average_Income) AS Avg_Income, AVG(ed.Poverty_Rate) AS Avg_Poverty_Rate
   FROM Land_Ownership lo
   JOIN Economic_Data ed ON lo.Community_ID = ed.Community_ID
   JOIN Community c ON lo.Community_ID = c.Community_ID
   GROUP BY c.Name
   ORDER BY Total_Land_Owned DESC;
   -- This query analyzes whether communities with larger land ownership tend to have higher average incomes and lower 
   -- poverty rates, helping to assess the economic impact of land ownership.

	-- 2. Analyze the Effect of Resource Access on Economic Mobility:
   SELECT c.Name AS Community_Name, ra.Access_to_Credit, ra.Access_to_Agricultural_Resources, AVG(ed.Employment_Rate) AS Avg_Employment_Rate, AVG(ed.Poverty_Rate) AS Avg_Poverty_Rate
   FROM Resource_Access ra
   JOIN Economic_Data ed ON ra.Community_ID = ed.Community_ID
   JOIN Community c ON ra.Community_ID = c.Community_ID
   GROUP BY c.Name, ra.Access_to_Credit, ra.Access_to_Agricultural_Resources
   ORDER BY Avg_Poverty_Rate ASC;
   -- This query analyzes how access to credit and agricultural resources correlates with employment rates and poverty levels, 
   -- providing insights into how resource access affects economic mobility.

	-- 3. Analyze the Impact of Land Ownership on Food Security:
   SELECT c.Name AS Community_Name, SUM(lo.Land_Size) AS Total_Land_Owned, AVG(sd.Food_Security_Level) AS Avg_Food_Security_Level
   FROM Land_Ownership lo
   JOIN Survey_Data sd ON lo.Community_ID = sd.Community_ID
   JOIN Community c ON lo.Community_ID = c.Community_ID
   GROUP BY c.Name
   ORDER BY Total_Land_Owned DESC;
   -- This query examines how the amount of land owned by a community correlates with food security levels, 
   -- helping to determine whether land ownership positively impacts food security.

-- 4. Analyze the Perception of Land Ownership and Mental Health:
   SELECT c.Name AS Community_Name, sd.Perception_of_Land_Ownership, AVG(sd.Mental_Health_Status) AS Avg_Mental_Health_Status
   FROM Survey_Data sd
   JOIN Community c ON sd.Community_ID = c.Community_ID
   GROUP BY c.Name, sd.Perception_of_Land_Ownership
   ORDER BY Avg_Mental_Health_Status DESC;
   -- This query analyzes the relationship between communities' perception of land ownership and their mental health status, 
   -- providing insights into the psychological impact of land ownership.
   
   SELECT * FROM community;
   SELECT * FROM economic_data;
   SELECT * FROM land_ownership;
   SELECT * FROM survey_data;
   