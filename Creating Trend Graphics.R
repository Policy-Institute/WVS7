#Install Packages#
install.packages('tidyverse')
install.packages("readxl")
install.packages("ggplot2")
install.packages("reshape2")
install.packages("plotly")
install.packages("RColorBrewer")
install.packages("showtext")
install.packages("ggrepel")
install.packages("htmlwidgets")
install.packages("writexl")

##### PART 1 - Working Directory and Libraries #####

### NOTE - set working directory to load in XLSX files provided ###

setwd("")

#Libraries #
library(tidyverse)
library(readxl)
library(ggplot2)
library(reshape2)
library(plotly)
library(dplyr)
library(showtext)
library(ggrepel)
library(htmlwidgets)
library(writexl)

##### PART 2 - Setting Base Color and Color Palette #####

#BaseGrey
BaseColour = "#777777"

bold = c("#7F3C8D","#11A579","#3969AC","#F2B701","#E73F74","#80BA5A","#E68310","#008695","#CF1C90","#f97b72","#4b4b8f","#A5AA99")
pastel = c("#66C5CC","#F6CF71","#F89C74","#DCB0F2","#87C55F","#9EB9F3","#FE88B1","#C9DB74","#8BE0A4","#B497E7","#D3B484","#B3B3B3")
prism = c ("#5F4690","#1D6996","#38A6A5","#0F8554","#73AF48","#EDAD08","#E17C05","#CC503E","#94346E","#6F4070","#994E95","#666666")
vivid = c ("#E58606","#5D69B1","#52BCA3","#99C945","#CC61B0","#24796C","#DAA51B","#2F8AC4","#764E9F","#ED645A","#CC3A8E","#A5AA99")


##### PART 3 - Creating Graphics #####

#### 1 - Abortion ####

ABORTION <- read_excel("ABORTION.XLSX")
ABORTION$Year<- round(as.numeric(ABORTION$Year),0)
ABORTION_EXP <- melt(ABORTION,id.vars="Year")
ABORTION_EXP$'Justification'<-round(ABORTION_EXP$value,2)
ABORTION_EXP$'Region'<-ABORTION_EXP$variable

