movies=read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies)<-c("Film","Genre","Critics","Audience","BudgetMillions","Year")
head(movies)
str(movies)
movies$Year=factor(movies$Year)
#--------
library(ggplot2)
#----------
#plot1: Does Audience give higher ratings only to higher budget films?
#--------
p<-ggplot(data=movies,aes(x=BudgetMillions,y=Audience))
p+geom_point(aes(color=Genre))

#-----------
#plot2: Difference bw distribution of Audience and Critics Ratings
#-------
t<-ggplot(data=movies)
t+ geom_histogram(aes(x=Audience),color="Black",fill="LightPink",
                  binwidth = 10)

t+geom_histogram(aes(x=Critics),color="Black",fill="LightPink",
                 binwidth = 10)

#---------------
#plot3: Audience Ratings for different Genres
#-------------

u<-ggplot(data=movies,aes(x=Genre,y=Audience,color=Genre))
u+geom_jitter()+geom_boxplot(size=1,alpha=0.6)

#------------------
#plot4: Year wise Audience Ratings for different Genres
#---------------

w<-ggplot(data=movies,aes(x=Critics,y=Audience,color=Genre))
w+geom_point()+facet_grid(Genre~Year)+
  coord_cartesian(ylim=c(0,100))+geom_smooth(fill="NA")

#-------------
#plot5: Movie Budget Genre wise
#-------------

k<-ggplot(data=movies,aes(x=BudgetMillions))
h<-k+geom_histogram(aes(fill=Genre),color="Black",binwidth=10)
h+ xlab("Budget in Millions")+ylab("Number of Movies") +
  ggtitle("Movie Budget") +
  theme(axis.title.x = element_text(color="DarkBlue",size=20),
        axis.title.y = element_text(color="DarkBlue",size=20),
        axis.text.x = element_text(color="Blue",size=15),
        axis.text.y = element_text(color="Blue",size=15),
        legend.title = element_text(size=20),
        legend.text = element_text(size=10),
        legend.position=c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(color="Black",size=30))

        