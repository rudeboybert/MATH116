library(ggmap)
library(ggplot2)
library(dplyr)

google.mapa <-
  get_map(location = "Portland, OR", maptype = "roadmap", zoom = 10, color = "color")

# Plot it!
# The census tract outlines aren't as important if you have the actual map, so I
# commented out the geom_path() part.  The google.map is itself a ggplot object,
# so we no longer need to use geom_polygon() as our base.  Furthermore, we can
# remove the theme_bw()

blah <- data_frame(
  long = c(-122.4, -122.5),
  lat= c(45.5, 45.6),
  number=c(4,10)
)

ggmap(google.mapa) +
  coord_map() +
  xlab("longitude") + ylab("latitude") +
  geom_point(data=blah, aes(x=long, y=lat, size=number), col="red") + 
  scale_x_continuous(limits = c(-123.0, -122.3)) +
  scale_y_continuous(limits = c(45.43, 45.73))
