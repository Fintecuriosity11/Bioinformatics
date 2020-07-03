##########################################################################################################################################

#(주의) ->  순차적으로 코드를 실행하는 것을 권함!

#에러 발생 시 github Bioinformatics/Bioinformatics with R Cookbook 경로에 issue를 남기면 확인

##########################################################################################################################################



### R에서 PubMed를 이용한 작업.

# 연구는 해당 분야의 관련 연구 조사로부터 시작되고, 주로 문헌 검색에 의해 이루어짐.

# PubMed는 이러한 문헌들을 살펴볼 수 있는 서비스를 제공.
# 이러한 서비스는 NCBI-Entrez 데이터베이스에 의해 제공되며, https://www.ncbi.nlm.nih.gov에서 이용 가능.

# 예제를 통하여 분석 자동화의 측면에서 필요할 때마다 PubMed를 방문하지 않고 R을 이용해 탐색, 저장, 마이닝, 양적연구인 메타분석을 시행.

# NCBI 데이터베이스 자료들을 분석하기 위해서 Kovalchik에 의해 만들어진 RISmed 패키지를 이용.

# PubMed 시스템에 접근하기 위해서는 인터넷 연결이 되있어야 함.


.libPaths("C://Users//yjang//R")    # 저장 디렉토리 및 lib 경로 설정.

install.packages("RISmed")          # R에 RISmed 패키지를 설치하고 불러와야 함. 

library(RISmed)                     # 

help(package="RISmed")              # 패키지에 내장된 기능은 help()함수를 사용.
 
############################################################결과값(print)#################################################################

# [Workspace loaded from ~/.RData]

# > .libPaths("C://Users//yjang//R")
# > install.packages("RISmed")
# Installing package into ‘C:/Users/yjang/R’
# (as ‘lib’ is unspecified)
# trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.0/RISmed_2.1.7.zip'
# Content type 'application/zip' length 428155 bytes (418 KB)
# downloaded 418 KB

# package ‘RISmed’ successfully unpacked and MD5 sums checked

# The downloaded binary packages are in
# C:\Users\yjang\AppData\Local\Temp\RtmpgDabmB\downloaded_packages
# > library(RISmed)
# > help(package="RISmed")


##########################################################################################################################################

# R을 이용해서 PubMed로부터 문헌을 검색하고 추출하기 위해서는 다음 과정을 차례대로 실시.




data(myeloma)                    # RISmed의 기본적인 내장 데이터인 myeloma를 불러옴. 

ls()                             # R 작업공간에서 myeloma 객체를 찾기 위해 ls() 명령어를 사용.
                                 # myeloma 외에 다른 객체들이 작업공간에 있다면 역시 같이 확인.

str(myeloma)                     # myeloma 객체의 구조적인 내용을 확인하기 위해 다음 명령어 사용.

AbstractText(myeloma)            # 데이터의 각요소를 확인.
Author(myeloma)
ArticleTitle(myeloma)
Title(myeloma)
PMID(myeloma)


cancer<-EUtilsSummary("cancer[ti", type = "esearch", db = "pubmed")   # 새로운 쿼리를 생성.
class(cancer)

# 지금까지는 패키지에 프리컴파일돼 있는 데이터를 사용. 본인의 쿼리에 맞는 새로운 객체(cancer)를 생성.
# RIDmed 클래스의 데이터를 추출하고 생성하는 함수는 위와 동일.

############################################################결과값(print)#################################################################



# > data(myeloma)                    # RISmed의 기본적인 내장 데이터인 myeloma를 불러옴.

# > ls()
# [1] "a"            "b"            "boot_obj"     "c"            "cont"         "data"         "df"           "f"            "fac"         
# [10] "fdata"        "FV"           "fx"           "fxyz"         "gauss"        "genex"        "i"            "income"       "integrand"   
# [19] "loan_data"    "loans_income" "m"            "mat"          "MFVdata"      "mtcars2"      "myeloma"      "mylist"       "nmbCol"      
# [28] "nmbRow"       "norm_samp"    "p1"           "pg"           "PSDS_PATH"    "PV"           "r"            "s1"           "samp_data"   
# [37] "samp_mean_05" "samp_mean_20" "sleep"        "stat_fun"     "T"            "test"         "tmp"          "tmp01"        "v"           
# [46] "v1"           "v2"           "vf"           "vx"           "w"            "weight.sq"    "weight.x"     "x"            "xp"          
# [55] "xv"           "y"            "yp"           "z"           

