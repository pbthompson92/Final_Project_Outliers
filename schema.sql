BEGIN;


CREATE TABLE IF NOT EXISTS public."Sale_Prices_City_sample"
(
    "RegionID" numeric NOT NULL,
    "RegionName" character varying COLLATE pg_catalog."default" NOT NULL,
    "StateName" character varying COLLATE pg_catalog."default" NOT NULL,
    "SizeRank" numeric NOT NULL,
    "2011-01" numeric NOT NULL,
    "2011-02" numeric NOT NULL,
    "2011-03" numeric NOT NULL,
    "2011-04" numeric NOT NULL,
    "2011-05" numeric NOT NULL,
    "2011-06" numeric NOT NULL,
    "2011-07" numeric NOT NULL,
    "2011-08" numeric NOT NULL,
    "2011-09" numeric NOT NULL,
    "2011-10" numeric NOT NULL,
    "2011-11" numeric NOT NULL,
    "2011-12" numeric NOT NULL,
    "2012-01" numeric NOT NULL,
    "2012-02" numeric NOT NULL,
    "2012-03" numeric NOT NULL,
    "2012-04" numeric NOT NULL,
    "2012-05" numeric NOT NULL,
    "2012-06" numeric NOT NULL,
    "2012-07" numeric NOT NULL,
    "2012-08" numeric NOT NULL,
    "2012-09" numeric NOT NULL,
    "2012-10" numeric NOT NULL,
    "2012-11" numeric NOT NULL,
    "2012-12" numeric NOT NULL,
    "2013-01" numeric NOT NULL,
    "2013-02" numeric NOT NULL,
    "2013-03" numeric NOT NULL,
    "2013-04" numeric NOT NULL,
    "2013-05" numeric NOT NULL,
    "2013-06" numeric NOT NULL,
    "2013-07" numeric NOT NULL,
    "2013-08" numeric NOT NULL,
    "2013-09" numeric NOT NULL,
    "2013-10" numeric NOT NULL,
    "2013-11" numeric NOT NULL,
    "2013-12" numeric NOT NULL,
    "2014-01" numeric NOT NULL,
    "2014-02" numeric NOT NULL,
    "2014-03" numeric NOT NULL,
    "2014-04" numeric NOT NULL,
    "2014-05" numeric NOT NULL,
    "2014-06" numeric NOT NULL,
    "2014-07" numeric NOT NULL,
    "2014-08" numeric NOT NULL,
    "2014-09" numeric NOT NULL,
    "2014-10" numeric NOT NULL,
    "2014-11" numeric NOT NULL,
    "2014-12" numeric NOT NULL,
    "2015-01" numeric NOT NULL,
    "2015-02" numeric NOT NULL,
    "2015-03" numeric NOT NULL,
    "2015-04" numeric NOT NULL,
    "2015-05" numeric NOT NULL,
    "2015-06" numeric NOT NULL,
    "2015-07" numeric NOT NULL,
    "2015-08" numeric NOT NULL,
    "2015-09" numeric NOT NULL,
    "2015-10" numeric NOT NULL,
    "2015-11" numeric NOT NULL,
    "2015-12" numeric NOT NULL,
    "2016-01" numeric NOT NULL,
    "2016-02" numeric NOT NULL,
    "2016-03" numeric NOT NULL,
    "2016-04" numeric NOT NULL,
    "2016-05" numeric NOT NULL,
    "2016-06" numeric NOT NULL,
    "2016-07" numeric NOT NULL,
    "2016-08" numeric NOT NULL,
    "2016-09" numeric NOT NULL,
    "2016-10" numeric NOT NULL,
    "2016-11" numeric NOT NULL,
    "2016-12" numeric NOT NULL,
    "2017-01" numeric NOT NULL,
    "2017-02" numeric NOT NULL,
    "2017-03" numeric NOT NULL,
    "2017-04" numeric NOT NULL,
    "2017-05" numeric NOT NULL,
    "2017-06" numeric NOT NULL,
    "2017-07" numeric NOT NULL,
    "2017-08" numeric NOT NULL,
    "2017-09" numeric NOT NULL,
    "2017-10" numeric NOT NULL,
    "2017-11" numeric NOT NULL,
    "2017-12" numeric NOT NULL,
    "2018-01" numeric NOT NULL,
    "2018-02" numeric NOT NULL,
    "2018-03" numeric NOT NULL,
    "2018-04" numeric NOT NULL,
    "2018-05" numeric NOT NULL,
    "2018-06" numeric NOT NULL,
    "2018-07" numeric NOT NULL,
    "2018-08" numeric NOT NULL,
    "2018-09" numeric NOT NULL,
    "2018-10" numeric NOT NULL,
    "2018-11" numeric NOT NULL,
    "2018-12" numeric NOT NULL,
    "2019-01" numeric NOT NULL,
    "2019-02" numeric NOT NULL,
    "2019-03" numeric NOT NULL,
    "2019-04" numeric NOT NULL,
    "2019-05" numeric NOT NULL,
    "2019-06" numeric NOT NULL,
    "2019-07" numeric NOT NULL,
    "2019-08" numeric NOT NULL,
    "2019-09" numeric NOT NULL,
    "2019-10" numeric NOT NULL,
    "2019-11" numeric NOT NULL,
    "2019-12" numeric NOT NULL,
    "2020-01" numeric NOT NULL,
    "2020-02" numeric NOT NULL,
    "2020-03" numeric NOT NULL,
    CONSTRAINT "Sale_Prices_City_sample_pkey" PRIMARY KEY ("RegionID")
);

