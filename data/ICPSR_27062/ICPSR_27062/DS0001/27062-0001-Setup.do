/**************************************************************************
 |                                                                         
 |                    STATA SETUP FILE FOR ICPSR 27062
 |        CRIME DURING THE TRANSITION TO ADULTHOOD: HOW YOUTH FARE
 |         AS THEY LEAVE OUT-OF-HOME CARE IN ILLINOIS, IOWA, AND
 |                          WISCONSIN, 2002-2007
 |                            (DATASET 0001: )
 |
 |
 |  Please edit this file as instructed below.
 |  To execute, start Stata, change to the directory containing:
 |       - this do file
 |       - the ASCII data file
 |       - the dictionary file
 |
 |  Then execute the do file (e.g., do 27062-0001-statasetup.do)
 |
 **************************************************************************/

set mem 6m  /* Allocating 6 megabyte(s) of RAM for Stata SE to read the
                 data file into memory. */


set more off  /* This prevents the Stata output viewer from pausing the
                 process */

/****************************************************

Section 1: File Specifications
   This section assigns local macros to the necessary files.
   Please edit:
        "data-filename" ==> The name of data file downloaded from ICPSR
        "dictionary-filename" ==> The name of the dictionary file downloaded.
        "stata-datafile" ==> The name you wish to call your Stata data file.

   Note:  We assume that the raw data, dictionary, and setup (this do file) all
          reside in the same directory (or folder).  If that is not the case
          you will need to include paths as well as filenames in the macros.

********************************************************/

local raw_data "data-filename"
local dict "dictionary-filename"
local outfile "stata-datafile"

/********************************************************

Section 2: Infile Command

This section reads the raw data into Stata format.  If Section 1 was defined
properly, there should be no reason to modify this section.  These macros
should inflate automatically.

**********************************************************/

infile using `dict', using (`raw_data') clear


/*********************************************************

Section 3: Value Label Definitions
This section defines labels for the individual values of each variable.
We suggest that users do not modify this section.

**********************************************************/


label data "Crime During the Transition to Adulthood: How Youth Fare As They Leave Out-of-Home Care in Illinois, Iowa, and Wisconsin, 2002-2007"

#delimit ;
label define WAVE1     0 "No" 1 "Yes" ;
label define WAVE2     0 "No" 1 "Yes" ;
label define WAVE3     0 "No" 1 "Yes" ;
label define GENDER    0 "Female" 1 "Male" ;
label define AGE_W1    97 "Masked" ;
label define HISPANIC  0 "No" 1 "Yes" ;
label define WHITE     0 "No" 1 "Yes" ;
label define BLACK     0 "No" 1 "Yes" ;
label define OTHERRACE 0 "No" 1 "Yes" ;
label define STATE     -9 "Blank" 1 "Wisconsin" 2 "Illinois" 3 "Iowa"
                       97 "Masked" ;
label define AODA_W1   0 "No" 1 "Yes" ;
label define MENTALHEALTH_W1 0 "No" 1 "Yes" ;
label define CHILDREN_W1 -9 "Blank" 0 "No" 1 "Yes" ;
label define ABUSESUM_W1 -9 "Blank" ;
label define NEGLECTSUM_W1 -9 "Blank" ;
label define VICTIMSEX_W1 0 "No" 1 "Yes" ;
label define DEL1_W1   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL2_W1   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL3_W1   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL4_W1   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL5_W1   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL6_W1   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL7_W1   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL8_W1   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL9_W1   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL10_W1  -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL1_W2   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL2_W2   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL3_W2   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL4_W2   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL5_W2   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL6_W2   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL7_W2   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL8_W2   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL9_W2   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL10_W2  -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL1_W3   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL2_W3   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL3_W3   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL4_W3   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL5_W3   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL6_W3   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL7_W3   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL8_W3   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL9_W3   -9 "Blank" 0 "No" 1 "Yes" ;
label define DEL10_W3  -9 "Blank" 0 "No" 1 "Yes" ;
label define DELSUM_W1 -9 "Blank" ;
label define ARREST_W1 -9 "Blank" 0 "No" 1 "Yes" ;
label define VIOLENT_W1 -9 "Blank" 0 "No" 1 "Yes" ;
label define NONVIOLENT_W1 -9 "Blank" 0 "No" 1 "Yes" ;
label define VIOLENT_W2 -9 "Blank" 0 "No" 1 "Yes" ;
label define NONVIOLENT_W2 -9 "Blank" 0 "No" 1 "Yes" ;
label define VIOLENT_W3 -9 "Blank" 0 "No" 1 "Yes" ;
label define NONVIOLENT_3 -9 "Blank" 0 "No" 1 "Yes" ;
label define VIOSUM_W3 -9 "Blank" ;
label define NONVIOLSUM_W3 -9 "Blank" ;
label define EVERARREST_W1 -9 "Blank" 0 "No" 1 "Yes" ;
label define EVERARREST_W2 -9 "Blank" 0 "No" 1 "Yes" ;
label define NEWARREST_W2 -9 "Blank" 0 "No" 1 "Yes" ;
label define NEWARREST_W3 -9 "Blank" 0 "No" 1 "Yes" ;
label define ARREST_EVENT -9 "Blank" 0 "No" 1 "Yes" ;
label define TIME_TO_EVENT -9 "Blank" ;
label define CRIME_CLASS -9 "Blank" 1 "Low offenders" 2 "Adolescent limited"
                       3 "Desisters" 4 "Chronic" 5 "Chronic nonviolent" ;
