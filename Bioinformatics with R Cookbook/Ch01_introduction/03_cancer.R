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

# ****위 코드는 02_PubMed R 코드, 혹시 몰라서 에러 및 헷갈릴 수도 있으니 실행 요망.****

###########################################################################################################################################

# RISmed는 Entrez 시스템으로부터 데이터를 추출하기 위해 E-utilities를 사용.

# E-utilities는 Entrez 쿼리와 데이터베이스 시스템에 대해 인터페이스를 제공.

# NCBI의 문헌 자료, 서열, 구조적 데이터 등이 모두 포함.

# **** E-utilities 기능은 아래와 같음 **** 

# URL을 통해서 쿼리를 Entrez 시스템으로 보내고 쿼리의 결과를 추출.
# 또한 C++, Python과 같은 프로그래밍 언어를 사용하고 XML로 넘겨 해석 가능.


# EUtilsSummary 함수의 첫 번째 인자는 쿼리명과 꺾쇠괄호로, 괄호 안의 문자는 쿼리며을 구분.
# ([ti]는 제목), [au]는 저자를 의미.


###########################################################################################################################################


str(cancer)                                       # cancer 객체는 count, retmax, retsart, id, querytranslation 등 5개의 슬롯으로 구성.
                                                  # 이 요소들은 cancer 객체의 subclass이다.

cancer@PMID[1:10]                                 # PMID를 확인하려면 cancer 객체의 id를 지정.

cancer@PMID

cancer.ris<-EUtilsGet(cancer, type = "efetch", db = "pubmed")   # rismed 객체를 생성한 후에 EUtilsGet 함수를 시행.
class(cancer.ris)                                               # 새로운 객체인 cancer.ris를 통해 자세한 정보확인.
class


# RISmed 패키지의 문제점은 가끔 부정확한 파싱에 의해 반환 값이 불확실할 수 있음.

############################################################결과값(print)#################################################################


# > str(cancer)
# Formal class 'EUtilsSummary' [package "RISmed"] with 6 slots
# ..@ db              : chr "pubmed"
#..@ count           : num 971051
# . .@ retmax          : num 1000
# ..@ retstart        : num 0
# ..@ PMID            : chr [1:1000] "32614566" "32614565" "32614564" "32614563" ...
# ..@ querytranslation: chr "cancer[ti]"

# > cancer@PMID[1:10]
# [1] "32614566" "32614565" "32614564" "32614563" "32614562" "32614561" "32614560" "32614559" "32615577" "32615541"
# > 


##########################################################################################################################################


