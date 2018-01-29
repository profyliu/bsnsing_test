/*-------------------------------------------------------------------------
 |                                                                         
 |             SAS SUPPLEMENTAL SYNTAX FILE FOR ICPSR 27062
 |        CRIME DURING THE TRANSITION TO ADULTHOOD: HOW YOUTH FARE
 |         AS THEY LEAVE OUT-OF-HOME CARE IN ILLINOIS, IOWA, AND
 |                          WISCONSIN, 2002-2007
 |                            (DATASET 0001: )
 |
 | This SAS program is provided for optional use with the SAS transport
 | version of this data file as distributed by ICPSR. The metadata
 | provided below are not stored in the SAS transport version of this data
 | collection.  Users need to use SAS PROC CIMPORT to import the SAS
 | transport file to a SAS data set on their system. This program can
 | then be used in conjunction with the SAS system data file.
 |
 | DATA:  begins a SAS data step and names an output SAS data set. Users
 | should replace "SAS-dataset" with their name for the SAS data set copied
 | from the SAS transport file. Users can add a SAS libname statement
 | and an output SAS data set name to make a permanent SAS data set.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | If any variables have more than one missing value, they are assigned
 | to the standard missing value of a single period (.) in the statement
 | below. To maintain the original meaning of missing codes, users may want
 | to take advantage of the SAS missing values (the letters A-Z or an
 | underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .;
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | NOTE:  Users should modify this file to suit their specific needs.
 | The MISSING VALUE RECODES section has been commented out (i.e., '/*').
 | To make this section active in the program, users should remove the SAS
 | comment indicators from this section.
 |
 |------------------------------------------------------------------------*/

RUN;

* SAS DATA STEP;
DATA;
SET SAS-dataset ;


* USER-DEFINED MISSING VALUES RECODE TO SAS SYSMIS;

