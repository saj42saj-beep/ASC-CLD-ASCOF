**Validation**
Stored procedure that will validate CLD data.
1. Defined list values are correct.
2. Unit Cost and Planned units per week are numeric 2dp.
3. **TO DO** add extra validation logic as needed. TBD.

Download and create local table which maps allowable values per field.
Fields in the table are expected to be *with spaces* as per the specification **and** mapping file.

ie
Specification
https://www.ardengemcsu.nhs.uk/media/4365/cld-data-specification_release_2_may_2025_update-v01.xlsx

Mapping file
https://www.ardengemcsu.nhs.uk/media/4362/cld-data-specification_release_2_mapping_may_2025_update.xlsx


Includes logic to validate "Unit cost" and "Planned units per week" where the value will not cast to numeric(18,2)
excludes blank as try_cast covers that (in the view)


**CLD_R1_Raw**   ie  **VIEW**
The code expects an object **CLD_R1_Raw** which is the CLD fields plus a number of extra columns; populated from the CLD columns so a VIEW works well.


**REF_ objects**
Script to generate appropriate supporting REF_ objects.
