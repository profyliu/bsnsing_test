*-------------------------------------------------------------------------*
*                                                                          
*                     SPSS SETUP FILE FOR ICPSR 27062
*         CRIME DURING THE TRANSITION TO ADULTHOOD: HOW YOUTH FARE
*          AS THEY LEAVE OUT-OF-HOME CARE IN ILLINOIS, IOWA, AND
*                           WISCONSIN, 2002-2007
*                             (DATASET 0001: )
* 
*
*  SPSS setup sections are provided for the ASCII version of this data
*  collection.  These sections are listed below:
*
*  DATA LIST:  assigns the name, type, decimal specification (if any),
*  and specifies the beginning and ending column locations for each
*  variable in the data file. Users must replace the "data-filename"
*  in the DATA LIST statement with a filename specifying the directory
*  on the user's computer system in which the downloaded and unzipped
*  data file is physically located (e.g., "c:\temp\27062-0001-data.txt").
*
*  VARIABLE LABELS:  assigns descriptive labels to all variables.
*  Labels and variable names may be identical for some data files.
*
*  MISSING VALUES: declares user-defined missing values. Not all
*  variables in this data set necessarily have user-defined missing
*  values. These values can be treated specially in data transformations,
*  statistical calculations, and case selection.
*
*  VALUE LABELS: assigns descriptive labels to codes found in the data
*  file.  Not all codes necessarily have assigned value labels.
*
*  NOTE:  Users should modify this setup file to suit their specific 
*  needs. The MISSING VALUES section has been commented out (i.e., '*').
*  To include the MISSING VALUES section in the final SPSS setup, remove 
*  the comment indicators from the desired section.
*
*  CREATING A PERMANENT SPSS DATA FILE: If users wish to create and save
*  an SPSS data file for further analysis using SPSS for Windows, the
*  necessary "SAVE OUTFILE" command is provided in the last line of
*  this file.  To activate the command, users must delete the leading
*  asterisk (*) and replace "spss-filename" with a filename specifying
*  the location on the user's computer system to which the new data file
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\da27062-0001.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=198.
DATA LIST FILE=DATA /
                  ID 1-3                 WAVE1 4
                 WAVE2 5                 WAVE3 6                GENDER 7
         AGE_W1 8-14 (4)          HISPANIC 15-16             WHITE 17-18
             BLACK 19-20         OTHERRACE 21-22             STATE 23-24
           AODA_W1 25-26   MENTALHEALTH_W1 27-28       CHILDREN_W1 29-30
   ABUSESUM_W1 31-37 (4) NEGLECTSUM_W1 38-44 (4)      VICTIMSEX_W1 45-46
           DEL1_W1 47-48           DEL2_W1 49-50           DEL3_W1 51-52
           DEL4_W1 53-54           DEL5_W1 55-56           DEL6_W1 57-58
           DEL7_W1 59-60           DEL8_W1 61-62           DEL9_W1 63-64
          DEL10_W1 65-66           DEL1_W2 67-68           DEL2_W2 69-70
           DEL3_W2 71-72           DEL4_W2 73-74           DEL5_W2 75-76
           DEL6_W2 77-78           DEL7_W2 79-80           DEL8_W2 81-82
           DEL9_W2 83-84          DEL10_W2 85-86           DEL1_W3 87-88
           DEL2_W3 89-90           DEL3_W3 91-92           DEL4_W3 93-94
           DEL5_W3 95-96           DEL6_W3 97-98          DEL7_W3 99-100
         DEL8_W3 101-102         DEL9_W3 103-104        DEL10_W3 105-106
       DELSUM_W1 107-108       ARREST_W1 109-110      VIOLENT_W1 111-112
   NONVIOLENT_W1 113-114      VIOLENT_W2 115-116   NONVIOLENT_W2 117-118
      VIOLENT_W3 119-120    NONVIOLENT_3 121-122       VIOSUM_W3 123-124
   NONVIOLSUM_W3 125-126   EVERARREST_W1 127-128   EVERARREST_W2 129-130
    NEWARREST_W2 131-132    NEWARREST_W3 133-134    ARREST_EVENT 135-136
   TIME_TO_EVENT 137-140     CRIME_CLASS 141-142        ENTRYAGE 143-144
 TOTAL_PLACEMENTS_W1 145-146   FOSTERCARE_W1 147-148      KINCARE_W1 149-150
    GROUPCARE_W1 151-152   INDOTHCARE_W1 153-154  ILS_SUM_W1 155-161 (4)
     CLOSEMOM_W1 162-163         MISSMOM 164-165     CLOSEDAD_W1 166-167
         MISSDAD 168-169   CLOSECAREGIVER_W1 170         INSCHOOL_W1 171
 COLLEGEPLANS_W1 172-173     EMPLOYED_W1 174-175  SUPPORT_W1 176-183 (4)
   CWHELP_W1 184-190 (4)     EMPLOYED_W2 191-192     INSCHOOL_W2 193-194
     EMPLOYED_W3 195-196     INSCHOOL_W3 197-198
   .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   ID        'CASE ID OF RESPONDENT' /
   WAVE1     'WAVE 1 DELINQUENCY RESPONDENTS. N = 730' /
   WAVE2     'WAVE 2 DELIQUENCY RESPONDENTS. N = 574' /
   WAVE3     'WAVE 3 DELIQUENCY RESPONDENTS. N = 504' /
   GENDER    'GENDER' /
   AGE_W1    'AGE AT WAVE 1' /
   HISPANIC  'HISPANIC ETHNICITY' /
   WHITE     'WHITE RACE' /
   BLACK     'BLACK RACE' /
   OTHERRACE 'OTHER RACE' /
   STATE     'STATE RESIDING AT WAVE1' /
   AODA_W1   'ANY ALCOHOL OR SUBSTANCE ABUSE DIAGNOSIS WAVE 1' /
   MENTALHEALTH_W1 'ANY MENTAL HEALTH DIAGNOSIS WAVE 1' /
   CHILDREN_W1 'DOES R HAVE ANY LIVING CHILDREN AT WAVE 1' /
   ABUSESUM_W1 'SUM OF PHYSICAL ABUSE ITEMS WAVE 1' /
   NEGLECTSUM_W1 'SUM OF NEGLECT ITEMS' /
   VICTIMSEX_W1 'VICTIM OF SEXUAL ABUSE WAVE 1' /
   DEL1_W1   'DELIBERATELY DAMAGED PROPERTY W1' /
   DEL2_W1   'STEAL SOMETHING WORTH LESS THAN $50 W1' /
   DEL3_W1   'STEAL SOMETHING WORTH MORE THAN $50 W1' /
   DEL4_W1   'GO INTO A HOUSE OR BUILDING TO STEAL SOMETHING W1' /
   DEL5_W1   'SELL MARIJUANA OR OTHER DRUGS W1' /
   DEL6_W1   'HURT SOMEONE BADLY ENOUGH TO NEED MEDICAL CARE W1' /
   DEL7_W1   'USE OR THREATEN TO USE A WEAPON TO GET SOMETHING W1' /
   DEL8_W1   'TAKE PART IN A GROUP FIGHT W1' /
   DEL9_W1   'PULL A KNIFE OR GUN ON SOMEONE W1' /
   DEL10_W1  'SHOOT OR STABB SOMEONE W1' /
   DEL1_W2   'DELIBERATELY DAMAGED PROPERTY W2' /
   DEL2_W2   'STEAL SOMETHING WORTH LESS THAN $50 W2' /
   DEL3_W2   'STEAL SOMETHING WORTH MORE THAN $50 W2' /
   DEL4_W2   'GO INTO A HOUSE OR BUILDING TO STEAL SOMETHING W2' /
   DEL5_W2   'SELL MARIJUANA OR OTHER DRUGS W2' /
   DEL6_W2   'HURT SOMEONE BADLY ENOUGH TO NEED MEDICAL CARE W2' /
   DEL7_W2   'USE OR THREATEN TO USE A WEAPON TO GET SOMETHING W2' /
   DEL8_W2   'TAKE PART IN A GROUP FIGHT W2' /
   DEL9_W2   'PULL A KNIFE OR GUN ON SOMEONE W2' /
   DEL10_W2  'SHOOT OR STABB SOMEONE W2' /
   DEL1_W3   'DELIBERATELY DAMAGED PROPERTY W3' /
   DEL2_W3   'STEAL SOMETHING WORTH LESS THAN $50 W3' /
   DEL3_W3   'STEAL SOMETHING WORTH MORE THAN $50 W3' /
   DEL4_W3   'GO INTO A HOUSE OR BUILDING TO STEAL SOMETHING W3' /
   DEL5_W3   'SELL MARIJUANA OR OTHER DRUGS W3' /
   DEL6_W3   'HURT SOMEONE BADLY ENOUGH TO NEED MEDICAL CARE W3' /
   DEL7_W3   'USE OR THREATEN TO USE A WEAPON TO GET SOMETHING W3' /
   DEL8_W3   'TAKE PART IN A GROUP FIGHT W3' /
   DEL9_W3   'PULL A KNIFE OR GUN ON SOMEONE W3' /
   DEL10_W3  'SHOOT OR STABB SOMEONE W3' /
   DELSUM_W1 'NUMBER OF TOTAL DELINQUENCY ITEMS SELF REPORTWAVE 1' /
   ARREST_W1 'EVER ARRESTED AT WAVE 1 SELF REPORT' /
   VIOLENT_W1 'ANY VIOLENT OFFENSE WAVE 1' /
   NONVIOLENT_W1 'ANY NONVIOLENT OFFENSE WAVE 1' /
   VIOLENT_W2 'ANY VIOLENT OFFENSE WAVE 2' /
   NONVIOLENT_W2 'ANY NONVIOLENT OFFENSE WAVE 2' /
   VIOLENT_W3 'ANY VIOLENT OFFENSE WAVE 3' /
   NONVIOLENT_3 'ANY NONVIOLENT OFFENSE WAVE 3' /
   VIOSUM_W3 'VIOLENT OFFENSES SCALE SELF REPORT WAVE 3' /
   NONVIOLSUM_W3 'NONVIOLENT OFFENSES SCALE SELF REPORT WAVE 3' /
   EVERARREST_W1 'EVER ARRESTED SELF REPORT AT WAVE 1' /
   EVERARREST_W2 'EVER ARRESTED SELF REPORT AT WAVE 2' /
   NEWARREST_W2 'ARRESTED SELF REPORT AT WAVE 2 SINCE WAVE 1' /
   NEWARREST_W3 'ARRESTED SELF REPORT AT WAVE 3 SINCE WAVE 2' /
   ARREST_EVENT 'OFFICIAL ARREST RECORD' /
   TIME_TO_EVENT 'TIME TO EVENT (ARREST OR END OF OBSERVATION PERIOD)' /
   CRIME_CLASS 'CRIME OVER TIME LATENT CLASS ASSIGNMENT' /
   ENTRYAGE  'AGE AT FIRST ENTRY INTO FOSTER CARE' /
   TOTAL_PLACEMENTS_W1 'TOTAL NUMBER OF FOSTER CARE AND GROUP HOME'+
     ' PLACEMENTS AT WAVE 1'/
   FOSTERCARE_W1 'IN FOSTER CARE WAVE1' /
   KINCARE_W1 'IN KINSHIP CARE WAVE 1' /
   GROUPCARE_W1 'IN GROUP CARE WAVE 1' /
   INDOTHCARE_W1 'IN INDEPENDENT LIVING OR OTHER CARE WAVE 1' /
   ILS_SUM_W1 'SUM OF ANY ILS SERVICES WAVE 1' /
   CLOSEMOM_W1 'MATERNAL CLOSENESS SCALE WAVE 1' /
   MISSMOM   'NO MOM OR STEPMOM WAVE 1' /
   CLOSEDAD_W1 'PATERNAL CLOSENESS SCALE WAVE 1' /
   MISSDAD   'NO DAD OR STEPDAD WAVE 1' /
   CLOSECAREGIVER_W1 'CAREGIVER CLOSENESS SCALE WAVE 1' /
   INSCHOOL_W1 'IN SCHOOL WAVE 1' /
   COLLEGEPLANS_W1 'COLLEGE OR BEYOND PLANS WAVE 1' /
   EMPLOYED_W1 'CURRENTLY EMPLOYED WAVE 1' /
   SUPPORT_W1 'SCALE SCORE FOR SOCIAL SUPPORT WAVE 1' /
   CWHELP_W1 'LIKELIHOOD TO ASK THE CHILD WELFARE SYSTEM FOR HELP AFTER'+
     ' DISCHARGE SCALE WAVE 1'/
   EMPLOYED_W2 'CURRENTLY EMPLOYED WAVE 2' /
   INSCHOOL_W2 'IN SCHOOL WAVE 2' /
   EMPLOYED_W3 'CURRENTLY EMPLOYED WAVE 3' /
   INSCHOOL_W3 'IN SCHOOL WAVE 3' /
   .


