library(dplyr)
library(ggplot2)

lemhiData <- read.csv('C:/Users/mikea/Dropbox/lemhiPahsimeroiMykissGenetics/2017/R/input/lemhiIntrogressionSummary2017test.csv')

# Filter data
lemhi <- select(lemhiData, Pedigree, Individual, PITTagNum, Lineage, DateSampled, LengthFork1, GenSex)
refCoastal <- filter(lemhi, Pedigree %in% c('OmyENIS06C_3', 'OmyHAYS05C'))
lemhiWeir  <- filter(lemhi, Pedigree %in% c('OmyAGCY13S', 'OmyBTMB12S', 'OmyBTMB13S', 'OmyBOHA12S', 'OmyBOHA13S', 
                                            'OmyCNYL12S', 'OmyHAYW12S', 'OmyHAYW13S', 'OmyKENY12S', 'OmyKENY13S', 
                                            'OmyPRAT13S', 'OmyWIMP12S', 'OmyWIMP13S'))
lemhiRST   <- filter(lemhi, Pedigree %in% c('OmyHAYW10C', 'OmyLEMW10C', 'OmyLL3A13C'))
qciRoving  <- filter(lemhi, Pedigree %in% c('OmyAGCY13C', 'OmyBSPR11C', 'OmyBSPR13C', 'OmyBTMB13C', 'OmyBOHA13C',
                                            'OmyCNYL13C', 'OmyHYDN09C', 'OmyHYDN13C', 'OmyKENY13C', 'OmyLEMH10C_1', 
                                            'OmyLEMH13C', 'OmyLSPR13C', 'OmyWIMP13C'))
pahsCoastal<- filter(lemhi, Pedigree %in% c('OmyPAHS09S', 'OmyPAHS10S', 'OmyPAHS11S_1', 'OmyPAHS12S_1', 
                                            'OmyPAHS13S_1', 'OmyPAHS14S_1'))
pahsSteel  <- filter(lemhi, Pedigree %in% c('OmyPAHS06S', 'OmyPAHS09S_1', 'OmyPAHS10S_1', 'OmyPAHS11S', 'OmyPAHS12S', 
                                            'OmyPAHS13S', 'OmyPAHS14S'))
pahsRST    <- filter(lemhi, Pedigree %in% c('OmyPAHS14C'))

# Length Frequency Histograms Filled by Lineage
ggplot(data = qciRoving, aes(x = LengthFork1)) +
  geom_histogram(aes(fill = Lineage)) +
  facet_wrap(~ Pedigree, scales = 'free_y') +
  theme_bw() +
  labs(x = 'Fork Length (mm)',
       y = 'Frequency')

#ggplot(data = champSummary, aes(x = WatershedName)) +
#  geom_histogram(fill = 'skyblue4', stat = 'count') +
#  scale_x_discrete(breaks = c('Entiat','John Day','Lemhi','Methow','Minam','South Fork Salmon','Tucannon',
#                              'Upper Grande Ronde','Wenatchee'),
#                   labels = c('Entiat','JohnDay','Lemhi','Methow','Minam','Secesh','Tucannon',
#                              'GrandeRonde','Wenatchee')) +
#  labs(x = 'Basin',
#       y = 'Number of CHaMP Sites')
#
#ggplot(data = champNredds, aes(x = maxRedds)) +
#  geom_histogram(fill = 'skyblue4') +
#  facet_wrap(~ WatershedName) +
#  labs(x = 'Maximum Number of Observed Redds',
#       y = 'Number of CHaMP Sites')