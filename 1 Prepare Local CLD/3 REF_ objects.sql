-- The original code expects a number of REF_ objects for mapping and hierarchy
-- the assumption is that the CLD data has been validated so all
-- mapping objects are simply select distinct [value] from CLDData
-- plus LA, population and gender specific data.


-- *** - alter as appropriate. Specific to LA.

CREATE view [CLD].[REF_ONS_Codes_LA_Region_Lookup_April_2024] as
select *** LA_Area_Code, *** LA_Code, 'Bradford' LA_Name;


CREATE view [CLD].[REF_ONS_Codes_LA_Region_Lookup]
as select * from [REF_ONS_Codes_LA_Region_Lookup_April_2024];


CREATE view [CLD].[REF_ONS_Pop_Gender_Pub_Age_Bands]
as 
select * from [CLD].[REF_ONS_Pop_Gender_Pub_Age_Bands_23];


CREATE view [CLD].[REF_ONS_Pop_Gender_Pub_Age_Bands_23]
as 
select *** LA_Code, *** code,'18 to 64' Age_Band, 332435 Population,'all' gender 
,'Local Authority' [Geography] union

select *** LA_Code, *** code,'65 and above' Age_Band, 86375 Population,'all' gender 
,'Local Authority' [Geography];


CREATE view [CLD].[REF_ONS_Pop_Gender_Pub_Age_Bands_24]
as 
select *** LA_Code, *** code,'18 to 64' Age_Band, 333625 Population,'all' gender 
,'Local Authority' [Geography] union


select *** LA_Code, *** code,'65 and above' Age_Band, 87479 Population,'all' gender 
,'Local Authority' [Geography];

create view [CLD].[Reference_ODS_LA] as
select '***' as LA_Name;


-- #########################
-- REF_MAPPING objects
-- rather than rewriting some of the code these views that map onto the various fields ensure it runs.


create view [CLD].[REF_Accommodation_Status_Mapping] as 
select distinct Accommodation_Status  as Accommodation_Status_Raw,
Accommodation_Status as Accommodation_Status_Cleaned_R1,
Accommodation_Status as Accommodation_Status_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Assessment_Type_Mapping] as 
select distinct Assessment_Type  as Assessment_Type_Raw,
Assessment_Type as Assessment_Type_Cleaned_R1,
Assessment_Type as Assessment_Type_Grouped_R1
from [CLD].[CLD_R1_Raw];



CREATE view [CLD].[REF_Client_Funding_Status_Mapping] as 
select distinct Client_Funding_Status  as Client_Funding_Status_Raw,
Client_Funding_Status as Client_Funding_Status_Cleaned_R1,
Client_Funding_Status as Client_Funding_Status_Grouped_R1,
Client_Funding_Status as Client_Funding_Status_Cleaned_R2,
Client_Funding_Status as Client_Funding_Status_Grouped_R2
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Client_Type_Mapping] as 
select distinct Client_Type  as Client_Type_Raw,
Client_Type as Client_Type_Cleaned_R1,
Client_Type as Client_Type_Grouped_R1
from [CLD].[CLD_R1_Raw];



CREATE view [CLD].[REF_Cost_Frequency_Mapping] as 
select distinct Cost_Frequency_Unit_Type  as Cost_Frequency_Unit_Type_Raw,
Cost_Frequency_Unit_Type as Cost_Frequency_Unit_Type_Cleaned_R1,
Cost_Frequency_Unit_Type as Cost_Frequency_Unit_Type_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Delivery_Mechanism_Mapping] as 
select distinct Delivery_Mechanism  as Delivery_Mechanism_Raw,
Delivery_Mechanism as Delivery_Mechanism_Cleaned_R1,
Delivery_Mechanism as Delivery_Mechanism_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Employment_Status_Mapping] as 
select distinct Employment_Status  as Employment_Status_Raw,
Employment_Status as Employment_Status_Cleaned_R1,
Employment_Status as Employment_Status_Grouped_R1
from [CLD].[CLD_R1_Raw];



