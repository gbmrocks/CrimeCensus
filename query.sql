DROP TABLE IF EXISTS census;
CREATE EXTERNAL TABLE census (Areaname STRING,
Robberies BIGINT,
violent_crimes_ktp BIGINT,
Number_of_murders_nonnegligent_manslaughters_ktp BIGINT,
Number_of_aggravated_assaults_ktp BIGINT,
Number_of_property_crimes_ktp BIGINT,
Number_of_burglaries_ktp BIGINT,
Number_of_motor_vehicle_thefts_ktp BIGINT,
Employment_in_all_industries BIGINT,
Employment_in_farming BIGINT,
Employment_in_transportation_and_public_utilities BIGINT,
Employment_in_retail_trade BIGINT,
Employment_in_finance_insurance_and_realestate BIGINT,
Resident_population_total BIGINT,
Resident_population_under_18years BIGINT,
Resident_population_under_18years_percent BIGINT,
Resident_population_18to44_years_2010 BIGINT,
Resident_population_20to24_years BIGINT,
Resident_population_25to29_years BIGINT,
Resident_population_30to34_years BIGINT,
Households_with_income_less_than_10000_in_1999 BIGINT,
Families_with_income_of_10000_to_14999_in_1999 BIGINT,
Mean_household_earnings_1999 BIGINT,
Families_with_income_of_75000_to_99999_in_1999 BIGINT,
Families_with_income_of_100000_to_124999_in_1999 BIGINT,
Population_below_poverty_level_1999 BIGINT,
Population_at_or_above_poverty_level_1999 BIGINT,
Families_below_poverty_level_1999 BIGINT)
COMMENT 'census data'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION 's3://projectcs643/data/'
TBLPROPERTIES ("skip.header.line.count"="1");





select areaname,
(violent_crimes_ktp + Robberies+
Number_of_murders_nonnegligent_manslaughters_ktp+
Number_of_aggravated_assaults_ktp+
Number_of_property_crimes_ktp+
Number_of_burglaries_ktp+
Number_of_motor_vehicle_thefts_ktp) as total_crimes from census where areaname  NOT LIKE "%|%" order by total_crimes asc limit 5 ;



select areaname,
(violent_crimes_ktp + Robberies+
Number_of_murders_nonnegligent_manslaughters_ktp+
Number_of_aggravated_assaults_ktp+
Number_of_property_crimes_ktp+
Number_of_burglaries_ktp+
Number_of_motor_vehicle_thefts_ktp) as total_crimes from census where areaname   LIKE "%NJ\"" order by total_crimes asc limit 5 ;



select areaname,Families_below_poverty_level_1999 from census where areaname  NOT LIKE "%|%" order by Families_below_poverty_level_1999 asc limit 5;


select areaname,Families_below_poverty_level_1999 from census where areaname  LIKE "%NJ\"" order by Families_below_poverty_level_1999 asc limit 5;




select areaname,
Number_of_property_crimes_ktp ,Mean_household_earnings_1999 ,
(Mean_household_earnings_1999/
Number_of_property_crimes_ktp
) as ratio from census where areaname   LIKE "%NJ\"" order by ratio desc limit 5;



select areaname,
Number_of_property_crimes_ktp ,Mean_household_earnings_1999 ,
(Mean_household_earnings_1999/
Number_of_property_crimes_ktp
) as ratio from census where areaname   NOT LIKE "%|%" order by ratio desc limit 5;



select areaname,Robberies from census where areaname   LIKE "%NJ\"" order by Robberies asc limit 5 ;

select areaname,Robberies from census where areaname   NOT LIKE "%|%" order by Robberies asc limit 5 ;






select areaname, Robberies as total_crimes ,Mean_household_earnings_1999 ,
(Mean_household_earnings_1999/
Robberies
) as ratio from census where areaname  LIKE "%NJ\"" order by ratio asc limit 5;




select areaname, Robberies as total_crimes ,Mean_household_earnings_1999 ,
(Mean_household_earnings_1999/
Robberies
) as ratio from census where areaname  NOT LIKE "%|%" order by ratio asc limit 5;






select areaname,
(violent_crimes_ktp + Robberies+
Number_of_murders_nonnegligent_manslaughters_ktp+
Number_of_aggravated_assaults_ktp+
Number_of_property_crimes_ktp+
Number_of_burglaries_ktp+
Number_of_motor_vehicle_thefts_ktp) as total_crimes ,Mean_household_earnings_1999 ,
(Mean_household_earnings_1999/
(violent_crimes_ktp + Robberies+
Number_of_murders_nonnegligent_manslaughters_ktp+
Number_of_aggravated_assaults_ktp+
Number_of_property_crimes_ktp+
Number_of_burglaries_ktp+
Number_of_motor_vehicle_thefts_ktp)
) as ratio from census where areaname   LIKE "%NJ\"" order by ratio desc limit 5;





select areaname,
(violent_crimes_ktp + Robberies+
Number_of_murders_nonnegligent_manslaughters_ktp+
Number_of_aggravated_assaults_ktp+
Number_of_property_crimes_ktp+
Number_of_burglaries_ktp+
Number_of_motor_vehicle_thefts_ktp) as total_crimes ,Mean_household_earnings_1999 ,
(Mean_household_earnings_1999/
(violent_crimes_ktp + Robberies+
Number_of_murders_nonnegligent_manslaughters_ktp+
Number_of_aggravated_assaults_ktp+
Number_of_property_crimes_ktp+
Number_of_burglaries_ktp+
Number_of_motor_vehicle_thefts_ktp)
) as ratio from census where areaname   NOT LIKE "%|%" order by ratio desc limit 5;





select areaname,Families_below_poverty_level_1999,(violent_crimes_ktp + Robberies+
Number_of_murders_nonnegligent_manslaughters_ktp+
Number_of_aggravated_assaults_ktp+
Number_of_property_crimes_ktp+
Number_of_burglaries_ktp+
Number_of_motor_vehicle_thefts_ktp) as total_crimes from census where areaname  LIKE "%NJ\"" order by Families_below_poverty_level_1999 asc limit 5;


select areaname,Families_below_poverty_level_1999,(violent_crimes_ktp + Robberies+
Number_of_murders_nonnegligent_manslaughters_ktp+
Number_of_aggravated_assaults_ktp+
Number_of_property_crimes_ktp+
Number_of_burglaries_ktp+
Number_of_motor_vehicle_thefts_ktp) as total_crimes from census where areaname  NOT LIKE "%|%" order by Families_below_poverty_level_1999 asc limit 5;




select areaname,Employment_in_all_industries/Resident_population_total as ratio1,(violent_crimes_ktp + Robberies+
Number_of_murders_nonnegligent_manslaughters_ktp+
Number_of_aggravated_assaults_ktp+
Number_of_property_crimes_ktp+
Number_of_burglaries_ktp+
Number_of_motor_vehicle_thefts_ktp) as total_crime ,Employment_in_all_industries from census where areaname  LIKE "%NJ\"" order by ratio1 asc limit 5;



select areaname,Employment_in_all_industries/Resident_population_total as ratio1,(violent_crimes_ktp + Robberies+
Number_of_murders_nonnegligent_manslaughters_ktp+
Number_of_aggravated_assaults_ktp+
Number_of_property_crimes_ktp+
Number_of_burglaries_ktp+
Number_of_motor_vehicle_thefts_ktp) as total_crime ,Employment_in_all_industries from census where areaname  NOT LIKE "%|%" order by ratio1 asc limit 5;