# > str(myeloma)
# Formal class 'Medline' [package "RISmed"] with 59 slots
# ..@ Query               : chr "\"multiple myeloma\"[MeSH Terms] AND 2012/05/08[EDAT] : 2013/05/08[EDAT]"
# ..@ PMID                : chr [1:10] "23648714" "23648667" "23648347" "23648290" ...
# ..@ YearReceived        : num [1:10] NA 2013 NA 2013 2013 ...
# ..@ MonthReceived       : num [1:10] NA 4 NA 4 2 NA NA 7 NA 3
# ..@ DayReceived         : num [1:10] NA 18 NA 16 3 NA NA 18 NA 4
# ..@ HourReceived        : num [1:10] NA NA NA NA NA NA NA NA NA NA
# ..@ MinuteReceived      : num [1:10] NA NA NA NA NA NA NA NA NA NA
# ..@ YearAccepted        : num [1:10] NA 2013 NA 2013 2013 ...
# ..@ MonthAccepted       : num [1:10] NA 5 NA 4 3 NA 5 3 NA 3
#..@ DayAccepted         : num [1:10] NA 1 NA 18 18 NA 1 26 NA 4
#..@ HourAccepted        : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ MinuteAccepted      : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ YearEpublish        : num [1:10] 2012 NA NA NA NA ...
#..@ MonthEpublish       : num [1:10] 3 NA NA NA NA NA NA 4 NA NA
#..@ DayEpublish         : num [1:10] 1 NA NA NA NA NA NA 30 NA NA
#..@ HourEpublish        : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ MinuteEpublish      : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ YearPpublish        : num [1:10] NA NA NA NA NA ...
#..@ MonthPpublish       : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ DayPpublish         : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ HourPpublish        : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ MinutePpublish      : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ YearPmc             : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ MonthPmc            : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ DayPmc              : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ HourPmc             : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ MinutePmc           : num [1:10] NA NA NA NA NA NA NA NA NA NA
#..@ YearPubmed          : num [1:10] 2013 2013 2013 2013 2013 ...
#..@ MonthPubmed         : num [1:10] 5 5 5 5 5 5 5 5 5 5
#..@ DayPubmed           : num [1:10] 8 8 8 8 8 8 8 7 7 7
#..@ HourPubmed          : num [1:10] 6 6 6 6 6 6 6 6 6 6
#..@ MinutePubmed        : num [1:10] 0 0 0 0 0 0 0 0 0 0
#..@ Author              :List of 10
#.. ..$ :'data.frame':	22 obs. of  4 variables:
#  .. .. ..$ LastName: chr [1:22] "Kobayashi" "Kuroda" "Fuchida" "Murakami" ...
#.. .. ..$ ForeName: chr [1:22] "Tsutomu" "Junya" "Shin-ichi" "Satoshi" ...
#.. .. ..$ Initials: chr [1:22] "T" "J" "S" "S" ...
#.. .. ..$ order   : int [1:22] 1 2 3 4 5 6 7 8 9 10 ...
#.. ..$ :'data.frame':	15 obs. of  4 variables:
#  .. .. ..$ LastName: chr [1:15] "Srivastava" "Rana" "Lacy" "Buadi" ...
#.. .. ..$ ForeName: chr [1:15] "G" "V" "M Q" "F K" ...
#.. .. ..$ Initials: chr [1:15] "G" "V" "MQ" "FK" ...
#.. .. ..$ order   : int [1:15] 1 2 3 4 5 6 7 8 9 10 ...
#.. ..$ :'data.frame':	17 obs. of  4 variables:
#  .. .. ..$ LastName: chr [1:17] "Wang" "Fu" "Wu" "Sun" ...
#.. .. ..$ ForeName: chr [1:17] "Juan" "Cheng-cheng" "De-Pei" "Ai-Ning" ...
#.. .. ..$ Initials: chr [1:17] "J" "CC" "DP" "AN" ...
#.. .. ..$ order   : int [1:17] 1 2 3 4 5 6 7 8 9 10 ...
#.. ..$ :'data.frame':	12 obs. of  4 variables:
#  .. .. ..$ LastName: chr [1:12] "Valdez" "Wang" "Murray" "Nieto" ...
#.. .. ..$ ForeName: chr [1:12] "Benigno C" "Guiyun" "David" "Yago" ...
#.. .. ..$ Initials: chr [1:12] "BC" "G" "D" "Y" ...
#.. .. ..$ order   : int [1:12] 1 2 3 4 5 6 7 8 9 10 ...
#.. ..$ :'data.frame':	15 obs. of  4 variables:
#  .. .. ..$ LastName: chr [1:15] "Gatt" "Takada" "Mani" "Lerner" ...
#.. .. ..$ ForeName: chr [1:15] "Moshe E" "Kohichi" "Mala" "Mikael" ...
#.. .. ..$ Initials: chr [1:15] "ME" "K" "M" "M" ...
#.. .. ..$ order   : int [1:15] 1 2 3 4 5 6 7 8 9 10 ...
#.. ..$ :'data.frame':	2 obs. of  4 variables:
#  .. .. ..$ LastName: chr [1:2] "Minnema" "de Keizer"
#.. .. ..$ ForeName: chr [1:2] "Monique C" "Bart"
#.. .. ..$ Initials: chr [1:2] "MC" "B"
#.. .. ..$ order   : int [1:2] 1 2
#.. ..$ :'data.frame':	10 obs. of  4 variables:
#  .. .. ..$ LastName: chr [1:10] "Greenberg" "Cousin" "Kumar" "Ketterling" ...
#.. .. ..$ ForeName: chr [1:10] "Alexandra J" "Margot" "Shaji" "Rhett P" ...
#.. .. ..$ Initials: chr [1:10] "AJ" "M" "S" "RP" ...
#.. .. ..$ order   : int [1:10] 1 2 3 4 5 6 7 8 9 10
#.. ..$ :'data.frame':	8 obs. of  4 variables:
#  .. .. ..$ LastName: chr [1:8] "Kassambara" "Schoenhals" "Moreaux" "Veyrune" ...
#.. .. ..$ ForeName: chr [1:8] "Alboukadel" "Matthieu" "Jerome" "Jean-Luc" ...
#.. .. ..$ Initials: chr [1:8] "A" "M" "J" "JL" ...
#.. .. ..$ order   : int [1:8] 1 2 3 4 5 6 7 8
#.. ..$ :'data.frame':	10 obs. of  4 variables:
#  .. .. ..$ LastName: chr [1:10] "Tovar" "de Larrea" "Arostegui" "Cibeira" ...
#.. .. ..$ ForeName: chr [1:10] "Natalia" "Carlos Fernandez" "Juan I" "Maria Teresa" ...
#.. .. ..$ Initials: chr [1:10] "N" "CF" "JI" "MT" ...
#.. .. ..$ order   : int [1:10] 1 2 3 4 5 6 7 8 9 10
#.. ..$ :'data.frame':	4 obs. of  4 variables:
#  .. .. ..$ LastName: chr [1:4] "Garfall" "Vogl" "Weiss" "Stadtmauer"
#.. .. ..$ ForeName: chr [1:4] "A L" "D T" "B M" "E A"
#.. .. ..$ Initials: chr [1:4] "AL" "DT" "BM" "EA"
#.. .. ..$ order   : int [1:4] 1 2 3 4
#..@ ISSN                : chr [1:10] "1349-7235" "1476-5551" "0376-2491" "1873-2399" ...
#..@ Title               : chr [1:10] "Internal medicine (Tokyo, Japan)" "Leukemia" "Zhonghua yi xue za zhi" "Experimental hematology" ...
#..@ ArticleTitle        : chr [1:10] "The response to second-line induction with bortezomib and dexamethasone is predictive of long-term outcomes pri"| __truncated__ "Long-term outcome with lenalidomide and dexamethasone therapy for newly diagnosed multiple myeloma." "[Retrospective analysis on therapeutic effect of autologous hematopoietic stem cell transplantation in multiple"| __truncated__ "Mechanistic studies on the synergistic cytotoxicity of the nucleoside analogs gemcitabine and clofarabine in mu"| __truncated__ ...
#..@ ELocationID         : chr [1:10] NA "10.1038/leu.2013.143" NA "10.1016/j.exphem.2013.04.009" ...
#..@ AbstractText        : chr [1:10] "OBJECTIVE: We retrospectively investigated the efficacy and predictive factors for the treatment outcomes of bo"| __truncated__ "The combination of lenalidomide and dexamethasone (Len-Dex) is a commonly used initial therapy for newly diagno"| __truncated__ "OBJECTIVE: To evaluate the efficacy and prognostic factors of autologous hematopoietic stem cell transplantatio"| __truncated__ "Hematopoietic stem cell transplantation (HSCT) is an established treatment for multiple myeloma (MM), a plasma "| __truncated__ ...
#..@ Affiliation         : chr [1:10] "Division of Hematology and Oncology, Department of Medicine, Kyoto Prefectural University of Medicine, Japan. t"| __truncated__ "Division of Hematology and Blood and Marrow Transplant, Department of Medicine, Mayo Clinic, Rochester, MN, USA." "Jiangsu Institute of Hematology, First Affiliated Hospital, Soochow University, Key Lab of Thrombosis &amp; Hem"| __truncated__ "Departments of Stem Cell Transplantation and Cellular Therapy, University of Texas MD Anderson Cancer Center, H"| __truncated__ ...
#..@ Language            : chr [1:10] "eng" "eng" "chi" "eng" ...
#..@ PublicationType     :List of 10
#.. ..$ : Named chr [1:2] "Journal Article" "Research Support, Non-U.S. Gov't"
#.. .. ..- attr(*, "names")= chr [1:2] "PublicationType" "PublicationType"
#.. ..$ : Named chr [1:3] "Journal Article" "Research Support, N.I.H., Extramural" "Research Support, Non-U.S. Gov't"
#.. .. ..- attr(*, "names")= chr [1:3] "PublicationType" "PublicationType" "PublicationType"
#.. ..$ : Named chr [1:3] "English Abstract" "Journal Article" "Research Support, Non-U.S. Gov't"
#.. .. ..- attr(*, "names")= chr [1:3] "PublicationType" "PublicationType" "PublicationType"
#.. ..$ : Named chr [1:3] "Journal Article" "Research Support, N.I.H., Extramural" "Research Support, Non-U.S. Gov't"
#.. .. ..- attr(*, "names")= chr [1:3] "PublicationType" "PublicationType" "PublicationType"
#.. ..$ : Named chr [1:3] "Journal Article" "Research Support, N.I.H., Extramural" "Research Support, Non-U.S. Gov't"
#.. .. ..- attr(*, "names")= chr [1:3] "PublicationType" "PublicationType" "PublicationType"
#.. ..$ : Named chr [1:2] "Case Reports" "Journal Article"
#.. .. ..- attr(*, "names")= chr [1:2] "PublicationType" "PublicationType"
#.. ..$ : Named chr [1:2] "Journal Article" "Research Support, N.I.H., Extramural"
#.. .. ..- attr(*, "names")= chr [1:2] "PublicationType" "PublicationType"
#.. ..$ : Named chr [1:2] "Journal Article" "Research Support, Non-U.S. Gov't"
#.. .. ..- attr(*, "names")= chr [1:2] "PublicationType" "PublicationType"
#.. ..$ : Named chr [1:2] "Journal Article" "Research Support, Non-U.S. Gov't"
#.. .. ..- attr(*, "names")= chr [1:2] "PublicationType" "PublicationType"
#.. ..$ : Named chr [1:2] "Journal Article" "Review"
#.. .. ..- attr(*, "names")= chr [1:2] "PublicationType" "PublicationType"
#..@ MedlineTA           : chr [1:10] "Intern Med" "Leukemia" "Zhonghua Yi Xue Za Zhi" "Exp Hematol" ...
#..@ NlmUniqueID         : chr [1:10] "9204241" "8704895" "7511141" "0402313" ...
#..@ ISSNLinking         : chr [1:10] "0918-2918" "0887-6924" "0376-2491" "0301-472X" ...
#..@ PublicationStatus   : chr [1:10] "ppublish" "ppublish" "ppublish" "ppublish" ...
#..@ ArticleId           : chr [1:10] "DN/JST.JSTAGE/internalmedicine/52.9385" "leu2013143" "23648347" "S0301-472X(13)00201-4" ...
#..@ Volume              : chr [1:10] "52" "27" "93" "41" ...
#..@ Issue               : chr [1:10] "9" "10" "2" "8" ...
#..@ ISOAbbreviation     : chr [1:10] "Intern. Med." "Leukemia" "Zhonghua Yi Xue Za Zhi" "Exp. Hematol." ...
#..@ MedlinePgn          : chr [1:10] "961-8" "2062-6" "114-8" "719-30" ...
#..@ CopyrightInformation: chr [1:10] NA NA NA "Published by Elsevier Inc." ...
#..@ Country             : chr [1:10] "Japan" "United States" "China" "United States" ...
#..@ GrantID             : chr [1:10] NA "CA 107476" NA "CA 16672" ...
#..@ Acronym             : chr [1:10] NA "CA" NA "CA" ...
#..@ Agency              : chr [1:10] NA "NCI NIH HHS" NA "NCI NIH HHS" ...
#..@ RegistryNumber      : chr [1:10] "0" "4Z8R6ORS6L" NA "0" ...
#..@ RefSource           : chr [1:10] NA "Lancet Oncol. 2010 Jan;11(1):29-37" NA "J Exp Med. 1995 Nov 1;182(5):1545-56" ...
#..@ CollectiveName      : chr [1:10] NA NA NA NA ...
#..@ Mesh                :List of 10
#.. ..$ :'data.frame':	47 obs. of  2 variables:
#  .. .. ..$ Heading: Factor w/ 36 levels "administration &amp; dosage",..: 2 4 5 1 3 33 6 1 3 8 ...
#.. .. ..$ Type   : Factor w/ 2 levels "Descriptor","Qualifier": 1 1 1 2 2 2 1 2 2 1 ...
#.. ..$ :'data.frame':	21 obs. of  2 variables:
#  .. .. ..$ Heading: Factor w/ 21 levels "administration &amp; dosage",..: 2 3 4 5 21 6 1 9 10 11 ...
#.. .. ..$ Type   : Factor w/ 2 levels "Descriptor","Qualifier": 1 1 1 1 2 1 2 1 1 1 ...
#.. ..$ :'data.frame':	12 obs. of  2 variables:
#  .. .. ..$ Heading: Factor w/ 12 levels "diagnosis","Female",..: 2 3 4 5 6 7 1 10 8 9 ...
#.. .. ..$ Type   : Factor w/ 2 levels "Descriptor","Qualifier": 1 1 1 1 1 1 2 2 1 1 ...
#.. ..$ :'data.frame':	27 obs. of  2 variables:
#  .. .. ..$ Heading: Factor w/ 25 levels "Adenine Nucleotides",..: 1 2 4 19 24 5 2 6 7 9 ...
#.. .. ..$ Type   : Factor w/ 2 levels "Descriptor","Qualifier": 1 2 1 2 2 1 2 1 1 1 ...
#.. ..$ :'data.frame':	31 obs. of  2 variables:
#  .. .. ..$ Heading: Factor w/ 21 levels "antagonists &amp; inhibitors",..: 2 14 4 14 5 14 6 7 14 8 ...
#.. .. ..$ Type   : Factor w/ 2 levels "Descriptor","Qualifier": 1 2 1 2 1 2 1 1 2 1 ...
#.. ..$ :'data.frame':	17 obs. of  2 variables:
#  .. .. ..$ Heading: Factor w/ 14 levels "Aged","Biopsy",..: 1 2 3 9 11 12 5 4 6 7 ...
#.. .. ..$ Type   : Factor w/ 2 levels "Descriptor","Qualifier": 1 1 1 2 2 2 1 2 1 1 ...
#.. ..$ :'data.frame':	9 obs. of  2 variables:
#  .. .. ..$ Heading: Factor w/ 9 levels "Chromosome Aberrations",..: 1 3 4 6 7 8 2 5 9
#.. .. ..$ Type   : Factor w/ 2 levels "Descriptor","Qualifier": 1 1 1 1 1 1 2 2 1
#.. ..$ :'data.frame':	36 obs. of  2 variables:
#  .. .. ..$ Heading: Factor w/ 27 levels "Apoptosis","Bone Marrow Cells",..: 1 12 2 15 20 3 12 4 12 5 ...
#.. .. ..$ Type   : Factor w/ 2 levels "Descriptor","Qualifier": 1 2 1 2 2 1 2 1 2 1 ...
#.. ..$ :'data.frame':	23 obs. of  2 variables:
#  .. .. ..$ Heading: Factor w/ 20 levels "Adult","Aged",..: 1 2 4 5 6 20 7 8 9 10 ...
#.. .. ..$ Type   : Factor w/ 2 levels "Descriptor","Qualifier": 1 1 1 1 1 2 1 1 2 1 ...
#.. ..$ :'data.frame':	10 obs. of  2 variables:
#  .. .. ..$ Heading: Factor w/ 9 levels "Hematopoietic Stem Cell Transplantation",..: 1 5 2 4 5 6 3 9 7 8
#.. .. ..$ Type   : Factor w/ 2 levels "Descriptor","Qualifier": 1 2 1 1 2 1 2 2 1 1

