* Encoding: UTF-8.

*Data & Intstructions to create the intergrated values survey can be found here: https://www.worldvaluessurvey.org/WVSEVStrend.jsp.
*Once IVS data has been created, load into SPSS and run the following syntax*. 

*###REGIONS'###* 
    
    *This is based from the World Bank's 7 Region Scale, Plus the following additions: 
            UK as an independent region 
            Austraila and New Zealand Seperated From East Asia and Pacific 
            Post Soviet States seperated from Europe
            China seperated from East Asia - MACAU removed as outlier
    
*Counties Included*

*Australia and New Zealand*
900	Australia
920	New Zealand
*
China
*
710	China
*
East Asia and Pacific
713	Taiwan ROC
714	Hong Kong SAR
732	South Korea
740	Japan
*
Europe
290	Poland
310	Hungary
316	Czech Republic
317	Slovakia
339	Albania
341	Montenegro
343	Macedonia
344	Croatia
345	Yugoslavia
346	Bosnia and Herzegovina
347	Kosovo
348	Serbia
349	Slovenia
355	Bulgaria
360	Romania
205	Ireland
210	Netherlands
211	Belgium
212	Luxembourg
220	France
225	Switzerland
230	Spain
232	Andorra
235	Portugal
255	Germany
260	German Federal Republic
305	Austria
325	Italy
338	Malta
350	Greece
352	Cyprus
353	Northern Cyprus
375	Finland
380	Sweden
385	Norway
390	Denmark
395	Iceland
*    
Latin America and the Caribbean
6	Puerto Rico
41	Haiti
42	Dominican Republic
52	Trinidad and Tobago
70	Mexico
90	Guatemala
92	El Salvador
93	Nicaragua
100	Colombia
101	Venezuela
130	Ecuador
135	Peru
140	Brazil
145	Bolivia
155	Chile
160	Argentina
165	Uruguay
*
Middle East and North Africa 
600	Morocco
615	Algeria
616	Tunisia
620	Libya
630	Iran
640	Turkey
645	Iraq
651	Egypt
660	Lebanon
663	Jordan
666	Israel
667	Palestine
670	Saudi Arabia
679	Yemen
690	Kuwait
694	Qatar
*
North America 
2	United States
20	Canada
*
Former Soviet Republics
359	Moldova
702	Tajikistan
703	Kyrgyzstan
704	Uzbekistan
705	Kazakhstan
365	Russia
366	Estonia
367	Latvia
368	Lithuania
369	Ukraine
370	Belarus
371	Armenia
372	Georgia
373	Azerbaijan
*
South Asia 
750	India
770	Pakistan
771	Bangladesh
775	Myanmar
800	Thailand
816	Vietnam
820	Malaysia
830	Singapore
840	Philippines
850	Indonesia
*
Sub-Saharan Africa 
432	Mali
439	Burkina Faso
452	Ghana
475	Nigeria
500	Uganda
510	Tanzania
517	Rwanda
530	Ethiopia
551	Zambia
552	Zimbabwe
560	South Africa
*  
United Kingdom
200	United Kingdom
201	Great Britain
202	Northern Ireland
*
SYSMIS
446	Macau SAR

RECODE
COW_NUM 
(900=1) (920=1)
(710=2)
(713=3) (714=3) (732=3) (740=3)
(205=4) (210=4) (211=4) (212=4) (220=4) (225=4) (230=4) (232=4) (235=4) (255=4) (260=4)
(290 =4) (305=4) (310=4) (316=4) (317=4) (325=4) (338=4) (339=4) (341=4) (343=4) (344=4) (345=4) (346=4) (347=4)
(348 =4) (349=4) (350=4) (352=4) (353=4) (355=4) (360=4) (375=4) (380=4) (385=4) (390=4) (395=4)
(6=5) (41=5) (42=5) (52=5) (70=5) (90=5) (92=5) (93=5) (100=5) (101=5) (130=5)
(135 =5) (140=5) (145=5) (155=5) (160 =5) (165=5) 
(600 =6) (615=6) (616=6) (620=6) (630=6) (640=6) (645=6) (651=6)
(660=6) (663=6) (666=6) (667=6) (670=6) (679=6) (690=6) (694=6)
(2=7)(20=7)
(359=8) (702=8) (703=8) (704=8) (705=8) (365 =8) (366=8)
(367=8) (368 =8) (369 =8) (370 =8) (371=8) (372=8) (373=8) 
(750 =9) (770=9) (771 =9) (775 =9) (800=9) (816 =9) (820 =9) (830=9) (840=9) (850=9)
(432=10) (439=10) (452=10) (475=10) (500=10) (510=10) (517=10)
(530 = 10) (551=10) (552=10) (560=10)
(200=11) (201=11) (202=11) 
(446 = SYSMIS)
INTO Regions.

