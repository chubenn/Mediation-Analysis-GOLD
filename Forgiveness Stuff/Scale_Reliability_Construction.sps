*****************************************************************
Syntax for Scale Reliability and Composite Computation
If something is messed up, you may blame Edwin :)
Enjoy
*****************************************************************

*************************
SCALE RELIABILITY
Gold Scale TIME 1
*************************

RELIABILITY
  /VARIABLES=A_C01 A_C03 A_C08 A_C21 A_C24
  /SCALE('Stability 1') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=A_C02 A_C07 A_C12Y A_C16 A_C20
  /SCALE('Remorse1') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=A_C04Y A_C05 A_C06 A_C18
  /SCALE('Forgiveness1 no 14 esp') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=A_C09 A_C10 A_C13 A_C22 A_C14
  /SCALE('Anger1 w/14 esp') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=A_C11 A_C15 A_C17 A_C19 A_C23
  /SCALE('Empathy') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

*****************************
SCALE RELIABILITY
Gold Scale TIME 2
$$Make sure item to total correlation are all positive$$
*****************************

RELIABILITY
  /VARIABLES=B_C01 B_C03 B_C08 B_C21 B_C24
  /SCALE('Stability Time 2') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=B_Q8 B_Q22 B_Q24
  /SCALE('Stability Time 2re') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=B_C02 B_C07 B_C12Y B_C16 B_C20
  /SCALE('Remorse Time 2') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=B_C02 B_C07 B_C12Y B_C16 B_C20 B_C18
  /SCALE('Remorse w/18 Time 2') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=B_C04Y B_C05 B_C06 B_C18
  /SCALE('Forgiveness w/18 Time 2') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=B_C04Y B_C05 B_C06
  /SCALE('Forgiveness Time 2') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=B_C11 B_C15 B_C17 B_C19 B_C23
  /SCALE('Empathy Time 2') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=B_Q15 B_Q17 B_Q19 B_Q23
  /SCALE('Empathy Time 2re') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

RELIABILITY
  /VARIABLES=B_C09 B_C10 B_C13 B_C14 B_C22
  /SCALE('Anger Time 2') ALL
  /MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE
  /SUMMARY=TOTAL.

*****************************
SCALE CONSTRUCTION
Gold Scale TIME 1.
*****************************

COMPUTE A_Forgiveness1=(A_C04Y + A_C05 + A_C06 + A_C18).
EXECUTE.

COMPUTE A_Remorse1 = (A_C02 + A_C07 + A_C12Y + A_C16 + A_C20).
EXECUTE.

COMPUTE A_Empathy1 = (A_C11 + A_C15 + A_C17 + A_C19 + A_C23). 
EXECUTE.

COMPUTE A_Anger1 = (A_C09 + A_C10 + A_C13 + A_C14 + A_C22). 
EXECUTE.

COMPUTE A_Stability1 = (A_C01 + A_C03 + A_C08 + A_C21 + A_C24). 
EXECUTE.

*****************************
SCALE CONSTRUCTION
Gold Scale TIME 2.
*****************************

COMPUTE B_Forgiveness1=(A_C04Y + A_C05 + A_C06 + A_C18). 
EXECUTE. 

COMPUTE B_Remorse1=(B_C02 + B_C07 + B_C12Y + B_C16 + B_C20). 
EXECUTE. 

COMPUTE B_Empathy1=(B_C11 + B_C15 + B_C17 + B_C19 + B_C23). 
EXECUTE. 

COMPUTE B_Anger1=(B_C09 + B_C10 + B_C13 + B_C14 + B_C22). 
EXECUTE. 

COMPUTE B_Stability1=(B_C01 + B_C03 + B_C08 + B_C21 + B_C24). 
EXECUTE.

*****************************
SCALE CONSTRUCTION
EFI TIME 1.
*****************************

COMPUTE A_PositiveAffect=A_Q41 +  A_Q43 + A_Q44 + A_Q47 + A_Q51 + A_Q55 + A_Q57 + A_Q58 + A_Q59.
EXECUTE.

