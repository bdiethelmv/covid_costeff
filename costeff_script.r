## 31 August 2021
## Author: Benjamin Diethelm-Varela
## Cost-effectiveness analysis of the mass vaccination campaign in Chile

avg_case_month <- 88228
avg_death_month <- 1902

mortality_rate <- avg_death_month/avg_case_month
hosp_rate <- 0.094

fullvax_cost <- (8300*2)+(720*2)
fullhospt_cost <- 3225000

avg_hosp_month <- avg_case_month*hosp_rate

ve_hosp <- 0.88
ve_death <- 0.87

rr_hosp <- 1 - ve_hosp
rr_death <- 1 - ve_death

vax_hosp <- rr_hosp*hosp_rate*avg_case_month
vax_dead <- rr_death*mortality_rate*avg_case_month

hosp_averted <- avg_hosp_month - vax_hosp
death_averted <- avg_death_month - vax_dead

immun_fullcost <- fullvax_cost*avg_case_month

hosp_fullcost <- fullhospt_cost*avg_hosp_month
vax_hosp_fullcost <- fullhospt_cost*vax_hosp

savings_vax <- hosp_fullcost - vax_hosp_fullcost
net_savings <- savings_vax - immun_fullcost

icer_hosp <- (immun_fullcost)/(hosp_averted)
icer_death <- (immun_fullcost)/(death_averted)
icer_hosp
icer_death