VALUE LABELS Regions
1  'Australia and New Zealand'
2 'China'
3  'East Asia and Pacific'
4  'Europe'
5  'Latin America and Caribbean'
6  'Middle East and North Africa'
7  'North America'
8  'Post-Soviet States'
9  'South Asia'
10  'Sub-Saharan Africa'
11  'United Kingdom'.
EXECUTE. 

FREQUENCIES Regions.
EXECUTE.

*###YEAR OF SURVEY###* 
    
RECODE S020 (-5 THRU -1 = SYSMIS) (ELSE=COPY)
    into Year. 
EXECUTE.
FREQUENCIES Year. 
EXECUTE. 

*###ABORTION###* 
    
RECODE F120 (-5 THRU -1 = SYSMIS) (1 THRU 10 = COPY) into ABORTION. 
EXECUTE. 
FREQUENCIES ABORTION.
EXECUTE. 
  
AGGREGATE 
    /break = Regions Year
    /ABORTION.AGG = mean(ABORTION). 
EXECUTE.

FREQUENCIES ABORTION.AGG.
EXECUTE.

CTABLES
  /VLABELS VARIABLES=Regions Year DISPLAY=LABEL
  /TABLE Regions BY Year > ABORTION.AGG [MEAN]
  /CATEGORIES VARIABLES=Regions ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CRITERIA CILEVEL=95.
EXECUTE. 

*###CONFIDENCE IN CHURCH###* 
    
recode E069_01 (1 = 1) (2 = 1) (3 = 0) (4 = 0) (-1 = 0) (-2 = 0) (else = SYSMIS)  
    into CONFCHURCH. 
EXECUTE. 
FREQUENCIES CONFCHURCH.
EXECUTE. 
  
AGGREGATE 
    /break = Regions Year
    /CONFCHURCH.AGG = mean(CONFCHURCH). 
EXECUTE.

FREQUENCIES CONFCHURCH.AGG.
EXECUTE.

CTABLES
  /VLABELS VARIABLES=Regions Year DISPLAY=LABEL
  /TABLE Regions BY Year > CONFCHURCH.AGG [MEAN]
  /CATEGORIES VARIABLES=Regions ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CRITERIA CILEVEL=95.
EXECUTE. 

*###CONFIDENCE IN GOVERNMENT###* 
    
recode E069_11 (1 = 1) (2 = 1) (3 = 0) (4 = 0) (-1 = 0) (-2 = 0) (else = SYSMIS)  
    into CONFGOV. 
EXECUTE. 
FREQUENCIES CONFGOV.
EXECUTE. 
  
AGGREGATE 
    /break = Regions Year
    /CONFGOV.AGG = mean(CONFGOV). 
EXECUTE.

FREQUENCIES CONFGOV.AGG.
EXECUTE.

CTABLES
  /VLABELS VARIABLES=Regions Year DISPLAY=LABEL
  /TABLE Regions BY Year > CONFGOV.AGG [MEAN]
  /CATEGORIES VARIABLES=Regions ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CRITERIA CILEVEL=95.
EXECUTE. 

*###CONFIDENCE IN JUSTICE SYSTEM###* 
    
recode E069_17 (1 = 1) (2 = 1) (3 = 0) (4 = 0) (-1 = 0) (-2 = 0) (else = SYSMIS)  
    into CONFJUSTICE. 
EXECUTE. 
FREQUENCIES CONFJUSTICE.
EXECUTE. 
  
AGGREGATE 
    /break = Regions Year
    /CONFJUSTICE.AGG = mean(CONFJUSTICE). 
EXECUTE.

FREQUENCIES CONFJUSTICE.AGG.
EXECUTE.

CTABLES
  /VLABELS VARIABLES=Regions Year DISPLAY=LABEL
  /TABLE Regions BY Year > CONFJUSTICE.AGG [MEAN]
  /CATEGORIES VARIABLES=Regions ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CRITERIA CILEVEL=95.
