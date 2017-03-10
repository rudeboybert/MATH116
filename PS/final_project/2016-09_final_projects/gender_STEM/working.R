women.stem <- read.csv("/home/aglassie/Final Project/women-stem.csv")

engineering <- filter(women.stem, Major_category == "Engineering")
health <- filter(women.stem, Major_category == "Health")
bio_life <- filter(women.stem, Major_category == "Biology & Life Science")
physical_sciences<- filter(women.stem, Major_category == "Physical Sciences")
computer_math<- filter(women.stem, Major_category == "Computers & Mathematics")


library(tidyr)
# This takes the data set and makes it into tidy format, where 
# -Gender is its own variable
# -Count represents the number of people
# -Major and Major_category are left unchanged, that's why there is a minus sign in front
bio_life_tidy <- bio_life %>% 
  select(Major, Major_category, Men, Women) %>% 
  gather(Gender, Count, -Major, -Major_category)


# Option 1: Rotate the entire coordinate system
ggplot(bio_life_tidy, aes(x=Major, y=Count, fill=Gender)) +
  geom_bar(stat="identity", position = "dodge") +
  coord_flip()

# Option 2: Rotate just the axis labels
ggplot(bio_life_tidy, aes(x=Major, y=Count, fill=Gender)) +
  geom_bar(stat="identity", position = "dodge") + 
  # 45 is the angle of rotation of labels
  theme(axis.text.x = element_text(angle = , hjust = 1))


ggplot(bio_life_tidy, aes(x=Major, y=Count, fill=Gender)) +
  filter(bio_life, Major != "Botany", "Genetics", "")
  geom_bar(stat="identity", position = "dodge") + 
  # 45 is the angle of rotation of labels
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


