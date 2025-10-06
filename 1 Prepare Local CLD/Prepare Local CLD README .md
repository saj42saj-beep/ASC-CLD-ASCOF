
**Validation**
Download and create local table which maps allowable values per field.

Fields in the table are expected to be *with spaces* as per the specification **and** mapping file.

ie
Specification
https://www.ardengemcsu.nhs.uk/media/4365/cld-data-specification_release_2_may_2025_update-v01.xlsx

Mapping file
https://www.ardengemcsu.nhs.uk/media/4362/cld-data-specification_release_2_mapping_may_2025_update.xlsx


Includes logic to validate "Unit cost" and "Planned units per week" where the value will not cast to numeric(18,2)
excludes blank as try_cast covers that (in the view)


**VIEW**
This code expects an object **CLD_R1_Raw** which is the CLD field spec plus a number of extra columns; populated from the CLD columns.