CREATE view [CLD].[REF_Ethnicity_Mapping] as 
select distinct ethnicity  as Ethnicity_Raw,
ethnicity as Ethnicity_Cleaned_R1,
left(ethnicity,CHARINDEX(':',ethnicity)-1) as Ethnicity_Grouped_R1
from [CLD].[CLD_R1_Raw];



CREATE view [CLD].[REF_Event_Outcome_Mapping] as
select distinct Event_Outcome  as Event_Outcome_Raw,
Event_Outcome as Event_Outcome_Cleaned_R1,
Event_Outcome as Event_Outcome_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Gender_Mapping] as
select distinct gender  as gender_Raw,
gender as gender_Cleaned
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Has_Unpaid_Carer_Mapping] as
select distinct Has_Unpaid_Carer  as Has_Unpaid_Carer_Raw,
Has_Unpaid_Carer as Has_Unpaid_Carer_Cleaned
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Hearing_Impairment_Mapping] as 
select distinct Hearing_Impairment  as Hearing_Impairment_Raw,
Hearing_Impairment as Hearing_Impairment_Cleaned_R1,
Hearing_Impairment as Hearing_Impairment_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Method_Of_Assessment_Mapping] as 
select distinct Method_Of_Assessment  as Method_Of_Assessment_Raw,
Method_Of_Assessment as Method_Of_Assessment_Cleaned_R1,
Method_Of_Assessment as Method_Of_Assessment_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Method_Of_Review_Mapping] as 
select distinct Method_Of_Review  as Method_Of_Review_Raw,
Method_Of_Review as Method_Of_Review_Cleaned_R1,
Method_Of_Review as Method_Of_Review_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Primary_Support_Reason_Mapping] as 
select distinct Primary_Support_Reason  as Primary_Support_Reason_Raw,
Primary_Support_Reason as Primary_Support_Reason_Cleaned_R1,
Primary_Support_Reason as Primary_Support_Reason_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Request_Route_of_Access_Mapping] as 
select distinct Request_Route_of_Access  as Request_Route_of_Access_Raw,
Request_Route_of_Access as Request_Route_of_Access_Cleaned_R1,
Request_Route_of_Access as Request_Route_of_Access_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Review_Outcomes_Achieved_Mapping] as 
select distinct Review_Outcomes_Achieved  as Review_Outcomes_Achieved_Raw,
Review_Outcomes_Achieved as Review_Outcomes_Achieved_Cleaned_R1,
Review_Outcomes_Achieved as Review_Outcomes_Achieved_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Review_Reason_Mapping] as 
select distinct Review_Reason  as Review_Reason_Raw,
Review_Reason as Review_Reason_Cleaned_R1,
Review_Reason as Review_Reason_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Service_Component_Mapping] as 
select distinct Service_Component  as Service_Component_Raw,
Service_Component as Service_Component_Cleaned_R1,
Service_Component as Service_Component_Grouped_R1
from [CLD].[CLD_R1_Raw];



CREATE view [CLD].[REF_Service_Type_Mapping] as 
select distinct Service_Type  as Service_Type_Raw,
Service_Type as Service_Type_Cleaned_R1,
Service_Type as Service_Type_Grouped_R1
from [CLD].[CLD_R1_Raw];



CREATE view [CLD].[REF_Total_Hrs_Caring_Per_Week_Mapping] as 
select distinct Total_Hrs_Caring_Per_Week  as Total_Hrs_Caring_Per_Week_Raw,
Total_Hrs_Caring_Per_Week as Total_Hrs_Caring_Per_Week_Cleaned_R2,
Total_Hrs_Caring_Per_Week as Total_Hrs_Caring_Per_Week_Grouped_R2,
Total_Hrs_Caring_Per_Week as Total_Hrs_Caring_Per_Week_Cleaned_R1,
Total_Hrs_Caring_Per_Week as Total_Hrs_Caring_Per_Week_Grouped_R1
from [CLD].[CLD_R1_Raw];



