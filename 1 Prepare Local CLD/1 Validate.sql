-- validates every value that is in a defined list as part of the specification
-- https://www.ardengemcsu.nhs.uk/media/4365/cld-data-specification_release_2_may_2025_update-v01.xlsx
-- defined list alloable values available 
-- https://www.ardengemcsu.nhs.uk/media/4362/cld-data-specification_release_2_mapping_may_2025_update.xlsx
-- create local table [CLD].[ValidationValues]

-- Stored Procedure assumes 
-- local CLD data is stored in [CLD].[RecordLevelData]
-- filter on just CLD records of interest (change or remove as appropriate)
--     where submission like ''%2025%''
-- allowable values stored in [CLD].[ValidationValues]

-- Output splits fields by the 4 Event Types to make tracing of issues easier.

-- The SP currently reports on empty values in Defined list.
-- ie those that are marked Mandatory* ie not mandatory across all event types.
-- includes logic to ensure capitalisation validation - ie recent capitalisation only changes.

-- includes logic to report on "Unit cost" and "Planned units per week" where the value will not cast to numeric(18,2)
-- excludes blank as try_cast covers that in the view.

-- ** TO DO **
-- Provide option to return individual Event References with the wrong value, rather than just counts by incorrect value.
-- Report better where blanks exist on mandatory* fields eg Method of Review acceptable for blanks in Requests, Assessments and Services


-- exec [CLD].[ValidateDefinedListValues]
create procedure
[CLD].[ValidateDefinedListValues] as

begin
	DECLARE @sql NVARCHAR(MAX) = N'';
	DECLARE @columnName NVARCHAR(128);

	-- Cursor to iterate over each distinct column name in ValidationValues
	DECLARE column_cursor CURSOR FOR
	SELECT DISTINCT Variable
	FROM [CLD].[ValidationValues];
	
	-- Define the temp table first
	drop table if exists #InvalidCounts;
	CREATE TABLE #InvalidCounts (
		Field varchar(100),
		[Event Type] varchar(100),
		[CurrentValue] varchar(128),
		[Count] int
	);

	OPEN column_cursor;
	FETCH NEXT FROM column_cursor INTO @columnName;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		set @sql = '
		with SubmittedValues
		as
		(
			select ' + QUOTENAME(@columnname) + ' as [CurrentValue],[Event Type], count(*) as Count from 
			cld.RecordLevelData
			where submission like ''%2025%''
			group by ' + quotename(@columnname) + ', [Event Type]
		),
		allowable as
		(
			select [Release 2 value] as [Acceptable]
			from cld.[ValidationValues]
			where variable = ''' + @columnname +'''
			and comparison in (''Changed (capitalisation only)'',''Changed'',''No change'')
		),
		res as
		(
			select ''' + @columnname +''' as Field, [Event Type], [CurrentValue], [Count]
			from SubmittedValues s 
			left outer join allowable a on s.[CurrentValue] COLLATE Latin1_General_CS_AS = a.Acceptable COLLATE Latin1_General_CS_AS
			where a.Acceptable is null
		)
		insert into #InvalidCounts
			select * from res;
		';
		print @sql
		-- Execute the dynamic SQL
		EXEC sp_executesql @sql;

		FETCH NEXT FROM column_cursor INTO @columnName;
	END

	CLOSE column_cursor;
	DEALLOCATE column_cursor;

	-- now report if Unit cost will not cast to numeric (18,2)
	Insert into #InvalidCounts
	select 'Unit cost' as [Field],
	[Event Type],
	[Unit cost], 
	count(*) 
	from
	cld.RecordLevelData
	where try_cast([Unit cost] as NUMERIC(18, 2)) is null 
	and [Unit cost] is not null
	and [Unit cost] <> ''
	group by [Event Type],[Unit cost]

	-- now report if Planned units per week will not cast to numeric (18,2)
	Insert into #InvalidCounts
	select 'Planned units per week' as [Field],
	[Event Type],
	[Planned units per week], 
	count(*) 
	from
	cld.RecordLevelData
	where try_cast([Planned units per week] as NUMERIC(18, 2)) is null 
	and [Planned units per week] is not null
	and [Planned units per week] <> ''
	group by [Event Type],[Planned units per week]

	select * from #InvalidCounts;

	end
GO


