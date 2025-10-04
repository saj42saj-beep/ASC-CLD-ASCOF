PREREQUESITES to setup code in your environment.
The code below is from https://github.com/DataS-DHSC/ASC-CLD-LA-Dashboard
It works well but needs some tweaking to run it locally.
1. replace schemas to your local database.
    **ASC_Sandbox.**
    **DHSC_ASC.**

2. ensure you have **CLD_R1_Raw** which is the raw data. We have a view that hooks onto our stored data and allows us to generate ASCOF data for a given period.
