/*-------------------------------------------------------------------------*
 |                                                                         
 |            STATA SUPPLEMENTAL SYNTAX FILE FOR ICPSR 27062
 |        CRIME DURING THE TRANSITION TO ADULTHOOD: HOW YOUTH FARE
 |         AS THEY LEAVE OUT-OF-HOME CARE IN ILLINOIS, IOWA, AND
 |                          WISCONSIN, 2002-2007
 |                            (DATASET 0001: )
 |
 |
 | This Stata missing value recode program is provided for optional use with
 | the Stata system version of this data file as distributed by ICPSR.
 | The program replaces user-defined numeric missing values (e.g., -9)
 | with generic system missing "."  Note that Stata allows you to specify
 | up to 27 unique missing value codes.  Only variables with user-defined
 | missing values are included in this program.
 |
 | To apply the missing value recodes, users need to first open the
 | Stata data file on their system, apply the missing value recodes if
 | desired, then save a new copy of the data file with the missing values
 | applied.  Users are strongly advised to use a different filename when
 | saving the new file.
 |
 *------------------------------------------------------------------------*/

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