#> 

#    > AbstractText(myeloma)
#[1] "OBJECTIVE: We retrospectively investigated the efficacy and predictive factors for the treatment outcomes of bortezomib plus dexamethasone (BD) as second-line induction therapy prior to high-dose chemotherapy supported by autologous stem cell transplantation (HDT/ASCT) in multiple myeloma (MM) patients.METHODS: Sixty-six transplant eligible MM patients treated by the Kyoto Clinical Hematology Study Group between 2006 and 2011 were investigated. Conventional induction chemotherapy, including vincristine, doxorubicin and dexamethasone (VAD) and high-dose dexamethasone (HDD), was used as first-line induction therapy in all patients, seven (10.6%) of whom attained a very good partial response (VGPR). Of the 59 patients who did not attain VGPR with VAD or HDD, 33 were given BD as second-line induction therapy prior to HDT/ASCT.RESULTS: Patients not treated with BD induction showed an overall response rate (ORR, i.e., better than partial response) of 85.3% after induction therapy, while the ORR of patients treated with BD induction improved from 42.4% after conventional induction therapy to 84.8% after BD. The overall survival (OS) and progression-free survival (PFS) of patients not treated with BD induction were not significantly influenced by the response to induction therapy. Among the patients treated with BD, failure in attaining VGPR prior to ASCT was associated with a significantly shorter PFS and it also tended to show a shorter OS, while the disease stage and achievement of a complete response after HDT/ASCT had no impact on OS or PFS.CONCLUSION: The achievement of at least VGPR with second-line BD induction therapy is a prerequisite for attaining longer OS and PFS after HDT/ASCT."                                              
#[2] "The combination of lenalidomide and dexamethasone (Len-Dex) is a commonly used initial therapy for newly diagnosed multiple myeloma (MM). Although the initial response rates and toxicity are well known, long-term outcome is not well described. We studied 286 consecutive patients with newly diagnosed MM initially treated with Len-Dex. The median (range) age at diagnosis was 63 (28-92) years, 166 (58%) patients ≤ 65 years and 175 (61%) male. The median estimated duration on Len-Dex was 5.3 months with overall response (≥ partial response) of 72%, including 26% with very good partial response or better. The median overall survival (OS) from the diagnosis was not reached (NR) and the estimated 5-year survival was 71%. The median time to first disease progression, irrespective of transplant status, was 30.2 months. Overall, 143 (50%) patients underwent stem cell transplant. The median OS was NR for patients ≤ 70 years and 5.8 years for the older patients (P=0.01). The 5-year OS estimate for patients in International Staging System stage 1, 2 and 3 were 82, 65, and 44% respectively. There were 21 new second malignancies after MM diagnosis (6.6%). The median survival exceeding 7 years reflects the efficacy of novel agents. The risk of second malignancies doesn't appear to be excessive in this population."                                                                                                                                                                                                                                                                                                                                                                                                                                                     
#[3] "OBJECTIVE: To evaluate the efficacy and prognostic factors of autologous hematopoietic stem cell transplantation (ASCT) in multiple myeloma (MM) patients.METHODS: Retrospective analysis was performed in 27 MM patients undergoing ASCT at our hospital from May 2004 to August 2011. After comparing with 28 patients achieving very good partial response (VGPR) or better outcome and not undergoing ASCT, the impact on the extent of response, progression-free survival (PFS) and overall survival (OS) as well as related prognostic factors of MM patients were analyzed.RESULTS: All patients successfully underwent hematopoietic reconstruction without transplantation-related mortality. The complete remission (CR) rate of ASCT group increased from 25.9% (7/27) at pre-ASCT to 70.4% (19/27) at post-ASCT (P &lt; 0.01). The estimated 5-year rate of progression-free survival was 56.2% (median not reached) in the ASCT group and 24.9% (median 29 months) in the non-ASCT group (P &lt; 0.05). The 5-year probability of overall survival was 52.2% (median not reached) in the ASCT group and 33.1% (median 60 months) in the non-ASCT group (P &gt; 0.05). Univariate analysis in ASCT group demonstrated that maintenance/consolidation therapy was associated with PFS (P = 0.010) and OS (P = 0.008).Patients on induction therapy containing bortezomib and early ASCT maintenance therapy all survived without disease progression until final follow-up (P = 0.010).CONCLUSIONS: ASCT can further increase the CR rate, prolong PFS and probably OS. The incorporation of novel agents into induction, consolidation and maintenance phases has optimized the anti-myeloma activity of ASCT and may be important for improved long-term outcomes."                                              
#[4] "Hematopoietic stem cell transplantation (HSCT) is an established treatment for multiple myeloma (MM), a plasma cell malignancy. To identify an improved pretransplant conditioning regimen, we investigated the cytotoxicity of gemcitabine (Gem) and clofarabine (Clo) combinations toward MM cell lines and patient cell samples. A strong synergism of the two nucleoside analogs, when combined at their approximate IC10 concentrations, was observed. This synergism could be partly due to the observed Gem-mediated phosphorylation and activation of deoxycytidine kinase, resulting in enhanced phosphorylation of Gem and Clo. Their cytotoxicity correlated with a robust activation of the DNA damage response pathway. [Gem+Clo] decreased the mitochondrial membrane potential with a concomitant release of proapoptotic factors into the cytoplasm and nucleus and the activation of apoptosis. Exposure of MM cells to [Gem+Clo] also decreased the level of ribosomal RNA (rRNA), which might have resulted in nucleolar stress, as reported previously, and caused a p53-dependent cell death. A reduction by approximately 50% in the cytotoxicity of Gem and Clo was observed in the presence of pifithrin α, a p53 inhibitor. Furthermore, MM cell lines with mutant p53 exhibited greater resistance to Gem and Clo, supporting a role for the p53 protein in these cytotoxic responses. Our results provide a rationale for clinical trials incorporating [Gem+Clo] combinations as part of conditioning therapy for high-risk patients with MM undergoing HSCT."                                                                                                                                                                                                                                    
#[5] "Multiple myeloma (MM) is an incurable neoplasm caused by proliferation of malignant plasma cells in the bone marrow (BM). MM is characterized frequently by a complete or partial deletion of chromosome 13q14, seen in more than 50% of patients at diagnosis. Within this deleted region the tripartite motif containing 13 (TRIM13, also termed RFP2) gene product has been proposed to be a tumour suppressor gene (TSG). Here, we show that low expression levels of TRIM13 in MM are associated with chromosome 13q deletion and poor clinical outcome. We present a functional analysis of TRIM13 using a loss-of-function approach, and demonstrate that TRIM13 downregulation decreases tumour cell survival as well as cell cycle progression and proliferation of MM cells. In addition, we provide evidence for the involvement of TRIM13 downregulation in inhibiting the NF kappa B pathway and the activity of the 20S proteasome. Although this data does not support a role of TRIM13 as a TSG, it substantiates important roles of TRIM13 in MM tumour survival and proliferation, underscoring its potential role as a novel target for therapeutic intervention."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
#[6] ""                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
#[7] "We previously reported an increased risk of monoclonal gammopathy of undetermined significance (MGUS) in first-degree relatives of MGUS and multiple myeloma patients. Here, we examine whether primary cytogenetic categories of myeloma differ between patients with and without a family history of MGUS or myeloma. We studied 201 myeloma patients with available data on family history and molecular cytogenetic classification. Myeloma with trisomies was more common in probands who had an affected first-degree relative with MGUS or myeloma compared with those without a family history (46.9% vs. 33.5%, P = 0.125); however, the difference was not statistically significant. Additional studies on the cytogenetic types of myeloma associated with familial tendency are needed."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
#[8] "High throughput DNA microarray has made it possible to outline genes whose expression in malignant plasma cells is associated with short overall survival of patients with Multiple Myeloma (MM). A further step is to elucidate the mechanisms encoded by these genes yielding to drug resistance and/or patients' short survival. We focus here on the biological role of the DEP (for Disheveled, EGL-10, Pleckstrin) domain contained protein 1A (DEPDC1A), a poorly known protein encoded by DEPDC1A gene, whose high expression in malignant plasma cells is associated with short survival of patients. Using conditional lentiviral vector delivery of DEPDC1A shRNA, we report that DEPDC1A knockdown delayed the growth of human myeloma cell lines (HMCLs), with a block in G2 phase of the cell cycle, p53 phosphorylation and stabilization, and p21(Cip1) accumulation. DEPDC1A knockdown also resulted in increased expression of mature plasma cell markers, including CXCR4, IL6-R and CD38. Thus DEPDC1A could contribute to the plasmablast features of MMCs found in some patients with adverse prognosis, blocking the differentiation of malignant plasma cells and promoting cell cycle."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
#[9] "The emergence of an oligoclonal humoral response, resulting in the appearance of a different serum M-protein to that observed at diagnosis is a well-recognized event after autologous stem cell transplantation in multiple myeloma in complete response, and it has been considered to be a benign phenomenon. The aim of the present study was to investigate the incidence, biological characteristics and prognostic value of the oligoclonal bands in patients with myeloma who underwent autologous transplantation at our institution in the last 18 years. We proceed with a retrospective systematic review of all serum and urine immunofixation studies performed in the 211 patients with multiple myeloma who underwent melphalan-based autologous transplantation. Oligoclonal bands were observed in 34% of the patients, with a significantly higher prevalence with the use of novel agents versus conventional chemotherapy in induction (63% vs. 22%; P=0.0001). The incidence of oligoclonal bands was most frequent in non-IgG isotype, particularly in light chain only myeloma. The oligoclonal phenomenon was almost exclusive to patients in complete remission compared to other degrees of response (87% vs. 13%; P=0.0001), and lasted for a median of 1.35 years, persisting during follow up in all patients except in those who relapsed. In prognostic terms, the presence of oligoclonality resulted in a significantly longer progression-free and overall survival. Patients with oligoclonal humoral response lasting for more than one year after transplantation had a significantly longer clinical progression-free and overall survival than those with shorter duration (P=0.008 and P=0.0001, respectively), likely reflecting the importance of a robust humoral immune response."
#[10] "Allogeneic hematopoietic cell transplantation for plasma cell myeloma can lead to graft-vs-myeloma immunity and long-term survivorship, but limited efficacy and associated toxicities have prevented its widespread use. Cellular immunotherapies seek to induce more specific, reliable and potent antimyeloma immune responses with less treatment-related risk than is possible with allogeneic transplantation. Strategies under development include infusion of vaccine-primed and ex vivo expanded/costimulated autologous T cells after high-dose melphalan, genetic engineering of autologous T cells with receptors for myeloma-specific epitopes, administration of DC/plasma cell fusions and administration expanded marrow-infiltrating lymphocytes. In addition, novel immunomodulatory drugs such as inhibitors of the programmed death-1 T cell regulatory pathway may synergize with cellular immunotherapies."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

