#standardized death ratio differences for black vs non-black
library(ggpubr)
library(dplyr)
set.seed(342)
center <- paste("center",1:19)
x <- rnorm(19, mean=1, sd=0.2)
se <- runif(19, 0.1, 0.5)
lcl_x <- x - se
ucl_x <- x + se
tmp <- data.frame("center" = center, "d_ratio" = x, "lcl"=lcl_x, "ucl"=ucl_x)


myplot <- tmp %>% 
  arrange(d_ratio) %>%
  mutate(center=factor(center, levels=center)) %>%
  ggplot(aes(y=center, x=d_ratio, xmin=lcl, xmax=ucl)) +
  geom_vline(xintercept=1, linetype="dashed", size=0.5) +
  geom_errorbarh(height=0.15, size=.5) + 
  geom_point(size=1.5) +
  scale_x_continuous(limits=c(0, 2.5)) +
  annotate("text", x=2, y="center 2", label="Reference=1", size=5) +
  labs(x="Center Death Ratio (Black vs. Non-Black)", y="Center")
myplot