label define ENTRYAGE  0 "Less than 12" 1 "12 and older" ;
label define TOTAL_PLACEMENTS_W1 -9 "Blank" 0 "Less than five placements"
                       1 "Five or more placements" ;
label define FOSTERCARE_W1 0 "No" 1 "Yes" ;
label define KINCARE_W1 0 "No" 1 "Yes" ;
label define GROUPCARE_W1 0 "No" 1 "Yes" ;
label define INDOTHCARE_W1 0 "No" 1 "Yes" ;
label define ILS_SUM_W1 -9 "Blank" ;
label define CLOSEMOM_W1 -9 "Blank" 1 "Not close" 2 "Not very close"
                       3 "Somewhat close" 4 "Very close" ;
label define MISSMOM   0 "No" 1 "Yes" ;
label define CLOSEDAD_W1 -9 "Blank" 1 "Not close" 2 "Not very close"
                       3 "Somewhat close" 4 "Very close" ;
label define MISSDAD   0 "No" 1 "Yes" ;
label define CLOSECAREGIVER_W1 -9 "Blank" 1 "Not close" 2 "Not very close"
                       3 "Somewhat close" 4 "Very close" ;
label define INSCHOOL_W1 0 "No" 1 "Yes" ;
label define COLLEGEPLANS_W1 -9 "Blank" 0 "No" 1 "Yes" ;
label define EMPLOYED_W1 -9 "Blank" 0 "No" 1 "Yes" ;
label define SUPPORT_W1 -9 "Blank" ;
label define CWHELP_W1 -9 "Blank" ;
label define EMPLOYED_W2 -9 "Blank" 0 "No" 1 "Yes" ;
label define INSCHOOL_W2 -9 "Blank" 0 "No" 1 "Yes" ;
label define EMPLOYED_W3 -9 "Blank" 0 "No" 1 "Yes" ;
label define INSCHOOL_W3 -9 "Blank" 0 "No" 1 "Yes" ;


#delimit cr


/***************************************************************************

 Section 4: Missing Values

 This section will replace numeric missing values (i.e., -9) with generic
 system missing ".".  By default the code in this section is commented out.
 Users wishing to apply the generic missing values should remove the comment
 at the beginning and end of this section.  Note that Stata allows you to
 specify up to 27 unique missing value codes.

****************************************************************/