EXECUTE. 

*###CONFIDENCE IN POLICE###* 
    
recode E069_11 (1 = 1) (2 = 1) (3 = 0) (4 = 0) (-1 = 0) (-2 = 0) (else = SYSMIS)  
    into CONFPOLICE. 
EXECUTE. 
FREQUENCIES CONFPOLICE.
EXECUTE. 
  
AGGREGATE 
    /break = Regions Year
    /CONFPOLICE.AGG = mean(CONFPOLICE). 
EXECUTE.

FREQUENCIES CONFPOLICE.AGG.
EXECUTE.

CTABLES
  /VLABELS VARIABLES=Regions Year DISPLAY=LABEL
  /TABLE Regions BY Year > CONFPOLICE.AGG [MEAN]
  /CATEGORIES VARIABLES=Regions ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CRITERIA CILEVEL=95.
EXECUTE. 

*###EUTHANASIA###* 
    
RECODE F122 (-5 THRU -1 = SYSMIS) (1 THRU 10 = COPY) into EUTHAN. 
EXECUTE. 
FREQUENCIES EUTHAN.
EXECUTE. 
  
AGGREGATE 
    /break = Regions Year
    /EUTHAN.AGG = mean(EUTHAN). 
EXECUTE.

FREQUENCIES EUTHAN.AGG.
EXECUTE.

CTABLES
  /VLABELS VARIABLES=Regions Year DISPLAY=LABEL
  /TABLE Regions BY Year > EUTHAN.AGG [MEAN]
  /CATEGORIES VARIABLES=Regions ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CRITERIA CILEVEL=95.
EXECUTE. 

*###HOMOSEXUALITY###* 
    
RECODE F118 (-5 THRU -1 = SYSMIS) (1 THRU 10 = COPY) into HOMOSEX. 
EXECUTE. 
FREQUENCIES HOMOSEX.
EXECUTE. 
  
AGGREGATE 
    /break = Regions Year
    /HOMOSEX.AGG = mean(HOMOSEX). 
EXECUTE.

FREQUENCIES HOMOSEX.AGG.
EXECUTE.

CTABLES
  /VLABELS VARIABLES=Regions Year DISPLAY=LABEL
  /TABLE Regions BY Year > HOMOSEX.AGG [MEAN]
  /CATEGORIES VARIABLES=Regions ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CRITERIA CILEVEL=95.
EXECUTE. 

*###SIGNING A PETITION###* 

RECODE E025 (-5 THRU -1 = SYSMIS) (1 = 1) (2 THRU 3=0) into PETITION. 
EXECUTE. 
VALUE LABELS PETITION
1 'Would Sign'
0 'Would Never Sign'. 
EXECUTE.
FREQUENCIES PETITION.
EXECUTE. 
  
AGGREGATE 
    /break = Regions Year
    /PETITION.AGG = mean(PETITION). 
EXECUTE.

FREQUENCIES PETITION.AGG.
EXECUTE.

CTABLES
  /VLABELS VARIABLES=Regions Year DISPLAY=LABEL
  /TABLE Regions BY Year > PETITION.AGG [MEAN]
  /CATEGORIES VARIABLES=Regions ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CRITERIA CILEVEL=95.
EXECUTE. 

*###PRIVATESTATE###* 

RECODE E036 (-5 THRU -1 = SYSMIS) (1 THRU 10 = COPY) into PRIVATESTATE. 
EXECUTE. 
FREQUENCIES PRIVATESTATE.
EXECUTE. 
  
AGGREGATE 
    /break = Regions Year
    /PRIVATESTATE.AGG = mean(PRIVATESTATE). 
EXECUTE.

FREQUENCIES PRIVATESTATE.AGG.
EXECUTE.

CTABLES
  /VLABELS VARIABLES=Regions Year DISPLAY=LABEL
  /TABLE Regions BY Year > PRIVATESTATE.AGG [MEAN]
  /CATEGORIES VARIABLES=Regions ORDER=A KEY=VALUE EMPTY=INCLUDE
  /CATEGORIES VARIABLES=Year ORDER=A KEY=VALUE EMPTY=EXCLUDE
  /CRITERIA CILEVEL=95.
EXECUTE. 

