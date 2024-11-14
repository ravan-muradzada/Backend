select *
from hr.employees

select *
from hr.departments

select *
from hr.locations

select *
from hr.countries

--TASK 1:
--Amerika Birlesmis Statlarinin en tecrubli iscisinin adini gosterin:
select min(e.hire_date), c.country_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
where lower(c.country_name)='united states of america'
group by c.country_name

--TASK 2:
--USA-in en tecrubeli iscisinden daha cox maas alan iscilerin adini ve masini gosterin:
select first_name, salary
from hr.employees 
where salary>(
select salary
from hr.employees
where hire_date=(select min(hire_date)
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
where lower(c.country_name)='united states of america'
group by c.country_name))

--TASK 3:
--London sherinde isleyen iscilerin maasini 20 faiz artirin
-- 1 (with all)
select l.city,
    CASE WHEN lower(city)='london' THEN (e.salary)*1.2
    ELSE e.salary END updated
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id

-- 2 (without)
select (e.salary)*1.2 as updated
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
where lower(city)='london'

--TASK 4:
--Seattle seherinde isleyen iscilerin umumi maasindan daha cox maas alan iscileri ve onlarin
--hansi seherde islediyini gosterin:
select l.city, e.first_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
where e.salary>(select sum(e.salary)
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
where lower(city)='seattle')

--TASK 5:
--Heftenin birinci gunu ise baslayan ve en cox maas alan iscinin hansi seherde islediyini gosterin
select l.city
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
where salary=(select max(salary)
from hr.employees
where lower(to_char(hire_date,'dy'))='mon')
and lower(to_char(hire_date,'dy'))='mon'

--TASK 6:
--marketing departamentinin iscilerinin adini soyadini ve dep_idsini 
--gosterin, ancaq Join istifade etmeden:
select first_name, last_name, department_id
from hr.employees
where department_id=(select department_id
from hr.departments
where lower(department_name)='marketing')

--TASK 7:
--Qis aylarinin en az maas alan iscisinin hansi departament_namede calisdigini gosterin:
select e.first_name, d.department_name
from hr.employees e
inner join hr.departments d
on d.department_id=e.department_id
where e.salary=(select min(salary)
from hr.employees
where lower(to_char(hire_date,'mon')) in ('jan','feb','dec'))
and lower(to_char(hire_date,'mon')) in ('jan','feb','dec')

--TASK 8:
--Tecrube muddedi 19 ile beraber olan isci ve yaxud iscilerin hansi seherde islediyini gosterin
select e.first_name, l.city, to_char(hire_date,'yyyy')
from hr.employees e 
inner join hr.departments d
on d.department_id=e.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
where (to_char(sysdate,'yyyy')-to_char(e.hire_date,'yyyy'))=19

--TASK 9:
--umumi maasi 50000 den cox olan seherlerin adini ve umumi maaslari gosterin:
select sum(e.salary), l.city
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on d.location_id=l.location_id
inner join hr.countries c
on l.country_id=c.country_id
group by l.city
having sum(e.salary)>50000

--TASK 10:
--Her olkenin en az maas alan iscilerinin adini seherini ve maasini gosterin:
select e.first_name, l.city, e.salary
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on d.location_id=l.location_id
inner join hr.countries c
on l.country_id=c.country_id
where (e.salary, c.country_name) in (select min(e.salary), c.country_name 
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on d.location_id=l.location_id
inner join hr.countries c
on l.country_id=c.country_id
group by c.country_name)
