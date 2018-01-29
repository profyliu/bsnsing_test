/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 27062
 |        CRIME DURING THE TRANSITION TO ADULTHOOD: HOW YOUTH FARE
 |         AS THEY LEAVE OUT-OF-HOME CARE IN ILLINOIS, IOWA, AND
 |                          WISCONSIN, 2002-2007
 |                            (DATASET 0001: )
 |
 |
 | SAS setup sections are provided for the ASCII version of this data
 | collection.  These sections are listed below:
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions. Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set.
 |
 | INFILE:  identifies the input file to be read with the input statement.
 | Users must replace the "data-filename" with a filename specifying the
 | directory on the user's computer system in which the downloaded and
 | unzipped data file is physically located (e.g.,
 | "c:\temp\27062-0001-data.txt").
 |
 | INPUT:  assigns the name, type, decimal specification (if any), and
 | specifies the beginning and ending column locations for each variable
 | in the data file.
 |
 | LABEL:  assigns descriptive labels to all variables. Variable labels
 | and variable names may be identical for some variables.
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
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | NOTE:  Users should modify this setup file to suit their specific needs.
 | Sections for PROC FORMAT, FORMAT, and MISSING VALUE RECODES have been
 | commented out (i.e., '/*'). To include these sections in the final SAS
 | setup, users should remove the SAS comment indicators from the desired
 | section(s).
 |
 |------------------------------------------------------------------------*/

* SAS PROC FORMAT;

