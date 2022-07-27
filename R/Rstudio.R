setwd("C:\Users\Brian\Desktop\Data_Science\Modules\Module 20 Project\Group_Project_Real_Estate\")


Migration_2010_to_2019 <- read.csv(file="Migration_Flows_from_2010_to_2019.csv", check.names=F,stringsAsFactors=F)


view(Migration_2010_to_2019)


date_state_tracker <- state_tracker$period_begin





library(readr)

state_tracker <- read_tsv('state_market_tracker.tsv000')

view(state_tracker)

Illinois_State_tracker <- state_tracker[state_tracker$state=='Illinois', ]

plot(as.numeric(Illinois_State_tracker$period_begin),Illinois_State_tracker$median_sale_price)

Illinois_final_matrix <- subset(Illinois_cor_matrix, select = -c(months_of_supply))

cor(Illinois_final_matrix)


Texas_State_tracker <- state_tracker[state_tracker$state=='Texas', ]

plot(as.numeric(Texas_State_tracker$period_begin),Texas_State_tracker$median_sale_price)


Texas_final_matrix <- as.matrix(Texas_State_tracker[,c("median_sale_price","median_list_price","homes_sold","pending_sales","new_listings","inventory","price_drops")]) 
cor(Texas_final_matrix)


California_State_tracker <- state_tracker[state_tracker$state=='California', ]

California_final_matrix <- as.matrix(California_State_tracker[,c("median_sale_price","median_list_price","homes_sold","pending_sales","new_listings","inventory","price_drops")]) 
cor(California_final_matrix)

library(ggplot2)
plt<- ggplot(California_State_tracker) + geombar(aes(x=property_type), stat = "count")




library(tidyverse)
heat_Migration_map <- Migration_2010_to_2019 %>% group_by(current_state,year) %>% summarize(mean_price=mean(number_of_people), .groups='keep')

plt <- ggplot(heat_Migration_map, aes(x=current_state, y=factor(year), fill=mean_price))



plt + geom_tile() + labs(x="current state",y="year", fill = "people moving")


Illinois_Texas <- merge(Illinois_State_tracker, Texas_State_tracker, by = "period_begin")

Illinois_Texas_set <- cbind(Illinois_State_tracker, Texas_State_tracker)

Illinois_Texas_set_2 <- merge(Illinois_State_tracker,Texas_State_tracker, by=c("period_begin","period_end","region_type","region","state","state_code","property_type","median_sale_price","median_list_price","homes_sold","pending_sales","new_listings","inventory","months_of_supply","sold_above_list","price_drops"))

Texas_Illinois_tracker_final <- state_tracker[state_tracker$state=='Texas'| state_tracker$state=='Illinois', ]

delete <- merge(Illinois_State_tracker, Texas_State_tracker, by="period_begin", all=TRUE)




library(tidyverse)
heat_Migration_map_IL_TX <- Texas_Illinois_tracker_final %>% group_by(property_type,state) %>% summarize(mean_price=mean(median_sale_price), .groups='keep')

plt <- ggplot(heat_Migration_map_IL_TX, aes(x=property_type, y=factor(state), fill=mean_price))

plt + geom_tile() + labs(x="property type", y="State", fill = "Mean Price")


Select_state_tracker <- state_tracker[state_tracker$state=='Texas'| state_tracker$state=='Illinois'| state_tracker$state=='New York'| state_tracker$state=='California'| state_tracker$state=='Arkansas' , ]

select_state_heat_map <- Select_state_tracker %>% group_by(property_type,state) %>% summarize(mean_price=mean(median_sale_price), .groups='keep')

plt <- ggplot(select_state_heat_map, aes(x=property_type, y=factor(state), fill=mean_price))

plt + geom_tile() + labs(x="property type", y="State", fill = "Mean Price")

heat_Migration_map_IL_TX_all_residential_IL <- heat_Migration_map_IL_TX_all_residential[heat_Migration_map_IL_TX_all_residential$state=='Illinois', ]
heat_Migration_map_IL_TX_all_residential_TX <- heat_Migration_map_IL_TX_all_residential[heat_Migration_map_IL_TX_all_residential$state=='Texas', ]


California_State_tracker <- state_tracker[state_tracker$state=='California', ]

list <- ls()
to_remove <- c("Illinois_Texas", "Illinois_Texas_set")
list_to_remove <- list[ list %in% to_remove]
list_to_remove

rm(list=list_to_remove)


for (i in 1:5) {
  print(i + 1)
}

unique_state <- unique(state_tracker$state)

for (states in unique_state) {
  mean(state_tracker[state_tracker$state == states, 'median_sale_price'])
}

library(dplyr)
state_tracker_mean_price <- state_tracker %>% group_by(state) %>% mean(median_sale_price)

state_tracker_mean_price <- state_tracker %>% group_by(state) %>% summarize(mean_price=mean(median_sale_price))

departing_people_migration <- Migration_2010_to_2019 %>% group_by(from) %>% summarize(sum_people=sum(number_of_people))

cleaned_departing_people_migration <- departing_people_migration[!(departing_people_migration$from =="abroad_ForeignCountry"| departing_people_migration$from =="abroad_PuertoRico"| departing_people_migration$from =="abroad_USIslandArea"),]

receiving_people_migration <- Migration_2010_to_2019 %>% group_by(current_state) %>% summarize(sum_people=sum(number_of_people))
colnames(receiving_people_migration) <- c('state','sum_people')


receiving_people_migration_merged <- merge(receiving_people_migration, state_tracker_mean_price, by='state', all.x=TRUE)

library(tidyr)
receiving_people_migration_merged< - receiving_people_migration_merged[!is.na(receiving_people_migration_merged$mean_price),]

library(tidyverse)
plt <- ggplot(receiving_people_migration_merged, aes(x=mean_price, y=state, fill=sum_people))

plt + geom_tile() + labs(x="mean_price",y="state", fill = "people moving")


x = receiving_people_migration_merged$mean_price
y = receiving_people_migration_merged$sum_people
plot(x,y, xlab = "mean housing price", ylab = "people coming into state", main = "People migrating versus average housing cost")

#making correlation graph to see if people moving into a state correlates to cost of housing. 
receiving_people_migration_merged_matrix <- subset(receiving_people_migration_merged, select = -c(state))
receiving_people_migration_merged_matrix_na_omit <- na.omit(receiving_people_migration_merged_matrix)

cor(receiving_people_migration_merged_matrix_na_omit)

migration_whisker <- Migration_2010_to_2019 %>% group_by(current_state) %>% summarize(sum_people=sum(number_of_people))


library(plyr)
migration_whisker_aggregate <- Migration_2010_to_2019 %>% group_by(year) %>% summarize(number_of_people = sum(number_of_people))
view(migration_whisker_aggregate)

#plot used to show box whisker plot of state vs movers
ggplot(Migration_2010_to_2019, aes(x=factor(year)), y=number_of_people) + geom_boxplot()
boxplot(number_of_people ~ current_state, data= Migration_2010_to_2019, las =2)