--Location Data
SELECT latitude,
longitude,
`GHG emissions mtons CO2e` as Emissions
FROM emissions.default.emissions_data


--Emissions per Person
SELECT county_state_name,
       population,
       CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE) / NULLIF(CAST(population AS DOUBLE), 0) AS emissions_per_person
FROM emissions_data
ORDER BY emissions_per_person DESC


--Total Emissions per State
SELECT state_abbr,
       SUM(CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE))  AS Total_emissions
FROM emissions_data
GROUP BY state_abbr
ORDER BY Total_emissions DESC
LIMIT 10


--Country Shamming
SELECT county_state_name,
       population,
       CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE) AS Total_Emissions
FROM emissions_data
ORDER BY Total_Emissions DESC
LIMIT 10