/*
   IF (STATE = -9) THEN STATE = .;
   IF (CHILDREN_W1 = -9) THEN CHILDREN_W1 = .;
   IF (ABUSESUM_W1 = -9.0000) THEN ABUSESUM_W1 = .;
   IF (NEGLECTSUM_W1 = -9.0000) THEN NEGLECTSUM_W1 = .;
   IF (DEL1_W1 = -9) THEN DEL1_W1 = .;
   IF (DEL2_W1 = -9) THEN DEL2_W1 = .;
   IF (DEL3_W1 = -9) THEN DEL3_W1 = .;
   IF (DEL4_W1 = -9) THEN DEL4_W1 = .;
   IF (DEL5_W1 = -9) THEN DEL5_W1 = .;
   IF (DEL6_W1 = -9) THEN DEL6_W1 = .;
   IF (DEL7_W1 = -9) THEN DEL7_W1 = .;
   IF (DEL8_W1 = -9) THEN DEL8_W1 = .;
   IF (DEL9_W1 = -9) THEN DEL9_W1 = .;
   IF (DEL10_W1 = -9) THEN DEL10_W1 = .;
   IF (DEL1_W2 = -9) THEN DEL1_W2 = .;
   IF (DEL2_W2 = -9) THEN DEL2_W2 = .;
   IF (DEL3_W2 = -9) THEN DEL3_W2 = .;
   IF (DEL4_W2 = -9) THEN DEL4_W2 = .;
   IF (DEL5_W2 = -9) THEN DEL5_W2 = .;
   IF (DEL6_W2 = -9) THEN DEL6_W2 = .;
   IF (DEL7_W2 = -9) THEN DEL7_W2 = .;
   IF (DEL8_W2 = -9) THEN DEL8_W2 = .;
   IF (DEL9_W2 = -9) THEN DEL9_W2 = .;
   IF (DEL10_W2 = -9) THEN DEL10_W2 = .;
   IF (DEL1_W3 = -1 OR DEL1_W3 = -2 OR DEL1_W3 = -9) THEN DEL1_W3 = .;
   IF (DEL2_W3 = -1 OR DEL2_W3 = -2 OR DEL2_W3 = -9) THEN DEL2_W3 = .;
   IF (DEL3_W3 = -1 OR DEL3_W3 = -2 OR DEL3_W3 = -9) THEN DEL3_W3 = .;
   IF (DEL4_W3 = -1 OR DEL4_W3 = -2 OR DEL4_W3 = -9) THEN DEL4_W3 = .;
   IF (DEL5_W3 = -1 OR DEL5_W3 = -2 OR DEL5_W3 = -9) THEN DEL5_W3 = .;
   IF (DEL6_W3 = -1 OR DEL6_W3 = -2 OR DEL6_W3 = -9) THEN DEL6_W3 = .;
   IF (DEL7_W3 = -1 OR DEL7_W3 = -2 OR DEL7_W3 = -9) THEN DEL7_W3 = .;
   IF (DEL8_W3 = -1 OR DEL8_W3 = -2 OR DEL8_W3 = -9) THEN DEL8_W3 = .;
   IF (DEL9_W3 = -1 OR DEL9_W3 = -2 OR DEL9_W3 = -9) THEN DEL9_W3 = .;
   IF (DEL10_W3 = -1 OR DEL10_W3 = -2 OR DEL10_W3 = -9) THEN DEL10_W3 = .;
   IF (DELSUM_W1 = -9) THEN DELSUM_W1 = .;
   IF (ARREST_W1 = -9) THEN ARREST_W1 = .;
   IF (VIOLENT_W1 = -9) THEN VIOLENT_W1 = .;
   IF (NONVIOLENT_W1 = -9) THEN NONVIOLENT_W1 = .;
   IF (VIOLENT_W2 = -9) THEN VIOLENT_W2 = .;
   IF (NONVIOLENT_W2 = -9) THEN NONVIOLENT_W2 = .;
   IF (VIOLENT_W3 = -9) THEN VIOLENT_W3 = .;
   IF (NONVIOLENT_3 = -9) THEN NONVIOLENT_3 = .;
   IF (VIOSUM_W3 = -9) THEN VIOSUM_W3 = .;
   IF (NONVIOLSUM_W3 = -9) THEN NONVIOLSUM_W3 = .;
   IF (EVERARREST_W1 = -9) THEN EVERARREST_W1 = .;
   IF (EVERARREST_W2 = -9) THEN EVERARREST_W2 = .;
   IF (NEWARREST_W2 = -9) THEN NEWARREST_W2 = .;
   IF (NEWARREST_W3 = -9) THEN NEWARREST_W3 = .;
   IF (NEWARREST_W3 >= -4 AND NEWARREST_W3 <= -1) THEN NEWARREST_W3 = .;
   IF (ARREST_EVENT = -9) THEN ARREST_EVENT = .;
   IF (TIME_TO_EVENT = -9) THEN TIME_TO_EVENT = .;
   IF (CRIME_CLASS = -9) THEN CRIME_CLASS = .;
   IF (TOTAL_PLACEMENTS_W1 = -9) THEN TOTAL_PLACEMENTS_W1 = .;
   IF (ILS_SUM_W1 = -9.0000) THEN ILS_SUM_W1 = .;
   IF (CLOSEMOM_W1 = -9) THEN CLOSEMOM_W1 = .;
   IF (CLOSEDAD_W1 = -9) THEN CLOSEDAD_W1 = .;
   IF (COLLEGEPLANS_W1 = -9) THEN COLLEGEPLANS_W1 = .;
   IF (EMPLOYED_W1 = -9) THEN EMPLOYED_W1 = .;
   IF (SUPPORT_W1 = -9.0000) THEN SUPPORT_W1 = .;
   IF (CWHELP_W1 = -9.0000) THEN CWHELP_W1 = .;
   IF (EMPLOYED_W2 = -9) THEN EMPLOYED_W2 = .;
   IF (INSCHOOL_W2 = -9) THEN INSCHOOL_W2 = .;
   IF (EMPLOYED_W3 = -1 OR EMPLOYED_W3 = -9) THEN EMPLOYED_W3 = .;
   IF (INSCHOOL_W3 = -9) THEN INSCHOOL_W3 = .;
*/

RUN ;
