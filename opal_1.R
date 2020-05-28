font_add_google("Nanum Gothic", "nanumgothic")
# 홍삼
food1<-read.csv(file="C:/haerim/food/홍삼.csv",header=T)
ggplot(food1,aes(x=홍삼,y=영양소명))+geom_bar(stat="identity",fill=terrain.colors(20))+theme_bw()+
  theme(axis.text=element_text(size=30),axis.title=element_text(size=30),legend.position="top")+geom_text(size=10,aes(label=홍삼), vjust=0.3, colour="grey",check_overlap=TRUE)
ggsave('C:/Users/student/Desktop/r그래프저장파일/홍삼.png', width=16, height=10, dpi=100)

