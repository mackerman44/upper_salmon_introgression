# Lemhi River Introgression Analyses
# Created by Mike Ackerman 04/13/2017

### LOAD IDFGEN
#clearSession()
rm(list=ls())
source('C:/Users/mikea/Dropbox/R/idfgen/IDFGEN/package/main.r', chdir = TRUE)    
setwd('C:/Users/mikea/Dropbox/lemhiPahsimeroiMykissGenetics/2017/R/')

### IMPORT DATA
readInData(inputFile = 'C:/Users/mikea/Dropbox/lemhiPahsimeroiMykissGenetics/2017/R/input/LemhiPahsimeroiMykissProgeny04132017.txt',
           genotypeStartColumn = 41)
#**** 122 new populations created! ****

### Pool Necessary Collections
poolPops(c(OmyBTMB12S, OmyBTMB13S), 'OmyBTMB1213S')

### CREATE LIST OF COLLECTIONS
refCoastal <- c(OmyENIS06C_3, OmyHAYS05C)
refRedband <- c(OmyBIGC00C, OmyFILW11S, OmyLGRU15S)
lemhiWeir  <- c(OmyAGCY13S, OmyBTMB1213S, OmyBOHA12S, OmyBOHA13S, OmyCNYL12S, OmyHAYW12S, OmyHAYW13S, OmyKENY12S,
                OmyKENY13S, OmyPRAT13S, OmyWIMP12S, OmyWIMP13S)
lemhiRST   <- c(OmyHAYW10C, OmyLEMW10C, OmyLL3A13C)
qciRoving  <- c(OmyAGCY13C, OmyBSPR11C, OmyBSPR13C, OmyBTMB13C, OmyBOHA13C, OmyCNYL13C, OmyHYDN09C, OmyHYDN13C,
                OmyKENY13C, OmyLEMH10C_1, OmyLEMH13C, OmyLSPR13C, OmyWIMP13C)
pahsCoastal<- c(OmyPAHS09S, OmyPAHS10S, OmyPAHS11S_1, OmyPAHS12S_1, OmyPAHS13S_1, OmyPAHS14S_1)
pahsSteel  <- c(OmyPAHS06S, OmyPAHS09S_1, OmyPAHS10S_1, OmyPAHS11S, OmyPAHS12S, OmyPAHS13S, OmyPAHS14S)
pahsRST    <- c(OmyPAHS14C)

collections <- c(refCoastal, refRedband, lemhiWeir, lemhiRST, qciRoving, pahsCoastal, pahsSteel, pahsRST)

### MARKER LISTS
gsiPanel  <- Markers[-match(c('Ocl_gshpx357', 'Omy_myclarp404111', 'Omy_Omyclmk43896',  'OmyY1_2SEXY', 'Omy_mapK3103'),
                            Markers)]
lpIntroPanel <- c('Omy_bcAKala380rd','Omy_crb106','Omy_hsf2146','OMS00024','Omy_114587480','OMS00111',
                  'Omy_rbm4b203','Omy_ntl27','Omy_myoD178','Omy_BACB4324','OMS00090','Omy_zg5791',
                  'OMS00030','M09AAJ163','Omy_redd1410','OMS00039','Omy_gadd45332','Omy_102505102',
                  'Omy_cin172','OMS00070','Omy_vatf406','Omy_IL17185','Omy_gdh271','Omy_anp17',
                  'Omy_inos97','Omy_u0952284','Omy_SECC22b88','Omy_hus152','Omy_IL1b163','Omy_u0779166',
                  'OMS00119','OMS00173','OMS00176','OMS00092','Omy_107031704','Omy_nips299','OMS00149',
                  'OMS00133','Omy_sSOD1','Omy_tlr5205','OMS00061','Omy_CRBF11','OMS00014','OMGH1PROM1SNP1',
                   'Omy_LDHB2_i6','Omy_nxt2273','OMS00015','Omy_ndk152','Omy_nach200','OMS00169')
sexMarker <- 'OmyY1_2SEXY'

### DATA CLEANING
failedInds <- findNoCalls(collections, 19, gsiPanel)
#*** 1183 total individuals found
removeIndividuals(failedInds)

### EXPORT DATA
dumpStructure(collections, gsiPanel, filename = 'lemhiIntroStructure2657_187.txt')
dumpStructure(collections, lpIntroPanel, filename = 'lemhiIntroStructure2657_50.txt')
dumpGenAlEx(collections, gsiPanel, 'lemhiIntrogression', 'lemhiPahs187_genalex.txt')
dumpGenAlEx(collections, sexMarker, 'sexMarker', 'lemhiPahsSexMarker.txt')
dumpGenepop(collections, gsiPanel, 'lemhiIntrogression', 'lemhiPahs187_genepop.txt')

### EXPORT INDIVIDUAL DATA
indData <- metaData(collections)
dumpTable(indData, file = 'lemhiIntrogressionIndData.txt', row.names = TRUE)


