DROP TABLE housing_table;
-- Create housing table
	CREATE TABLE housing_table (
		state varchar NOT NULL,
		year date NOT NULL,
		median_sale_price int NOT NULL,
		homes_sold int NOT NULL
	);
	
	-- Show housing table
	SELECT * FROM housing_table
	ORDER BY year ASC;
	
	DROP TABLE grouped_housing;
	-- Group Housing table
	SELECT 
		EXTRACT(year FROM year) AS year,
		state,
		CAST(avg(median_sale_price) AS INT) AS median_sale_price,
		sum(homes_sold) AS homes_sold
	INTO grouped_housing
	FROM housing_table
	GROUP BY year, state
	ORDER BY year, state ASC;
	
	-- Show grouped housing table
	SELECT * FROM grouped_housing
	ORDER BY year ASC;


DROP TABLE migration_table;
-- Create migration table with pop change
	CREATE TABLE migration_table (
		state varchar NOT NULL,
		year DATE NOT NULL, 
		population INT NOT NULL,
		from_state varchar not NULL,
		number_people INT not NULL,	
		migration_total INT NOT NULL,
		pop_change INT NOT NULL
	);
	
	-- Show migration table
	SELECT * FROM migration_table
	ORDER BY year ASC;
	
	DROP TABLE grouped_migration;
	-- Group migration table
	SELECT 
		EXTRACT(year FROM year) AS year,
		state,
		population,
		migration_total,
		pop_change
	INTO grouped_migration
	FROM migration_table
	GROUP BY year, state, population, migration_total, pop_change
	ORDER BY year, state ASC;
	
	-- Show grouped migration table
	SELECT * FROM grouped_migration
	ORDER BY year ASC;
	
DROP TABLE no_pop_migration_table;
-- Create migration table without pop change
	CREATE TABLE no_pop_migration_table (
		state varchar NOT NULL,
		year DATE NOT NULL, 
		population INT NOT NULL,
		from_state varchar not NULL,
		number_people INT not NULL,	
		migration_total INT NOT NULL
	);	
	
	-- Show no pop migration table
	SELECT * FROM no_pop_migration_table
	ORDER BY year ASC;
	
	DROP TABLE no_pop_grouped_migration;
	-- Group no pop migration table
	SELECT 
		EXTRACT(year FROM year) AS year,
		state,
		population,
		migration_total
	INTO no_pop_grouped_migration
	FROM no_pop_migration_table
	GROUP BY year, state, population, migration_total
	ORDER BY year, state ASC;
	
	-- Show grouped no pop migration table
	SELECT * FROM no_pop_grouped_migration
	ORDER BY year ASC;


DROP TABLE no_pop_housing_migration;
-- Inner JOIN grouped_housing with no_pop_grouped_migration
	SELECT 
		gh.year,
		gh.state,
		gh.median_sale_price,
		gh.homes_sold,
		ngm.population,
		ngm.migration_total
	INTO no_pop_change_housing_migration
	FROM grouped_housing AS gh
	inner join no_pop_grouped_migration AS ngm ON 
		gh.year = ngm.year AND gh.state = ngm.state;
	
	-- Show grouped no pop migration table
	SELECT * FROM no_pop_change_housing_migration
	ORDER BY year ASC;


DROP TABLE housing_migration;
-- Inner JOIN grouped_housing with grouped_migration
	SELECT 
		gh.year,
		gh.state,
		gh.median_sale_price,
		gh.homes_sold,
		gm.population,
		gm.migration_total,
		gm.pop_change
	INTO housing_migration
	FROM grouped_housing AS gh
	inner join grouped_migration AS gm ON 
		gh.year = gm.year AND gh.state = gm.state;
	
	-- Show housing_migration table
	SELECT * FROM housing_migration
	ORDER BY year ASC;
	
	
	
	
	
	
	
	
