##########################################################################################################################################

#(주의) ->  순차적으로 코드를 실행하는 것을 권함!

#에러 발생 시 github Bioinformatics/Bioinformatics with R Cookbook 경로에 issue를 남기면 확인

##########################################################################################################################################



### Bioconductor 패키지 설치

##########################################################################################################################################


.libPaths("C://Users//yjang//R")                       # 저장 디렉토리 및 lib 경로 설정.

# source("http://bioconductor.org/biocLite.R")         # 3.5거나 보다 높은 버젼이면 실행이 불가.
# blocLite("biomaRt")                  

#  Error: With R version 3.5 or greater, install Bioconductor packages using BiocManager; see https://bioconductor.org/install

if (!requireNamespace("BiocManager", quietly = TRUE))  # 4.0 버젼이었을때 패키지를 까는 법.
  install.packages("BiocManager")

BiocManager::install("biomaRt")

library(RISmed)

library(biomaRt)                                                             # biomaRt 라이브러리 Load 



#***************************************************************************************************************************************#

# **** 여기서 부터****


if (!requireNamespace("BiocManager", quietly = TRUE))             # R 4.0 버젼 기준 설치.
  install.packages("BiocManager")
BiocManager::install()

BiocManager::install(c("GenomicFeatures", "AnnotationDbi"))       # GenomicFeatures, AnnotationDbi 특정 라이브러리 설치.

BiocManager::install(c("IRanges", type = "source"))               # 소스로부터 패키지 설치.

BiocManager::available()                                          # Bioconductor 패키지 찾는 기능.



############################################################결과값(print)#################################################################

# [Workspace loaded from ~/.RData]

# 차례대로 설치 요망.

##########################################################################################################################################