# > Author(myeloma)

#[[1]]
# LastName   ForeName Initials order
#1    Kobayashi    Tsutomu        T     1
#2       Kuroda      Junya        J     2
#3      Fuchida  Shin-ichi        S     3
#4     Murakami    Satoshi        S     4
#5      Hatsuse     Mayumi        M     5
#6        Okano      Akira        A     6
#7         Iwai    Toshiki        T     7
#8     Tsutsumi   Yasuhiko        Y     8
#9    Kamitsuji       Yuri        Y     9
#10      Akaogi    Teruaki        T    10
#11 Kawata-Iida        Eri        E    11
#12     Shimizu    Daisuke        D    12
#13    Uchiyama     Hitoji        H    13
#14   Matsumoto     Yosuke        Y    14
#15     Horiike     Shigeo        S    15
#16       Nakao Mitsushige        M    16
#17   Takahashi    Ryoichi        R    17
#18      Kaneko     Hiroto        H    18
#19     Uoshima   Nobuhiko        N    19
#20   Kobayashi     Yutaka        Y    20
#21   Shimazaki    Chihiro        C    21
#22    Taniwaki   Masafumi        M    22

#[[2]]
#LastName ForeName Initials order
#1   Srivastava        G        G     1
#2         Rana        V        V     2
#3         Lacy      M Q       MQ     3
#4        Buadi      F K       FK     4
#5       Hayman      S R       SR     5
#6  Dispenzieri        A        A     6
#7        Gertz      M A       MA     7
#8       Dingli        D        D     8
#9   Zeldenrust        S        S     9
#10     Russell        S        S    10
#11     McCurdy        A        A    11
#12      Kapoor        P        P    12
#13        Kyle        R        R    13
#14    Rajkumar      S V       SV    14
#15       Kumar        S        S    15