CREATE TABLE IF NOT EXISTS public.cpiaucns
(
    "DATE" date NOT NULL,
    "CPIAUCNS" numeric NOT NULL,
    CONSTRAINT cpiaucns_pkey PRIMARY KEY ("DATE")
);

CREATE TABLE IF NOT EXISTS public.full_data_set_long
(
    "ZIP_CODE" integer NOT NULL,
    "DATE" date NOT NULL,
    "PRICE_PER_GALLON" numeric NOT NULL,
    "UNEMPLOYMENT_RATE" numeric NOT NULL,
    "AVG_MORTGAGE_RATE" numeric NOT NULL,
    "INTEREST_RATES" numeric NOT NULL,
    "INFLATION" numeric NOT NULL,
    "AVG_HOUSE_PRICE" numeric NOT NULL,
    PRIMARY KEY ("ZIP_CODE")
);

CREATE TABLE IF NOT EXISTS public.zipcodes_coordinates
(
    "RegionID" numeric NOT NULL,
    "City" character varying COLLATE pg_catalog."default" NOT NULL,
    "State" character varying COLLATE pg_catalog."default" NOT NULL,
    "Zip Code" numeric NOT NULL,
    "Latitude" numeric NOT NULL,
    "Longitude" numeric NOT NULL,
    CONSTRAINT zipcodes_coordinates_pkey PRIMARY KEY ("RegionID", "Zip Code")
);

CREATE TABLE IF NOT EXISTS public.unemployment_data_cleaned
(
    "DATE" date NOT NULL,
    "UNEMPLOYMENT_RATE" numeric NOT NULL,
    CONSTRAINT "DATE" PRIMARY KEY ("DATE")
);

CREATE TABLE IF NOT EXISTS public.mortgage_data_cleaned
(
    "DATE" date NOT NULL,
    "AVG_MORTGAGE_RATE" numeric NOT NULL,
    CONSTRAINT "DATE" PRIMARY KEY ("DATE")
);

CREATE TABLE IF NOT EXISTS public.gas_price
(
    "DATE" date NOT NULL,
    "PRICE_PER_GALLON" numeric NOT NULL,
    CONSTRAINT "DATE" PRIMARY KEY ("DATE")
);

ALTER TABLE IF EXISTS public.cpiaucns
    ADD CONSTRAINT "DATE" FOREIGN KEY ("DATE")
    REFERENCES public.full_data_set_long ("DATE") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.zipcodes_coordinates
    ADD CONSTRAINT full_data_set_long_fk FOREIGN KEY ("Zip Code")
    REFERENCES public.full_data_set_long ("ZIP_CODE") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.zipcodes_coordinates
    ADD CONSTRAINT "regionID" FOREIGN KEY ("RegionID")
    REFERENCES public."Sale_Prices_City_sample" ("RegionID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.unemployment_data_cleaned
    ADD CONSTRAINT "DATE" FOREIGN KEY ("DATE")
    REFERENCES public.full_data_set_long ("DATE") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.mortgage_data_cleaned
    ADD FOREIGN KEY ("DATE")
    REFERENCES public.full_data_set_long ("DATE") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.gas_price
    ADD FOREIGN KEY ("DATE")
    REFERENCES public.full_data_set_long ("DATE") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;