/*
PROC FORMAT;
  VALUE wave1fff  0='No' 1='Yes' ;
  VALUE wave2fff  0='No' 1='Yes' ;
  VALUE wave3fff  0='No' 1='Yes' ;
  VALUE gender    0='Female' 1='Male' ;
  VALUE age_w1ff  97='Masked' ;
  VALUE hispanic  0='No' 1='Yes' ;
  VALUE white     0='No' 1='Yes' ;
  VALUE black     0='No' 1='Yes' ;
  VALUE otherraf  0='No' 1='Yes' ;
  VALUE state     -9='Blank' 1='Wisconsin' 2='Illinois' 3='Iowa' 97='Masked' ;
  VALUE aoda_w1f  0='No' 1='Yes' ;
  VALUE mentalhf  0='No' 1='Yes' ;
  VALUE childref  -9='Blank' 0='No' 1='Yes' ;
  VALUE abusesuf  -9='Blank' ;
  VALUE neglectf  -9='Blank' ;
  VALUE victimsf  0='No' 1='Yes' ;
  VALUE del1_w1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del2_w1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del3_w1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del4_w1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del5_w1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del6_w1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del7_w1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del8_w1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del9_w1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del10_wf  -9='Blank' 0='No' 1='Yes' ;
  VALUE del1_w2f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del2_w2f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del3_w2f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del4_w2f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del5_w2f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del6_w2f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del7_w2f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del8_w2f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del9_w2f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del10_0f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del1_w3f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del2_w3f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del3_w3f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del4_w3f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del5_w3f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del6_w3f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del7_w3f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del8_w3f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del9_w3f  -9='Blank' 0='No' 1='Yes' ;
  VALUE del10_1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE delsum_f  -9='Blank' ;
  VALUE arrest_f  -9='Blank' 0='No' 1='Yes' ;
  VALUE violentf  -9='Blank' 0='No' 1='Yes' ;
  VALUE nonviolf  -9='Blank' 0='No' 1='Yes' ;
  VALUE violen0f  -9='Blank' 0='No' 1='Yes' ;
  VALUE nonvio0f  -9='Blank' 0='No' 1='Yes' ;
  VALUE violen1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE nonvio1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE viosum_f  -9='Blank' ;
  VALUE nonvio2f  -9='Blank' ;
  VALUE everarrf  -9='Blank' 0='No' 1='Yes' ;
  VALUE everar0f  -9='Blank' 0='No' 1='Yes' ;
  VALUE newarref  -9='Blank' 0='No' 1='Yes' ;
  VALUE newarr0f  -9='Blank' 0='No' 1='Yes' ;
  VALUE arrest0f  -9='Blank' 0='No' 1='Yes' ;
  VALUE time_tof  -9='Blank' ;
  VALUE crime_cf  -9='Blank' 1='Low offenders' 2='Adolescent limited'
                  3='Desisters' 4='Chronic' 5='Chronic nonviolent' ;
  VALUE entryage  0='Less than 12' 1='12 and older' ;
  VALUE total_pf  -9='Blank' 0='Less than five placements'
                  1='Five or more placements' ;
  VALUE fostercf  0='No' 1='Yes' ;
  VALUE kincaref  0='No' 1='Yes' ;
  VALUE groupcaf  0='No' 1='Yes' ;
  VALUE indothcf  0='No' 1='Yes' ;
  VALUE ils_sumf  -9='Blank' ;
  VALUE closemof  -9='Blank' 1='Not close' 2='Not very close'
                  3='Somewhat close' 4='Very close' ;
  VALUE missmom   0='No' 1='Yes' ;
  VALUE closedaf  -9='Blank' 1='Not close' 2='Not very close'
                  3='Somewhat close' 4='Very close' ;
  VALUE missdad   0='No' 1='Yes' ;
  VALUE closecaf  -9='Blank' 1='Not close' 2='Not very close'
                  3='Somewhat close' 4='Very close' ;
  VALUE inschoof  0='No' 1='Yes' ;
  VALUE collegef  -9='Blank' 0='No' 1='Yes' ;
  VALUE employef  -9='Blank' 0='No' 1='Yes' ;
  VALUE supportf  -9='Blank' ;
  VALUE cwhelp_f  -9='Blank' ;
  VALUE employ0f  -9='Blank' 0='No' 1='Yes' ;
  VALUE inscho0f  -9='Blank' 0='No' 1='Yes' ;
  VALUE employ1f  -9='Blank' 0='No' 1='Yes' ;
  VALUE inscho1f  -9='Blank' 0='No' 1='Yes' ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "data-filename" LRECL=198;
INPUT
       ID 1-3                  WAVE1 4
        WAVE2 5                 WAVE3 6                 GENDER 7
        AGE_W1 8-14 .4          HISPANIC 15-16          WHITE 17-18
        BLACK 19-20             OTHERRACE 21-22         STATE 23-24
        AODA_W1 25-26           MENTALHEALTH_W1 27-28   CHILDREN_W1 29-30
        ABUSESUM_W1 31-37 .4    NEGLECTSUM_W1 38-44 .4  VICTIMSEX_W1 45-46
        DEL1_W1 47-48           DEL2_W1 49-50           DEL3_W1 51-52
        DEL4_W1 53-54           DEL5_W1 55-56           DEL6_W1 57-58
        DEL7_W1 59-60           DEL8_W1 61-62           DEL9_W1 63-64
        DEL10_W1 65-66          DEL1_W2 67-68           DEL2_W2 69-70
        DEL3_W2 71-72           DEL4_W2 73-74           DEL5_W2 75-76
        DEL6_W2 77-78           DEL7_W2 79-80           DEL8_W2 81-82
        DEL9_W2 83-84           DEL10_W2 85-86          DEL1_W3 87-88
        DEL2_W3 89-90           DEL3_W3 91-92           DEL4_W3 93-94
        DEL5_W3 95-96           DEL6_W3 97-98           DEL7_W3 99-100
        DEL8_W3 101-102         DEL9_W3 103-104         DEL10_W3 105-106
        DELSUM_W1 107-108       ARREST_W1 109-110       VIOLENT_W1 111-112
        NONVIOLENT_W1 113-114   VIOLENT_W2 115-116      NONVIOLENT_W2 117-118
        VIOLENT_W3 119-120      NONVIOLENT_3 121-122    VIOSUM_W3 123-124
        NONVIOLSUM_W3 125-126   EVERARREST_W1 127-128   EVERARREST_W2 129-130
        NEWARREST_W2 131-132    NEWARREST_W3 133-134    ARREST_EVENT 135-136
        TIME_TO_EVENT 137-140   CRIME_CLASS 141-142     ENTRYAGE 143-144
        TOTAL_PLACEMENTS_W1 145-146 FOSTERCARE_W1 147-148   KINCARE_W1 149-150
        GROUPCARE_W1 151-152    INDOTHCARE_W1 153-154   ILS_SUM_W1 155-161 .4
        CLOSEMOM_W1 162-163     MISSMOM 164-165         CLOSEDAD_W1 166-167
        MISSDAD 168-169         CLOSECAREGIVER_W1 170   INSCHOOL_W1 171
        COLLEGEPLANS_W1 172-173 EMPLOYED_W1 174-175     SUPPORT_W1 176-183 .4
        CWHELP_W1 184-190 .4    EMPLOYED_W2 191-192     INSCHOOL_W2 193-194
        EMPLOYED_W3 195-196     INSCHOOL_W3 197-198     ;


* SAS LABEL STATEMENT;

LABEL
   ID      = 'CASE ID OF RESPONDENT'
   WAVE1   = 'WAVE 1 DELINQUENCY RESPONDENTS. N = 730'
   WAVE2   = 'WAVE 2 DELIQUENCY RESPONDENTS. N = 574'
   WAVE3   = 'WAVE 3 DELIQUENCY RESPONDENTS. N = 504'
   GENDER  = 'GENDER'
   AGE_W1  = 'AGE AT WAVE 1'
   HISPANIC= 'HISPANIC ETHNICITY'
   WHITE   = 'WHITE RACE'
   BLACK   = 'BLACK RACE'
   OTHERRACE= 'OTHER RACE'
   STATE   = 'STATE RESIDING AT WAVE1'
   AODA_W1 = 'ANY ALCOHOL OR SUBSTANCE ABUSE DIAGNOSIS WAVE 1'
   MENTALHEALTH_W1= 'ANY MENTAL HEALTH DIAGNOSIS WAVE 1'
   CHILDREN_W1= 'DOES R HAVE ANY LIVING CHILDREN AT WAVE 1'
   ABUSESUM_W1= 'SUM OF PHYSICAL ABUSE ITEMS WAVE 1'
   NEGLECTSUM_W1= 'SUM OF NEGLECT ITEMS'
   VICTIMSEX_W1= 'VICTIM OF SEXUAL ABUSE WAVE 1'
   DEL1_W1 = 'DELIBERATELY DAMAGED PROPERTY W1'
   DEL2_W1 = 'STEAL SOMETHING WORTH LESS THAN $50 W1'
   DEL3_W1 = 'STEAL SOMETHING WORTH MORE THAN $50 W1'
   DEL4_W1 = 'GO INTO A HOUSE OR BUILDING TO STEAL SOMETHING W1'
   DEL5_W1 = 'SELL MARIJUANA OR OTHER DRUGS W1'
   DEL6_W1 = 'HURT SOMEONE BADLY ENOUGH TO NEED MEDICAL CARE W1'
   DEL7_W1 = 'USE OR THREATEN TO USE A WEAPON TO GET SOMETHING W1'
   DEL8_W1 = 'TAKE PART IN A GROUP FIGHT W1'
   DEL9_W1 = 'PULL A KNIFE OR GUN ON SOMEONE W1'
   DEL10_W1= 'SHOOT OR STABB SOMEONE W1'
   DEL1_W2 = 'DELIBERATELY DAMAGED PROPERTY W2'
   DEL2_W2 = 'STEAL SOMETHING WORTH LESS THAN $50 W2'
   DEL3_W2 = 'STEAL SOMETHING WORTH MORE THAN $50 W2'
   DEL4_W2 = 'GO INTO A HOUSE OR BUILDING TO STEAL SOMETHING W2'
   DEL5_W2 = 'SELL MARIJUANA OR OTHER DRUGS W2'
   DEL6_W2 = 'HURT SOMEONE BADLY ENOUGH TO NEED MEDICAL CARE W2'
   DEL7_W2 = 'USE OR THREATEN TO USE A WEAPON TO GET SOMETHING W2'
   DEL8_W2 = 'TAKE PART IN A GROUP FIGHT W2'
   DEL9_W2 = 'PULL A KNIFE OR GUN ON SOMEONE W2'
   DEL10_W2= 'SHOOT OR STABB SOMEONE W2'
   DEL1_W3 = 'DELIBERATELY DAMAGED PROPERTY W3'
   DEL2_W3 = 'STEAL SOMETHING WORTH LESS THAN $50 W3'
   DEL3_W3 = 'STEAL SOMETHING WORTH MORE THAN $50 W3'
   DEL4_W3 = 'GO INTO A HOUSE OR BUILDING TO STEAL SOMETHING W3'
   DEL5_W3 = 'SELL MARIJUANA OR OTHER DRUGS W3'
   DEL6_W3 = 'HURT SOMEONE BADLY ENOUGH TO NEED MEDICAL CARE W3'
   DEL7_W3 = 'USE OR THREATEN TO USE A WEAPON TO GET SOMETHING W3'
   DEL8_W3 = 'TAKE PART IN A GROUP FIGHT W3'
   DEL9_W3 = 'PULL A KNIFE OR GUN ON SOMEONE W3'
   DEL10_W3= 'SHOOT OR STABB SOMEONE W3'
   DELSUM_W1= 'NUMBER OF TOTAL DELINQUENCY ITEMS SELF REPORTWAVE 1'
   ARREST_W1= 'EVER ARRESTED AT WAVE 1 SELF REPORT'
   VIOLENT_W1= 'ANY VIOLENT OFFENSE WAVE 1'
   NONVIOLENT_W1= 'ANY NONVIOLENT OFFENSE WAVE 1'
   VIOLENT_W2= 'ANY VIOLENT OFFENSE WAVE 2'
   NONVIOLENT_W2= 'ANY NONVIOLENT OFFENSE WAVE 2'
   VIOLENT_W3= 'ANY VIOLENT OFFENSE WAVE 3'
   NONVIOLENT_3= 'ANY NONVIOLENT OFFENSE WAVE 3'
   VIOSUM_W3= 'VIOLENT OFFENSES SCALE SELF REPORT WAVE 3'
   NONVIOLSUM_W3= 'NONVIOLENT OFFENSES SCALE SELF REPORT WAVE 3'
   EVERARREST_W1= 'EVER ARRESTED SELF REPORT AT WAVE 1'
   EVERARREST_W2= 'EVER ARRESTED SELF REPORT AT WAVE 2'
   NEWARREST_W2= 'ARRESTED SELF REPORT AT WAVE 2 SINCE WAVE 1'
   NEWARREST_W3= 'ARRESTED SELF REPORT AT WAVE 3 SINCE WAVE 2'
   ARREST_EVENT= 'OFFICIAL ARREST RECORD'
   TIME_TO_EVENT= 'TIME TO EVENT (ARREST OR END OF OBSERVATION PERIOD)'
   CRIME_CLASS= 'CRIME OVER TIME LATENT CLASS ASSIGNMENT'
   ENTRYAGE= 'AGE AT FIRST ENTRY INTO FOSTER CARE'
   TOTAL_PLACEMENTS_W1= 'TOTAL NUMBER OF FOSTER CARE AND GROUP HOME PLACEMENTS AT WAVE 1'
   FOSTERCARE_W1= 'IN FOSTER CARE WAVE1'
   KINCARE_W1= 'IN KINSHIP CARE WAVE 1'
   GROUPCARE_W1= 'IN GROUP CARE WAVE 1'
   INDOTHCARE_W1= 'IN INDEPENDENT LIVING OR OTHER CARE WAVE 1'
   ILS_SUM_W1= 'SUM OF ANY ILS SERVICES WAVE 1'
   CLOSEMOM_W1= 'MATERNAL CLOSENESS SCALE WAVE 1'
   MISSMOM = 'NO MOM OR STEPMOM WAVE 1'
   CLOSEDAD_W1= 'PATERNAL CLOSENESS SCALE WAVE 1'
   MISSDAD = 'NO DAD OR STEPDAD WAVE 1'
   CLOSECAREGIVER_W1= 'CAREGIVER CLOSENESS SCALE WAVE 1'
   INSCHOOL_W1= 'IN SCHOOL WAVE 1'
   COLLEGEPLANS_W1= 'COLLEGE OR BEYOND PLANS WAVE 1'
   EMPLOYED_W1= 'CURRENTLY EMPLOYED WAVE 1'
   SUPPORT_W1= 'SCALE SCORE FOR SOCIAL SUPPORT WAVE 1'
   CWHELP_W1= 'LIKELIHOOD TO ASK THE CHILD WELFARE SYSTEM FOR HELP AFTER DISCHARGE SCALE WAVE 1'
   EMPLOYED_W2= 'CURRENTLY EMPLOYED WAVE 2'
   INSCHOOL_W2= 'IN SCHOOL WAVE 2'
   EMPLOYED_W3= 'CURRENTLY EMPLOYED WAVE 3'
   INSCHOOL_W3= 'IN SCHOOL WAVE 3'
        ;


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


* SAS FORMAT STATEMENT;

/*
  FORMAT WAVE1 wave1fff. WAVE2 wave2fff. WAVE3 wave3fff.
         GENDER gender. AGE_W1 age_w1ff. HISPANIC hispanic.
         WHITE white. BLACK black. OTHERRACE otherraf.
         STATE state. AODA_W1 aoda_w1f. MENTALHEALTH_W1 mentalhf.
         CHILDREN_W1 childref. ABUSESUM_W1 abusesuf. NEGLECTSUM_W1 neglectf.
         VICTIMSEX_W1 victimsf. DEL1_W1 del1_w1f. DEL2_W1 del2_w1f.
         DEL3_W1 del3_w1f. DEL4_W1 del4_w1f. DEL5_W1 del5_w1f.
         DEL6_W1 del6_w1f. DEL7_W1 del7_w1f. DEL8_W1 del8_w1f.
         DEL9_W1 del9_w1f. DEL10_W1 del10_wf. DEL1_W2 del1_w2f.
         DEL2_W2 del2_w2f. DEL3_W2 del3_w2f. DEL4_W2 del4_w2f.
         DEL5_W2 del5_w2f. DEL6_W2 del6_w2f. DEL7_W2 del7_w2f.
         DEL8_W2 del8_w2f. DEL9_W2 del9_w2f. DEL10_W2 del10_0f.
         DEL1_W3 del1_w3f. DEL2_W3 del2_w3f. DEL3_W3 del3_w3f.
         DEL4_W3 del4_w3f. DEL5_W3 del5_w3f. DEL6_W3 del6_w3f.
         DEL7_W3 del7_w3f. DEL8_W3 del8_w3f. DEL9_W3 del9_w3f.
         DEL10_W3 del10_1f. DELSUM_W1 delsum_f. ARREST_W1 arrest_f.
         VIOLENT_W1 violentf. NONVIOLENT_W1 nonviolf. VIOLENT_W2 violen0f.
         NONVIOLENT_W2 nonvio0f. VIOLENT_W3 violen1f. NONVIOLENT_3 nonvio1f.
         VIOSUM_W3 viosum_f. NONVIOLSUM_W3 nonvio2f. EVERARREST_W1 everarrf.
         EVERARREST_W2 everar0f. NEWARREST_W2 newarref. NEWARREST_W3 newarr0f.
         ARREST_EVENT arrest0f. TIME_TO_EVENT time_tof. CRIME_CLASS crime_cf.
         ENTRYAGE entryage. TOTAL_PLACEMENTS_W1 total_pf. FOSTERCARE_W1 fostercf.
         KINCARE_W1 kincaref. GROUPCARE_W1 groupcaf. INDOTHCARE_W1 indothcf.
         ILS_SUM_W1 ils_sumf. CLOSEMOM_W1 closemof. MISSMOM missmom.
         CLOSEDAD_W1 closedaf. MISSDAD missdad. CLOSECAREGIVER_W1 closecaf.
         INSCHOOL_W1 inschoof. COLLEGEPLANS_W1 collegef. EMPLOYED_W1 employef.
         SUPPORT_W1 supportf. CWHELP_W1 cwhelp_f. EMPLOYED_W2 employ0f.
         INSCHOOL_W2 inscho0f. EMPLOYED_W3 employ1f. INSCHOOL_W3 inscho1f.
          ;
*/

RUN ;