#[[3]]
#LastName    ForeName Initials order
#1      Wang        Juan        J     1
#2        Fu Cheng-cheng       CC     2
#3        Wu      De-Pei       DP     3
#4       Sun     Ai-Ning       AN     4
#5       Xue    Sheng-li       SL     5
#6       Xin         Xue        X     6
#7        Hu    Xiao-hui       XH     7
#8      Wang        Ying        Y     8
#9       Qiu    Hui-Ying       HY     9
#10      Jin  Zheng-ming       ZM    10
#11     Miao        Miao        M    11
#12     Tang    Xiao-wen       XW    12
#13      Han         Yue        Y    13
#14       Ma        Xiao        X    14
#15       He Guang-sheng       GS    15
#16    Chang    Wei-rong       WR    16
#17     Chen     Su-ning       SN    17

#[[4]]
#LastName   ForeName Initials order
#1     Valdez  Benigno C       BC     1
#2       Wang     Guiyun        G     2
#3     Murray      David        D     3
#4      Nieto       Yago        Y     4
#5         Li       Yang        Y     5
#6       Shah      Jatin        J     6
#7   Turturro  Francesco        F     7
#8       Wang    Michael        M     8
#9      Weber    Donna M       DM     9
#10  Champlin  Richard E       RE    10
#11 Qazilbash Muzaffar H       MH    11
#12 Andersson    Borje S       BS    12