/*
replace STATE = . if (STATE == -9)
replace CHILDREN_W1 = . if (CHILDREN_W1 == -9)
replace ABUSESUM_W1 = . if (ABUSESUM_W1 == -9.0000)
replace NEGLECTSUM_W1 = . if (NEGLECTSUM_W1 == -9.0000)
replace DEL1_W1 = . if (DEL1_W1 == -9)
replace DEL2_W1 = . if (DEL2_W1 == -9)
replace DEL3_W1 = . if (DEL3_W1 == -9)
replace DEL4_W1 = . if (DEL4_W1 == -9)
replace DEL5_W1 = . if (DEL5_W1 == -9)
replace DEL6_W1 = . if (DEL6_W1 == -9)
replace DEL7_W1 = . if (DEL7_W1 == -9)
replace DEL8_W1 = . if (DEL8_W1 == -9)
replace DEL9_W1 = . if (DEL9_W1 == -9)
replace DEL10_W1 = . if (DEL10_W1 == -9)
replace DEL1_W2 = . if (DEL1_W2 == -9)
replace DEL2_W2 = . if (DEL2_W2 == -9)
replace DEL3_W2 = . if (DEL3_W2 == -9)
replace DEL4_W2 = . if (DEL4_W2 == -9)
replace DEL5_W2 = . if (DEL5_W2 == -9)
replace DEL6_W2 = . if (DEL6_W2 == -9)
replace DEL7_W2 = . if (DEL7_W2 == -9)
replace DEL8_W2 = . if (DEL8_W2 == -9)
replace DEL9_W2 = . if (DEL9_W2 == -9)
replace DEL10_W2 = . if (DEL10_W2 == -9)
replace DEL1_W3 = . if (DEL1_W3 == -1 | DEL1_W3 == -2 | DEL1_W3 == -9)
replace DEL2_W3 = . if (DEL2_W3 == -1 | DEL2_W3 == -2 | DEL2_W3 == -9)
replace DEL3_W3 = . if (DEL3_W3 == -1 | DEL3_W3 == -2 | DEL3_W3 == -9)
replace DEL4_W3 = . if (DEL4_W3 == -1 | DEL4_W3 == -2 | DEL4_W3 == -9)
replace DEL5_W3 = . if (DEL5_W3 == -1 | DEL5_W3 == -2 | DEL5_W3 == -9)
replace DEL6_W3 = . if (DEL6_W3 == -1 | DEL6_W3 == -2 | DEL6_W3 == -9)
replace DEL7_W3 = . if (DEL7_W3 == -1 | DEL7_W3 == -2 | DEL7_W3 == -9)
replace DEL8_W3 = . if (DEL8_W3 == -1 | DEL8_W3 == -2 | DEL8_W3 == -9)
replace DEL9_W3 = . if (DEL9_W3 == -1 | DEL9_W3 == -2 | DEL9_W3 == -9)
replace DEL10_W3 = . if (DEL10_W3 == -1 | DEL10_W3 == -2 | DEL10_W3 == -9)
replace DELSUM_W1 = . if (DELSUM_W1 == -9)
replace ARREST_W1 = . if (ARREST_W1 == -9)
replace VIOLENT_W1 = . if (VIOLENT_W1 == -9)
replace NONVIOLENT_W1 = . if (NONVIOLENT_W1 == -9)
replace VIOLENT_W2 = . if (VIOLENT_W2 == -9)
replace NONVIOLENT_W2 = . if (NONVIOLENT_W2 == -9)
replace VIOLENT_W3 = . if (VIOLENT_W3 == -9)
replace NONVIOLENT_3 = . if (NONVIOLENT_3 == -9)
replace VIOSUM_W3 = . if (VIOSUM_W3 == -9)
replace NONVIOLSUM_W3 = . if (NONVIOLSUM_W3 == -9)
replace EVERARREST_W1 = . if (EVERARREST_W1 == -9)
replace EVERARREST_W2 = . if (EVERARREST_W2 == -9)
replace NEWARREST_W2 = . if (NEWARREST_W2 == -9)
replace NEWARREST_W3 = . if (NEWARREST_W3 == -9)
replace NEWARREST_W3 = . if (NEWARREST_W3 >= -4 & NEWARREST_W3 <= -1)
replace ARREST_EVENT = . if (ARREST_EVENT == -9)
replace TIME_TO_EVENT = . if (TIME_TO_EVENT == -9)
replace CRIME_CLASS = . if (CRIME_CLASS == -9)
replace TOTAL_PLACEMENTS_W1 = . if (TOTAL_PLACEMENTS_W1 == -9)
replace ILS_SUM_W1 = . if (ILS_SUM_W1 == -9.0000)
replace CLOSEMOM_W1 = . if (CLOSEMOM_W1 == -9)
replace CLOSEDAD_W1 = . if (CLOSEDAD_W1 == -9)
replace COLLEGEPLANS_W1 = . if (COLLEGEPLANS_W1 == -9)
replace EMPLOYED_W1 = . if (EMPLOYED_W1 == -9)
replace SUPPORT_W1 = . if (SUPPORT_W1 == -9.0000)
replace CWHELP_W1 = . if (CWHELP_W1 == -9.0000)
replace EMPLOYED_W2 = . if (EMPLOYED_W2 == -9)
replace INSCHOOL_W2 = . if (INSCHOOL_W2 == -9)
replace EMPLOYED_W3 = . if (EMPLOYED_W3 == -1 | EMPLOYED_W3 == -9)
replace INSCHOOL_W3 = . if (INSCHOOL_W3 == -9)


*/
/********************************************************************

 Section 5: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save `outfile', replace