create view [CLD].[REF_Visual_Impairment_Mapping] as 
select distinct Visual_Impairment  as Visual_Impairment_Raw,
Visual_Impairment as Visual_Impairment_Cleaned_R1,
Visual_Impairment as Visual_Impairment_Grouped_R1
from [CLD].[CLD_R1_Raw];


-- ####################################
-- HIERARCHY mapping table
-- Would be better / more efficient if these hierarchies are in 
-- https://www.ardengemcsu.nhs.uk/media/4362/cld-data-specification_release_2_mapping_may_2025_update.xlsx

create view [CLD].[REF_Event_Outcome_Hierarchy] as

select 'Progress to reablement/ST-Max' Event_Outcome_Spec, 1 Event_Outcome_Hierarchy union
select 'Progress to assessment' EventOutcome, 2 Hierarchy union
select 'Progress to re-assessment / unplanned review' EventOutcome, 3 Hierarchy union
select 'Progress to financial assessment' EventOutcome, 4 Hierarchy union
select 'Progress to support planning / services' EventOutcome, 5 Hierarchy union
select 'No change in package' EventOutcome, 6 Hierarchy union
select 'Provision of service' EventOutcome, 7 Hierarchy union
select 'Progress to end of life care' EventOutcome, 8 Hierarchy union
select 'Admitted to hospital' EventOutcome, 9 Hierarchy union
select 'NFA - Moved to another LA' EventOutcome, 10 Hierarchy union
select 'NFA - 100% NHS funded care' EventOutcome, 11 Hierarchy union
select 'NFA - Self-funded client (inc. 12wk disregard)' EventOutcome, 12 Hierarchy union
select 'NFA - Information & advice / signposting only' EventOutcome, 13 Hierarchy union
select 'NFA - Support declined' EventOutcome, 14 Hierarchy union
select 'NFA - Deceased' EventOutcome, 15 Hierarchy union
select 'Service ended as planned' EventOutcome, 16 Hierarchy union
select 'NFA - Support ended: other reason' EventOutcome, 17 Hierarchy union
select 'NFA - No services offered: other reason' EventOutcome, 18 Hierarchy union
select 'NFA- Other' EventOutcome, 19 Hierarchy ;





create view [CLD].[REF_Event_Outcome_Hierarchy_R1] as

select 'Progress to reablement/ST-Max' Event_Outcome_Spec, 1 Event_Outcome_Hierarchy union
select 'Progress to assessment, review or reassessment' EventOutcome, 2 Hierarchy union
select 'Progress to assessment, review or reassessment' EventOutcome, 3 Hierarchy union
select 'Progress to financial assessment' EventOutcome, 4 Hierarchy union
select 'Progress to support planning / services' EventOutcome, 5 Hierarchy union
select 'Continuation of support or services' EventOutcome, 6 Hierarchy union
select 'Provision of service' EventOutcome, 7 Hierarchy union
select 'Admitted to hospital' EventOutcome, 9 Hierarchy union
select 'NFA: Responsibility moved to another local authority' EventOutcome, 10 Hierarchy union
select 'NFA: Referral to NHS services or NHS funded social care' EventOutcome, 11 Hierarchy union
select 'NFA: Self-funded client or under 12wk disregard' EventOutcome, 12 Hierarchy union
select 'NFA: Information and advice or signposting' EventOutcome, 13 Hierarchy union
select 'NFA: Support declined' EventOutcome, 14 Hierarchy union
select 'NFA: Deceased' EventOutcome, 15 Hierarchy union
select 'NFA: Support ended as planned' EventOutcome, 16 Hierarchy union
select 'NFA: Support ended for other reason' EventOutcome, 17 Hierarchy union
select 'NFA: No services offered for other reason' EventOutcome, 18 Hierarchy union
select 'NFA: Other' EventOutcome, 19 Hierarchy;
