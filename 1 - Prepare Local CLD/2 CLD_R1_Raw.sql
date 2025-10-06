-- VIEW that is used to map our local table / field names to the appropriate fields that this code requires.
-- DER fields only resolved where they are critical for ASCOF figure calculations.
-- Locally we have a column called submission to split CLD data out from the single table.

CREATE view [CLD].[CLD_R1_Raw] as
SELECT 
	**INSERT_LA_NUMBER_HERE**			[LA_Code]
	,'****INSERT LA NAME HERE****' as LA_Name
    ,[Reporting Period Start Date]			[Reporting_Period_Start_Date]
    ,[Reporting Period End Date]			[Reporting_Period_End_Date]
    ,[NHS Number]			[NHS_Number]
	,[NHS Number] Der_NHS_Number_Traced_Pseudo
	,[NHS Number] Der_NHS_Number_Pseudo
    ,[LA Person Unique Identifier]			[LA_Person_Unique_Identifier]
    ,[First Name]			[First_Name]
    ,[Last Name]			[Last_Name]
    ,[GP Practice Name]			[GP_Practice_Name]
    ,[GP Practice Code]			[GP_Practice_Code]
    ,[Gender]	Gender
    ,[Ethnicity]
    ,[Date of Birth]			[Date_of_Birth]
	,YEAR([Date of Birth]) Der_Birth_Year
	,MONTH([Date of Birth])  Der_Birth_Month
    ,[Date of Death]			[Date_of_Death]
    ,[Client Type]			[Client_Type]
    ,[Primary Support Reason]			[Primary_Support_Reason]
    ,[Postcode]			[Postcode]
    ,[Accommodation Status]			[Accommodation_Status]
    ,[Employment Status]			[Employment_Status]
    ,[Has Unpaid Carer]			[Has_Unpaid_Carer]
    ,[Autism Spectrum Disorder (ASD)]			[Autism_Spectrum_Disorder_ASD]
    ,[Visual Impairment]			[Visual_Impairment]
    ,[Hearing Impairment]			[Hearing_Impairment]
    ,[Dementia]			[Dementia]
    ,[Client Funding Status]			[Client_Funding_Status]
    ,[Event Type]			[Event_Type]
    ,[Event Reference]			[Event_Reference]
    ,[Event Start Date]			[Event_Start_Date]
    ,[Event End Date] 			Event_End_Date
    ,[Event Description]			[Event_Description]
	,[Event Outcome] 			Event_Outcome
    ,[Request: Route of Access]			[Request_Route_of_Access]
    ,[Assessment Type]			[Assessment_Type]
    ,[Eligible Needs Identified]			[Eligible_Needs_Identified]
    ,[Method of Assessment]			[Method_of_Assessment]
    ,[Total Hrs Caring per week]			[Total_Hrs_Caring_Per_Week]
    ,[No. of adults being cared for]			[No_of_adults_being_cared_for]
    ,[Adult 1 Linked Person_ID]			[Adult_1_Linked_Person_ID]
    ,[Adult 2 Linked Person_ID]			[Adult_2_Linked_Person_ID]
    ,[Adult 3 Linked Person_ID]			[Adult_3_Linked_Person_ID]
	,[Service Type] 			Service_Type
    ,[Service Component]			[Service_Component]
    ,[Delivery Mechanism]			[Delivery_Mechanism]
    ,[Provider CQC Location Name]			[Provider_CQC_Location_Name]
    ,[Provider CQC Location ID]			[Provider_CQC_Location_ID]
    ,[Review Reason]			[Review_Reason]
    ,[Review Outcomes Achieved]			[Review_Outcomes_Achieved]
    ,[Method of Review]			[Method_of_Review]
    ,[Unit Cost]			[Unit_Cost]
    ,[Cost Frequency (Unit Type)]			[Cost_Frequency_Unit_Type]
    ,[Planned units per week]			[Planned_Units_Per_Week]
    ,ROW_NUMBER() over (order by [Submission], [Event Reference])			Der_Unique_Record_ID
    ,[Submission]			[Submission]
	,cast(getdate() as date) ImportDate
	,1 ImportFileId 
	,1 [Der_Conversation]
	,1 [Der_Conversation_1]
	,[Adult 1 Linked Person_ID] Der_Adult_1_Linked_Person_ID_Pseudo
	,[Adult 2 Linked Person_ID] Der_Adult_2_Linked_Person_ID_Pseudo
    ,[Adult 3 Linked Person_ID] Der_Adult_3_Linked_Person_ID_Pseudo
	,null Der_DBS_Check_Status
    ,floor(datediff(d,[Date of Birth],[Event Start Date])/365.25) Der_Age_Event_Start_Date
    ,floor(datediff(d,[Date of Birth],[Reporting Period End Date])/365.25) Der_Age_Reporting_Period_End_Date
    ,null Der_Postcode_Sector
    ,null Der_Postcode_Constituency_Code
    ,null Der_Postcode_District_Unitary_Authority
    ,null Der_Postcode_Electoral_Ward
    ,null Der_Postcode_Local_Authority
    ,null Der_Postcode_CCG_Code
    ,null Der_Postcode_LSOA_Code
    ,null Der_Postcode_MSOA_Code
    ,null Der_Postcode_yr2011_LSOA
    ,null Der_Postcode_yr2011_MSOA
  from [CLD].[Recordleveldata]
  where submission like '%20241001_20250930'
GO


