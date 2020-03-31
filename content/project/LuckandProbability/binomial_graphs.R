dd = data.frame(x=rep(1:20,5),
                prob=c(dbinom(1:20, 20, prob=0.5)))
                  
annotations <- data.frame(
  xpos = 18,
  ypos =  0.25,
  annotateText = "p = 0.5 and n = 20")

ggplot(data=dd, aes(x=x,y=prob)) + 
  geom_point() +
  xlab("Number of Successes") +
  ylab("Probability") +
  ggtitle("Probability Mass Function for the Binomial Distribution") + 
  geom_text(data = annotations, aes(x=xpos,y=ypos,label=annotateText))
