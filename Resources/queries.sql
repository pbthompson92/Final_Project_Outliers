SELECT cpiaucns.DATE, cpiaucns.CPIAUCNS, fedfunds.FEDFUNDS, gas_price.DATE,
	mortgage_data_cleaned.AVG_MORTGAGE_RATE, unemployment_data_cleaned.UNEMPLOYMENT_RATE
INTO other_data
FROM cpiaucns
INNER JOIN fedfunds ON fedfunds.DATE = cpiaucns.DATE
INNER JOIN gas_price ON gas_price.DATE = cpiaucns.DATE
INNER JOIN mortgage_data_cleaned ON mortgage_data_cleaned.DATE = cpiaucns.DATE
INNER JOIN unemployment_data_cleaned ON unemployment_data_cleaned.DATE = cpiaucns.DATE;