/*Creating a database*/
create database climate_change_impact;
use climate_change_impact;
select * from climate_change_impact_on_agriculture_2024;

/*Question 1: Calculate Average Crop Yield by Country and Crop Type */
create table Crop_Yield_MT_per_HA(
select country, crop_type, year, AVG(crop_yield_mt_Per_ha) as AVG_crop_yield
from climate_change_impact_on_agriculture_2024
group by Country, Crop_Type, year
order by country asc);

/*Question 2: Identify Countries with Extreme Weather Events*/
create table identify_countries_with_extreme_weather_events(
select country, year
from climate_change_impact_on_agriculture_2024
where Extreme_Weather_Events
order by country asc);

/*Question 3: Find Top 5 Countries by CO2 Emissions*/
create table CO2_Emissions(
select country, year , CO2_Emissions_MT
from climate_change_impact_on_agriculture_2024
order by CO2_Emissions_MT asc
limit 5);

/*Question 4: Calculate the Total Economic Impact of Extreme Weather Events per Region*/
create table Economic_Impact_Million_USD(
select Region, round( sum(Economic_Impact_Million_USD),2) as total_economic_impact
from climate_change_impact_on_agriculture_2024
where Extreme_Weather_Events
Group by Region);


/*Question 5: List Countries with Irrigation Access Below 50%*/
create table Irrigation_Access_%(
select country, year
from climate_change_impact_on_agriculture_2024
where Irrigation_Access_% < 50);

/*Question 6: Find the Year with the Highest Fertilizer Use in a Specific Country*/
create table Fertilizer_Use_KG_per_HA(
select country, region, year, Fertilizer_Use_KG_per_HA
from climate_change_impact_on_agriculture_2024
order by Fertilizer_Use_KG_per_HA desc
limit 1);

/*Question 7: Compare Average Temperatures by Region Over the Last 5 Years*/
create table Average_Temperature_C(
select region, AVG(Average_Temperature_C) as Avg_temperture
from climate_change_impact_on_agriculture_2024
where year >= year (curdate())-5
group by region);

/*Question 8: Find Regions with Crop Yield Decline Despite Adaptation Strategies*/
create table Crop_Yield_MT_per_HA(
select region, year,  crop_yield_mt_per_ha
from climate_change_impact_on_agriculture_2024
where Adaptation_Strategies);

/*Question 9: Calculate the Total Pesticide and Fertilizer Use per Year for Each Country*/
create table Pesticide_Use_KG_per_HA(
select country, year,
	sum(Pesticide_Use_KG_per_HA) as Total_Pesticlde_Use, sum(Fertilizer_Use_KG_per_HA) as Total_Fertilizer_Use
from climate_change_impact_on_agriculture_2024
group by Country, year);

/*Question 10: Analyze the Relationship Between Precipitation and Crop Yield*/
 create table Total_Precipitation_mm(
 select Total_Precipitation_mm, Crop_Yield_MT_per_HA
from climate_change_impact_on_agriculture_2024
where Total_Precipitation_mm IS NOT NULL
and Crop_Yield_MT_per_HA IS NOT NULL);