#[[5]]
#LastName  ForeName Initials order
#1         Gatt   Moshe E       ME     1
#2       Takada   Kohichi        K     2
#3         Mani      Mala        M     3
#4       Lerner    Mikael        M     4
#5         Pick  Marjorie        M     5
#6    Hideshima      Teru        T     6
#7     Carrasco  Daniel E       DE     7
#8   Protopopov    Alexei        A     8
#9      Ivanova     Elena        E     9
#10    Sangfelt      Olle        O    10
#11     Grander       Dan        D    11
#12    Barlogie      Bart        B    12
#13 Shaughnessy    John D       JD    13
#14    Anderson Kenneth C       KC    14
#15    Carrasco  Daniel R       DR    15

#[[6]]
#LastName  ForeName Initials order
#1   Minnema Monique C       MC     1
#2 de Keizer      Bart        B     2

#[[7]]
#LastName    ForeName Initials order
#1   Greenberg Alexandra J       AJ     1
#2      Cousin      Margot        M     2
#3       Kumar       Shaji        S     3
#4  Ketterling     Rhett P       RP     4
#5     Knudson      Ryan A       RA     5
#6      Larson        Dirk        D     6
#7       Colby       Colin        C     7
#8       Scott Christopher        C     8
#9      Vachon    Celine M       CM     9
#10   Rajkumar   S Vincent       SV    10