* SPSS VALUE LABELS COMMAND.

VALUE LABELS
   WAVE1     0 'No' 1 'Yes' /
   WAVE2     0 'No' 1 'Yes' /
   WAVE3     0 'No' 1 'Yes' /
   GENDER    0 'Female' 1 'Male' /
   AGE_W1    97 'Masked' /
   HISPANIC  0 'No' 1 'Yes' /
   WHITE     0 'No' 1 'Yes' /
   BLACK     0 'No' 1 'Yes' /
   OTHERRACE 0 'No' 1 'Yes' /
   STATE     -9 'Blank' 1 'Wisconsin' 2 'Illinois' 3 'Iowa' 97 'Masked' /
   AODA_W1   0 'No' 1 'Yes' /
   MENTALHEALTH_W1 0 'No' 1 'Yes' /
   CHILDREN_W1 -9 'Blank' 0 'No' 1 'Yes' /
   ABUSESUM_W1 -9 'Blank' /
   NEGLECTSUM_W1 -9 'Blank' /
   VICTIMSEX_W1 0 'No' 1 'Yes' /
   DEL1_W1   -9 'Blank' 0 'No' 1 'Yes' /
   DEL2_W1   -9 'Blank' 0 'No' 1 'Yes' /
   DEL3_W1   -9 'Blank' 0 'No' 1 'Yes' /
   DEL4_W1   -9 'Blank' 0 'No' 1 'Yes' /
   DEL5_W1   -9 'Blank' 0 'No' 1 'Yes' /
   DEL6_W1   -9 'Blank' 0 'No' 1 'Yes' /
   DEL7_W1   -9 'Blank' 0 'No' 1 'Yes' /
   DEL8_W1   -9 'Blank' 0 'No' 1 'Yes' /
   DEL9_W1   -9 'Blank' 0 'No' 1 'Yes' /
   DEL10_W1  -9 'Blank' 0 'No' 1 'Yes' /
   DEL1_W2   -9 'Blank' 0 'No' 1 'Yes' /
   DEL2_W2   -9 'Blank' 0 'No' 1 'Yes' /
   DEL3_W2   -9 'Blank' 0 'No' 1 'Yes' /
   DEL4_W2   -9 'Blank' 0 'No' 1 'Yes' /
   DEL5_W2   -9 'Blank' 0 'No' 1 'Yes' /
   DEL6_W2   -9 'Blank' 0 'No' 1 'Yes' /
   DEL7_W2   -9 'Blank' 0 'No' 1 'Yes' /
   DEL8_W2   -9 'Blank' 0 'No' 1 'Yes' /
   DEL9_W2   -9 'Blank' 0 'No' 1 'Yes' /
   DEL10_W2  -9 'Blank' 0 'No' 1 'Yes' /
   DEL1_W3   -9 'Blank' 0 'No' 1 'Yes' /
   DEL2_W3   -9 'Blank' 0 'No' 1 'Yes' /
   DEL3_W3   -9 'Blank' 0 'No' 1 'Yes' /
   DEL4_W3   -9 'Blank' 0 'No' 1 'Yes' /
   DEL5_W3   -9 'Blank' 0 'No' 1 'Yes' /
   DEL6_W3   -9 'Blank' 0 'No' 1 'Yes' /
   DEL7_W3   -9 'Blank' 0 'No' 1 'Yes' /
   DEL8_W3   -9 'Blank' 0 'No' 1 'Yes' /
   DEL9_W3   -9 'Blank' 0 'No' 1 'Yes' /
   DEL10_W3  -9 'Blank' 0 'No' 1 'Yes' /
   DELSUM_W1 -9 'Blank' /
   ARREST_W1 -9 'Blank' 0 'No' 1 'Yes' /
   VIOLENT_W1 -9 'Blank' 0 'No' 1 'Yes' /
   NONVIOLENT_W1 -9 'Blank' 0 'No' 1 'Yes' /
   VIOLENT_W2 -9 'Blank' 0 'No' 1 'Yes' /
   NONVIOLENT_W2 -9 'Blank' 0 'No' 1 'Yes' /
   VIOLENT_W3 -9 'Blank' 0 'No' 1 'Yes' /
   NONVIOLENT_3 -9 'Blank' 0 'No' 1 'Yes' /
   VIOSUM_W3 -9 'Blank' /
   NONVIOLSUM_W3 -9 'Blank' /
   EVERARREST_W1 -9 'Blank' 0 'No' 1 'Yes' /
   EVERARREST_W2 -9 'Blank' 0 'No' 1 'Yes' /
   NEWARREST_W2 -9 'Blank' 0 'No' 1 'Yes' /
   NEWARREST_W3 -9 'Blank' 0 'No' 1 'Yes' /
   ARREST_EVENT -9 'Blank' 0 'No' 1 'Yes' /
   TIME_TO_EVENT -9 'Blank' /
   CRIME_CLASS -9 'Blank' 1 'Low offenders' 2 'Adolescent limited'
             3 'Desisters' 4 'Chronic' 5 'Chronic nonviolent' /
   ENTRYAGE  0 'Less than 12' 1 '12 and older' /
   TOTAL_PLACEMENTS_W1 -9 'Blank' 0 'Less than five placements'
             1 'Five or more placements' /
   FOSTERCARE_W1 0 'No' 1 'Yes' /
   KINCARE_W1 0 'No' 1 'Yes' /
   GROUPCARE_W1 0 'No' 1 'Yes' /
   INDOTHCARE_W1 0 'No' 1 'Yes' /
   ILS_SUM_W1 -9 'Blank' /
   CLOSEMOM_W1 -9 'Blank' 1 'Not close' 2 'Not very close' 3 'Somewhat close'
             4 'Very close' /
   MISSMOM   0 'No' 1 'Yes' /
   CLOSEDAD_W1 -9 'Blank' 1 'Not close' 2 'Not very close' 3 'Somewhat close'
             4 'Very close' /
   MISSDAD   0 'No' 1 'Yes' /
   CLOSECAREGIVER_W1 -9 'Blank' 1 'Not close' 2 'Not very close'
             3 'Somewhat close' 4 'Very close' /
   INSCHOOL_W1 0 'No' 1 'Yes' /
   COLLEGEPLANS_W1 -9 'Blank' 0 'No' 1 'Yes' /
   EMPLOYED_W1 -9 'Blank' 0 'No' 1 'Yes' /
   SUPPORT_W1 -9 'Blank' /
   CWHELP_W1 -9 'Blank' /
   EMPLOYED_W2 -9 'Blank' 0 'No' 1 'Yes' /
   INSCHOOL_W2 -9 'Blank' 0 'No' 1 'Yes' /
   EMPLOYED_W3 -9 'Blank' 0 'No' 1 'Yes' /
   INSCHOOL_W3 -9 'Blank' 0 'No' 1 'Yes' /
   .

