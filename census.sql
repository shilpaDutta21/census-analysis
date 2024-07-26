create database project;
select * from project.dataset1;
select * from project.dataset2;

-- Number of rows in Dataset

select count(*) from project.dataset1;
select count(*) from project.dataset2;

-- dataset for jharkhand and bihar

select * from project.dataset1 where state in ('Jharkhand' ,'Bihar');

-- population of India

select * from project.dataset2;

-- average growth

select avg(growth) *100 from project.dataset1;
select state,avg(growth) *100 avg_growth from project.dataset1 group by state;

-- avg sex ratio

select state,round(avg(sex_ratio),0) avg_sex_ratio from project.dataset1 group by state;
select state,round(avg(sex_ratio),0) avg_sex_ratio from project.dataset1 group by state order by avg_sex_ratio desc;

-- avg literacy rate

select state,round(avg(literacy),0) avg_literacy_ratio from project.dataset1 group by state order by avg_literacy_ratio desc;
select state,round(avg(literacy),0) avg_literacy_ratio from project.dataset1 group by state having 
round(avg(literacy),0)>90 order by avg_literacy_ratio desc;

-- top 3 states showing highest growth ratio

select  state,avg(growth) *100 avg_growth from project.dataset1 group by state limit 3;
select  state,avg(growth) *100 avg_growth from project.dataset1 group by state order by avg_growth desc limit 3;

-- bottom 3 states showing lowest sex ratio

select state,round(avg(sex_ratio),0) avg_sex_ratio from project.dataset1 group by state order by avg_sex_ratio asc limit 3;

truncate table project.topstates;
describe project.topstate;

-- joining both the tables

select project.dataset1.district,sex_ratio,literacy from project.dataset1 inner join project.dataset2 on project.dataset1.district=project.dataset2.district;
select project.dataset1.district,sex_ratio,literacy from project.dataset1 left outer join project.dataset2 on project.dataset1.district=project.dataset2.district;

-- cross join or cartesian join

select * from project.dataset1 cross join project.dataset2;
select * from project.dataset2 cross join project.dataset1;

-- copy all of the rows and cols from one table to new table

create table project.stateinfo select * from project.dataset1;
select * from project.stateinfo;