ABORTION.Graph <- ggplotly(
  ggplot(data=ABORTION_EXP,aes(x=Year,y=Justification,color=Region,))+
    geom_point(size=1,alpha=0.7,aes(text=paste("Year:",Year,"<br>Score:",Justification,"<br>Region:",Region)))+
    geom_smooth(se=FALSE,method="lm",formula=y~poly(x,2), size=0.8)+
    scale_y_continuous(limits = c(0,8),breaks = c(0,2,4,6,8))+
    scale_colour_manual(values=bold)+
    theme(axis.title.x = element_blank())+
    theme(axis.title.y = element_blank())+
    theme(plot.title = element_text(size=18, family="Segoe UI", colour=BaseColour))+
    theme(axis.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(axis.ticks = element_blank())+
    theme(legend.text = element_text(family="Segoe UI",colour = BaseColour))+
    theme(panel.grid.major.y = element_line( size=2, color="#F1F1F1"))+
    theme(panel.grid.major.x = element_blank())+
    theme(panel.background = element_blank())+
    theme(legend.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(legend.title = element_text(size=12,family="Segoe UI",colour=BaseColour)),
  tooltip="text")
ABORTION.Graph <- ABORTION.Graph %>% config(displayModeBar=FALSE)
ABORTION.Graph

#### 2 - Confidence in Church ####

CONFCHURCH <- read_excel("CONFCHURCH.XLSX")
CONFCHURCH$Year<- round(as.numeric(CONFCHURCH$Year),0)
CONFCHURCH_EXP <- melt(CONFCHURCH,id.vars="Year")
CONFCHURCH_EXP$'Confidence'<-round(CONFCHURCH_EXP$value,2)
CONFCHURCH_EXP$'Region'<-CONFCHURCH_EXP$variable

CONFCHURCH.Graph <- ggplotly(
  ggplot(data=CONFCHURCH_EXP,aes(x=Year,y=Confidence,color=Region,))+
    geom_point(size=1,alpha=0.7,aes(text=paste("Year:",Year,"<br>Score:",Confidence,"<br>Region:",Region)))+
    geom_smooth(se=FALSE,method="lm",formula=y~poly(x,2), size=0.8)+
    scale_y_continuous(limits = c(0,1),breaks = c(0,0.2,0.4,0.6,0.8))+
    scale_colour_manual(values=bold)+
    theme(axis.title.x = element_blank())+
    theme(axis.title.y = element_blank())+
    theme(plot.title = element_text(size=18, family="Segoe UI", colour=BaseColour))+
    theme(axis.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(axis.ticks = element_blank())+
    theme(legend.text = element_text(family="Segoe UI",colour = BaseColour))+
    theme(panel.grid.major.y = element_line( size=2, color="#F1F1F1"))+
    theme(panel.grid.major.x = element_blank())+
    theme(panel.background = element_blank())+
    theme(legend.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(legend.title = element_text(size=12,family="Segoe UI",colour=BaseColour)),
  tooltip="text")
CONFCHURCH.Graph <- CONFCHURCH.Graph %>% config(displayModeBar=FALSE)
CONFCHURCH.Graph

#### 3 - Confidence in Government ####

CONFGOV <- read_excel("CONFGOV.XLSX")
CONFGOV$Year<- round(as.numeric(CONFGOV$Year),0)
CONFGOV_EXP <- melt(CONFGOV,id.vars="Year")
CONFGOV_EXP$'Confidence'<-round(CONFGOV_EXP$value,2)
CONFGOV_EXP$'Region'<-CONFGOV_EXP$variable

CONFGOV.Graph <- ggplotly(
  ggplot(data=CONFGOV_EXP,aes(x=Year,y=Confidence,color=Region,))+
    geom_point(size=1,alpha=0.7,aes(text=paste("Year:",Year,"<br>Score:",Confidence,"<br>Region:",Region)))+
    geom_smooth(se=FALSE,method="lm",formula=y~poly(x,2), size=0.8)+
    scale_y_continuous(limits = c(0,1),breaks = c(0,0.2,0.4,0.6,0.8))+
    scale_colour_manual(values=bold)+
    theme(axis.title.x = element_blank())+
    theme(axis.title.y = element_blank())+
    theme(plot.title = element_text(size=18, family="Segoe UI", colour=BaseColour))+
    theme(axis.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(axis.ticks = element_blank())+
    theme(legend.text = element_text(family="Segoe UI",colour = BaseColour))+
    theme(panel.grid.major.y = element_line( size=2, color="#F1F1F1"))+
    theme(panel.grid.major.x = element_blank())+
    theme(panel.background = element_blank())+
    theme(legend.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(legend.title = element_text(size=12,family="Segoe UI",colour=BaseColour)),
  tooltip="text")
CONFGOV.Graph <- CONFGOV.Graph %>% config(displayModeBar=FALSE)
CONFGOV.Graph

#### 4 - Confidence in Justice System ####

CONFJUSTICE <- read_excel("CONFJUSTICE.XLSX")
CONFJUSTICE$Year<- round(as.numeric(CONFJUSTICE$Year),0)
CONFJUSTICE_EXP <- melt(CONFJUSTICE,id.vars="Year")
CONFJUSTICE_EXP$'Confidence'<-round(CONFJUSTICE_EXP$value,2)
CONFJUSTICE_EXP$'Region'<-CONFJUSTICE_EXP$variable

CONFJUSTICE.Graph <- ggplotly(
  ggplot(data=CONFJUSTICE_EXP,aes(x=Year,y=Confidence,color=Region,))+
    geom_point(size=1,alpha=0.7,aes(text=paste("Year:",Year,"<br>Score:",Confidence,"<br>Region:",Region)))+
    geom_smooth(se=FALSE,method="lm",formula=y~poly(x,2), size=0.8)+
    scale_y_continuous(limits = c(0,1),breaks = c(0,0.2,0.4,0.6,0.8))+
    scale_colour_manual(values=bold)+
    theme(axis.title.x = element_blank())+
    theme(axis.title.y = element_blank())+
    theme(plot.title = element_text(size=18, family="Segoe UI", colour=BaseColour))+
    theme(axis.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(axis.ticks = element_blank())+
    theme(legend.text = element_text(family="Segoe UI",colour = BaseColour))+
    theme(panel.grid.major.y = element_line( size=2, color="#F1F1F1"))+
    theme(panel.grid.major.x = element_blank())+
    theme(panel.background = element_blank())+
    theme(legend.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(legend.title = element_text(size=12,family="Segoe UI",colour=BaseColour)),
  tooltip="text")
CONFJUSTICE.Graph <- CONFJUSTICE.Graph %>% config(displayModeBar=FALSE)
CONFJUSTICE.Graph

#### 5 - Confidence in Police ####

CONFPOLICE <- read_excel("CONFPOLICE.XLSX")
CONFPOLICE$Year<- round(as.numeric(CONFPOLICE$Year),0)
CONFPOLICE_EXP <- melt(CONFPOLICE,id.vars="Year")
CONFPOLICE_EXP$'Confidence'<-round(CONFPOLICE_EXP$value,2)
CONFPOLICE_EXP$'Region'<-CONFPOLICE_EXP$variable

CONFPOLICE.Graph <- ggplotly(
  ggplot(data=CONFPOLICE_EXP,aes(x=Year,y=Confidence,color=Region,))+
    geom_point(size=1,alpha=0.7,aes(text=paste("Year:",Year,"<br>Score:",Confidence,"<br>Region:",Region)))+
    geom_smooth(se=FALSE,method="lm",formula=y~poly(x,2), size=0.8)+
    scale_y_continuous(limits = c(0,1),breaks = c(0,0.2,0.4,0.6,0.8))+
    scale_colour_manual(values=bold)+
    theme(axis.title.x = element_blank())+
    theme(axis.title.y = element_blank())+
    theme(plot.title = element_text(size=18, family="Segoe UI", colour=BaseColour))+
    theme(axis.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(axis.ticks = element_blank())+
    theme(legend.text = element_text(family="Segoe UI",colour = BaseColour))+
    theme(panel.grid.major.y = element_line( size=2, color="#F1F1F1"))+
    theme(panel.grid.major.x = element_blank())+
    theme(panel.background = element_blank())+
    theme(legend.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(legend.title = element_text(size=12,family="Segoe UI",colour=BaseColour)),
  tooltip="text")
CONFPOLICE.Graph <- CONFPOLICE.Graph %>% config(displayModeBar=FALSE)
CONFPOLICE.Graph

#### 6 - Justification of Euthanasia ####

EUTHAN <- read_excel("EUTHAN.XLSX")
EUTHAN$Year<- round(as.numeric(EUTHAN$Year),0)
EUTHAN_EXP <- melt(EUTHAN,id.vars="Year")
EUTHAN_EXP$'Justification'<-round(EUTHAN_EXP$value,2)
EUTHAN_EXP$'Region'<-EUTHAN_EXP$variable

EUTHAN.Graph <- ggplotly(
  ggplot(data=EUTHAN_EXP,aes(x=Year,y=Justification,color=Region,))+
    geom_point(size=1,alpha=0.7,aes(text=paste("Year:",Year,"<br>Score:",Justification,"<br>Region:",Region)))+
    geom_smooth(se=FALSE,method="lm",formula=y~poly(x,2), size=0.8)+
    scale_y_continuous(limits = c(0,8),breaks = c(0,2,4,6,8))+
    scale_colour_manual(values=bold)+
    theme(axis.title.x = element_blank())+
    theme(axis.title.y = element_blank())+
    theme(plot.title = element_text(size=18, family="Segoe UI", colour=BaseColour))+
    theme(axis.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(axis.ticks = element_blank())+
    theme(legend.text = element_text(family="Segoe UI",colour = BaseColour))+
    theme(panel.grid.major.y = element_line( size=2, color="#F1F1F1"))+
    theme(panel.grid.major.x = element_blank())+
    theme(panel.background = element_blank())+
    theme(legend.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(legend.title = element_text(size=12,family="Segoe UI",colour=BaseColour)),
  tooltip="text")
EUTHAN.Graph <- EUTHAN.Graph %>% config(displayModeBar=FALSE)
EUTHAN.Graph

#### 7 - Justification of Homosexuality ####

HOMOSEX <- read_excel("HOMOSEX.XLSX")
HOMOSEX$Year<- round(as.numeric(HOMOSEX$Year),0)
HOMOSEX_EXP <- melt(HOMOSEX,id.vars="Year")
HOMOSEX_EXP$'Justification'<-round(HOMOSEX_EXP$value,2)
HOMOSEX_EXP$'Region'<-HOMOSEX_EXP$variable

HOMOSEX.Graph <- ggplotly(
  ggplot(data=HOMOSEX_EXP,aes(x=Year,y=Justification,color=Region,))+
    geom_point(size=1,alpha=0.7,aes(text=paste("Year:",Year,"<br>Score:",Justification,"<br>Region:",Region)))+
    geom_smooth(se=FALSE,method="lm",formula=y~poly(x,2), size=0.8)+
    scale_y_continuous(limits = c(0,8),breaks = c(0,2,4,6,8))+
    scale_colour_manual(values=bold)+
    theme(axis.title.x = element_blank())+
    theme(axis.title.y = element_blank())+
    theme(plot.title = element_text(size=18, family="Segoe UI", colour=BaseColour))+
    theme(axis.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(axis.ticks = element_blank())+
    theme(legend.text = element_text(family="Segoe UI",colour = BaseColour))+
    theme(panel.grid.major.y = element_line( size=2, color="#F1F1F1"))+
    theme(panel.grid.major.x = element_blank())+
    theme(panel.background = element_blank())+
    theme(legend.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(legend.title = element_text(size=12,family="Segoe UI",colour=BaseColour)),
  tooltip="text")
HOMOSEX.Graph <- HOMOSEX.Graph %>% config(displayModeBar=FALSE)
HOMOSEX.Graph

#### 8 - Signing a Petition ####

PETITION <- read_excel("PETITION.XLSX")
PETITION$Year<- round(as.numeric(PETITION$Year),0)
PETITION_EXP <- melt(PETITION,id.vars="Year")
PETITION_EXP$'Petition'<-round(PETITION_EXP$value,2)
PETITION_EXP$'Region'<-PETITION_EXP$variable

PETITION.Graph <- ggplotly(
  ggplot(data=PETITION_EXP,aes(x=Year,y=Petition,color=Region,))+
    geom_point(size=1,alpha=0.7,aes(text=paste("Year:",Year,"<br>Score:",Petition,"<br>Region:",Region)))+
    geom_smooth(se=FALSE,method="lm",formula=y~poly(x,2), size=0.8)+
    scale_y_continuous(limits = c(0,1),breaks = c(0,0.2,0.4,0.6,0.8))+
    scale_colour_manual(values=bold)+
    theme(axis.title.x = element_blank())+
    theme(axis.title.y = element_blank())+
    theme(plot.title = element_text(size=18, family="Segoe UI", colour=BaseColour))+
    theme(axis.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(axis.ticks = element_blank())+
    theme(legend.text = element_text(family="Segoe UI",colour = BaseColour))+
    theme(panel.grid.major.y = element_line( size=2, color="#F1F1F1"))+
    theme(panel.grid.major.x = element_blank())+
    theme(panel.background = element_blank())+
    theme(legend.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(legend.title = element_text(size=12,family="Segoe UI",colour=BaseColour)),
  tooltip="text")
PETITION.Graph <- PETITION.Graph %>% config(displayModeBar=FALSE)
PETITION.Graph

#### 9 - Private-State ####

PRIVATESTATE <- read_excel("PRIVATESTATE.XLSX")
PRIVATESTATE$Year<- round(as.numeric(PRIVATESTATE$Year),0)
PRIVATESTATE_EXP <- melt(PRIVATESTATE,id.vars="Year")
PRIVATESTATE_EXP$'PRIVATESTATE'<-round(PRIVATESTATE_EXP$value,2)
PRIVATESTATE_EXP$'Region'<-PRIVATESTATE_EXP$variable

PRIVATESTATE.Graph <- ggplotly(
  ggplot(data=PRIVATESTATE_EXP,aes(x=Year,y=PRIVATESTATE,color=Region,))+
    geom_point(size=1,alpha=0.7,aes(text=paste("Year:",Year,"<br>Score:",PRIVATESTATE,"<br>Region:",Region)))+
    geom_smooth(se=FALSE,method="lm",formula=y~poly(x,2), size=0.8)+
    scale_y_continuous(limits = c(2,8),breaks = c(2,4,6,8))+
    scale_colour_manual(values=bold)+
    theme(axis.title.x = element_blank())+
    theme(axis.title.y = element_blank())+
    theme(plot.title = element_text(size=18, family="Segoe UI", colour=BaseColour))+
    theme(axis.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(axis.ticks = element_blank())+
    theme(legend.text = element_text(family="Segoe UI",colour = BaseColour))+
    theme(panel.grid.major.y = element_line( size=2, color="#F1F1F1"))+
    theme(panel.grid.major.x = element_blank())+
    theme(panel.background = element_blank())+
    theme(legend.text = element_text(size=11, family="Segoe UI", colour=BaseColour))+
    theme(legend.title = element_text(size=12,family="Segoe UI",colour=BaseColour)),
  tooltip="text")
PRIVATESTATE.Graph <- PRIVATESTATE.Graph %>% config(displayModeBar=FALSE)
PRIVATESTATE.Graph

#final charts# 

ABORTION.Graph
CONFCHURCH.Graph
CONFGOV.Graph
CONFJUSTICE.Graph
CONFPOLICE.Graph
EUTHAN.Graph
HOMOSEX.Graph
PETITION.Graph
PRIVATESTATE.Graph