* SPSS MISSING VALUES COMMAND.

* MISSING VALUES
     STATE (-9) /
     CHILDREN_W1 (-9) /
     ABUSESUM_W1 (-9.0000) /
     NEGLECTSUM_W1 (-9.0000) /
     DEL1_W1 (-9) /
     DEL2_W1 (-9) /
     DEL3_W1 (-9) /
     DEL4_W1 (-9) /
     DEL5_W1 (-9) /
     DEL6_W1 (-9) /
     DEL7_W1 (-9) /
     DEL8_W1 (-9) /
     DEL9_W1 (-9) /
     DEL10_W1 (-9) /
     DEL1_W2 (-9) /
     DEL2_W2 (-9) /
     DEL3_W2 (-9) /
     DEL4_W2 (-9) /
     DEL5_W2 (-9) /
     DEL6_W2 (-9) /
     DEL7_W2 (-9) /
     DEL8_W2 (-9) /
     DEL9_W2 (-9) /
     DEL10_W2 (-9) /
     DEL1_W3 (-1, -2, -9) /
     DEL2_W3 (-1, -2, -9) /
     DEL3_W3 (-1, -2, -9) /
     DEL4_W3 (-1, -2, -9) /
     DEL5_W3 (-1, -2, -9) /
     DEL6_W3 (-1, -2, -9) /
     DEL7_W3 (-1, -2, -9) /
     DEL8_W3 (-1, -2, -9) /
     DEL9_W3 (-1, -2, -9) /
     DEL10_W3 (-1, -2, -9) /
     DELSUM_W1 (-9) /
     ARREST_W1 (-9) /
     VIOLENT_W1 (-9) /
     NONVIOLENT_W1 (-9) /
     VIOLENT_W2 (-9) /
     NONVIOLENT_W2 (-9) /
     VIOLENT_W3 (-9) /
     NONVIOLENT_3 (-9) /
     VIOSUM_W3 (-9) /
     NONVIOLSUM_W3 (-9) /
     EVERARREST_W1 (-9) /
     EVERARREST_W2 (-9) /
     NEWARREST_W2 (-9) /
     NEWARREST_W3 (-4 thru -1, -9) /
     ARREST_EVENT (-9) /
     TIME_TO_EVENT (-9) /
     CRIME_CLASS (-9) /
     TOTAL_PLACEMENTS_W1 (-9) /
     ILS_SUM_W1 (-9.0000) /
     CLOSEMOM_W1 (-9) /
     CLOSEDAD_W1 (-9) /
     COLLEGEPLANS_W1 (-9) /
     EMPLOYED_W1 (-9) /
     SUPPORT_W1 (-9.0000) /
     CWHELP_W1 (-9.0000) /
     EMPLOYED_W2 (-9) /
     INSCHOOL_W2 (-9) /
     EMPLOYED_W3 (-1, -9) /
     INSCHOOL_W3 (-9) /
   .

EXECUTE.

* Create SPSS system file.

*SAVE OUTFILE="spss-filename.sav".