#[[8]]
#LastName   ForeName Initials order
#1  Kassambara Alboukadel        A     1
#2  Schoenhals   Matthieu        M     2
#3     Moreaux     Jerome        J     3
#4     Veyrune   Jean-Luc       JL     4
#5        Reme    Thierry        T     5
#6 Goldschmidt    Hartmut        H     6
#7        Hose       Dirk        D     7
#8       Klein    Bernard        B     8

#[[9]]
#LastName         ForeName Initials order
#1      Tovar          Natalia        N     1
#2  de Larrea Carlos Fernandez       CF     2
#3  Arostegui           Juan I       JI     3
#4    Cibeira     Maria Teresa       MT     4
#5    Rosinol            Laura        L     5
#6     Rovira       Montserrat        M     6
#7      Elena       Montserrat        M     7
#8    Filella           Xavier        X     8
#9      Yague            Jordi        J     9
#10     Blade             Joan        J    10

#[[10]]
#LastName ForeName Initials order
#1    Garfall      A L       AL     1
#2       Vogl      D T       DT     2
#3      Weiss      B M       BM     3
#4 Stadtmauer      E A       EA     4

# > ArticleTitle(myeloma)
#[1] "The response to second-line induction with bortezomib and dexamethasone is predictive of long-term outcomes prior to high-dose chemotherapy with autologous stem cell transplantation for multiple myeloma."
#[2] "Long-term outcome with lenalidomide and dexamethasone therapy for newly diagnosed multiple myeloma."                                                                                                        
#[3] "[Retrospective analysis on therapeutic effect of autologous hematopoietic stem cell transplantation in multiple myeloma patients]."                                                                         
#[4] "Mechanistic studies on the synergistic cytotoxicity of the nucleoside analogs gemcitabine and clofarabine in multiple myeloma: relevance of p53 and its clinical implications."                             
# [5] "TRIM13 (RFP2) downregulation decreases tumour cell growth in multiple myeloma through inhibition of NF Kappa B pathway and proteasome activity."                                                            
#[6] "False-positive PET scan after bone marrow biopsy."                                                                                                                                                          
#[7] "Differences in the distribution of cytogenetic subtypes between multiple myeloma patients with and without a family history of monoclonal gammopathy and multiple myeloma."                                 
#[8] "Inhibition of DEPDC1A, a bad prognostic marker in multiple myeloma, delays growth and induces mature plasma cell markers in malignant plasma cells."                                                        
#[9] "Natural history and prognostic impact of oligoclonal humoral response in patients with multiple myeloma after autologous stem cell transplantation: long-term results from a single institution."           
#[10] "Cellular immunotherapy for plasma cell myeloma."                                                                                                                                                            

# > Title(myeloma)
#[1] "Internal medicine (Tokyo, Japan)" "Leukemia"                         "Zhonghua yi xue za zhi"           "Experimental hematology"         
#[5] "British journal of haematology"   "British journal of haematology"   "European journal of haematology"  "PloS one"                        
#[9] "Haematologica"                    "Bone marrow transplantation"     

# > PMID(myeloma)
# [1] "23648714" "23648667" "23648347" "23648290" "23647456" "23647318" "23647020" "23646139" "23645688" "23645169"

# > cancer<-EUtilsSummary("cancer[ti", type = "esearch", db = "pubmed")   # 새로운 쿼리를 생성.

# > class(cancer)
# [1] "EUtilsSummary"
# attr(,"package")
#[1] "RISmed"


##########################################################################################################################################