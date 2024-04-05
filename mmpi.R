library(tidyverse)
library(readxl)
library(ggplot2)
library(googlesheets4)

mmpi <- read_sheet("https://docs.google.com/spreadsheets/d/18m0l6Wf2cKrCYYPfXKAMWs8uFFxSswQsigfSh-C4emo/edit?usp=sharing") 

mmpi <- mmpi %>% 
  mutate(Scale = factor(Scale, levels = c("L", "F", "K", "1 (Hs)", "2 (D)", "3 (Hy)", "4 (Pd)", "6 (Pa)", "7 (Pt)", "8 (Se)", "9 (Ma)")))

ggplot (mmpi, aes(x = Scale, y = score)) +
  geom_line(colour = "hotpink4", size = 0.8, alpha = .9, linetype = 1, group = 1) +
  geom_point(shape = 1, size = 2) +
  theme(plot.background = element_rect(fill = "lavenderblush"),
        panel.background = element_rect(fill = "lavenderblush")) +
  labs(x = "Шкали", y = "T-бали")+
  scale_y_continuous(breaks = seq(10, 100, 10)) +
  coord_cartesian(ylim = c(10,100)) +
  geom_line(data = mmpi, mapping = aes(x = Scale, y = score2), colour = "hotpink4", size = 0.8, alpha = .9, linetype = 1, group = 1) +
  geom_point(data = mmpi, aes(x = Scale, y = score2), shape = 1, size = 2) +
  geom_vline(xintercept = 3.5, colour = "ivory4", size = 0.8, alpha = .9, linetype = 1, group = 1) +
  annotate("text", x = 9.7, y = 90, label = "Високі оцінки", angle = 0) +
  geom_hline(yintercept = 40, colour = "mediumorchid4", size = .7, alpha = .9, linetype = 2, group = 1) +
  geom_hline(yintercept = 70, colour = "mediumorchid4", size = .7, alpha = .9, linetype = 2, group = 1) +
  annotate("text", x = 9.7, y = 20, label = "Низькі оцінки", angle = 0)