COMPUTE A_NegativeAffect=A_Q42 + A_Q45 + A_Q48 + A_Q50 + A_Q52 + A_Q53 + A_Q54 + 
    A_Q56 + A_Q60.
EXECUTE.

COMPUTE A_TotalAffect=A_PositiveAffect + A_NegativeAffect. 
EXECUTE.

COMPUTE A_PostiveBehavior=A_Q21 + A_Q25 + A_Q27 + A_Q28 + A_Q30 + A_Q32 + A_Q35 + A_Q37 + A_Q38 + A_Q40. 
EXECUTE.

COMPUTE A_NegativeBehavior=A_Q22 + A_Q23 + A_Q24 + A_Q26 + A_Q29 + A_Q31 + A_Q33 + A_Q34_act + A_Q36 + A_Q39. 
EXECUTE. 

COMPUTE A_TotalBehavior=A_PostiveBehavior + A_NegativeBehavior. 
EXECUTE.

COMPUTE A_PositiveCognition= A_Q4 + A_Q5 + A_Q7 + A_Q10 + A_Q11 + A_Q14_well + A_Q16 + A_Q17 + A_Q19 + A_Q20 . 
EXECUTE. 

COMPUTE A_NegativeCognition=A_Q1 + A_Q2 + A_Q3 + A_Q6 + A_Q8 + A_Q9 + A_Q12 + A_Q13 + A_Q15 + A_Q18 . 
EXECUTE. 

COMPUTE A_TotalCognition=A_PositiveCognition + A_NegativeCognition. 
EXECUTE. 

COMPUTE A_Total_EFI=A_TotalAffect+ A_TotalBehavior+A_TotalCognition.
EXECUTE. 

*****************************
SCALE CONSTRUCTION
EFI TIME 2.
*****************************

COMPUTE B_PositiveAffect=B_Q41 + B_Q43 + B_Q44 + B_Q46 + B_Q47 + B_Q51 + B_Q55 + B_Q57 + B_Q58 + B_Q59. 
EXECUTE. 

COMPUTE B_NegativeAffect=B_Q42 + B_Q45 + B_Q48 + B_Q49 + B_Q50 + B_Q52 + B_Q53 + B_Q54 + B_Q56 + B_Q60. 
EXECUTE. 

COMPUTE B_TotalAffect=B_PositiveAffect + B_NegativeAffect. 
EXECUTE.

COMPUTE B_PositiveBehavior=B_Q21 + B_Q25 + B_Q27 + B_Q28 + B_Q30 + B_Q32 + B_Q35 + B_Q37 + B_Q38 + B_Q40. 
EXECUTE. 

COMPUTE B_NegativeBehavior=B_Q22 + B_Q23 + B_Q24 + B_Q26 + B_Q29 + B_Q31 + B_Q33 + B_Q34_act + B_Q36 + B_Q39. 
EXECUTE. 

COMPUTE B_TotalBehavior=B_PositiveBehavior + B_NegativeBehavior. 
EXECUTE. 

COMPUTE B_PositiveCognition= B_Q4 + B_Q5 + B_Q7 + B_Q10 + B_Q11 + B_Q14_well + B_Q16 + B_Q17 + B_Q19 + B_Q20 . 
EXECUTE. 

COMPUTE B_NegativeCognition=B_Q1 + B_Q2 + B_Q3 + B_Q6 + B_Q8 + B_Q9 + B_Q12 + B_Q13 + B_Q15 + B_Q18. 
EXECUTE. 

COMPUTE B_TotalCognition=B_PositiveCognition + B_NegativeCognition. 
EXECUTE.

COMPUTE B_Total_EFI=B_TotalAffect+ B_TotalBehavior+B_TotalCognition.
EXECUTE. 

******************************
GROUP CONSTRUCTION.
******************************

IF  (Condition = 1 or Condition = 3) Remorse=1. 
EXECUTE. 

IF  (Condition = 2 or Condition = 4) Remorse=2. 
EXECUTE. 

IF  (Condition = 1 or Condition = 2) INNOUT=1. 
EXECUTE. 

IF  (Condition = 3 or Condition = 4) INNOUT=2. 
EXECUTE.





