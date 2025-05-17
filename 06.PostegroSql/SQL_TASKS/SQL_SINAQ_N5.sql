-- Sual 1
-- iscilerin emp idsini, dep idsini, adini, soyadini, evvelki maasini, departament adini, tecrube ilini, 
-- hazirki maasini gosterin gosterin ve eger tecrube ili 15 e qederdirse isciye 
-- 500 azn mukafat verin, eger tecrube ili 15 den boyukdurse o zaman isciye 1000 azn mukafat verin:
select e.employee_id, e.department_id, e.first_name, e.last_name, d.department_name, round(((sysdate-hire_date)/365),2) as tecrube_ili, e.salary as evvelki_maas, 
CASE WHEN round(((sysdate-hire_date)/365),2)<=15 THEN e.salary+500
	ELSE e.salary+1000 END as mukafatli_maas
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
order by 6

-- Sual 2
-- en az maas alan departamentin en az maasini, ve dep adini gosterin:
-- Way 1
select m, department_name
from (select e.salary, d.department_name,
min(e.salary) OVER() as m
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id)
where salary=m

-- Way 2
select min(e.salary), d.department_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
group by d.department_name
order by min(e.salary)
fetch first row only

-- Sual 3
-- max maasi 50-ci dep-in max maasindan boyuk olan dep-lerin id-sini ve max maasini gosterin
select max(salary)
from hr.employees
where department_id=50

select department_id, max(salary)
from hr.employees
group by department_id
having max(salary)>(select max(salary)
from hr.employees
where department_id=50)
order by 1

-- Sual 4 
-- iscilerin emp idsini, adini, soyadini, dep adini, seherini, olkesini, olke idsini
-- qeyd edin amma yalniz olkesi United Kingdom olanlari gosterin
select e.employee_id, e.first_name, e.last_name, d.department_name, l.city, c.country_name, c.country_id
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
where lower(c.country_name)='united kingdom'

-- Sual 5
-- her sobenin adini (dep name) ve en yuksek maaslarini tapin
select d.department_name, max(salary)
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
group by d.department_name
order by 2

-- Sual 6
-- en az maas alan isciden cox olan iscini ve ya iscileri tapin
select first_name, salary
from hr.employees
where salary>(select min(salary)
from hr.employees)
order by 2

-- Sual 7
-- icininin adini soayadini start date ni end date ni start date ve end date ile arasindaki
-- ferqi gosterin (gun sayini), il sayini gosterin
select e.first_name, e.last_name, jh.start_date, jh.end_date, trunc(jh.end_date-jh.start_date,1) as gun_sayi, trunc(((jh.end_date-jh.start_date)/365),1) as il_sayi
from  hr.employees e
inner join hr.job_history jh
on e.employee_id=jh.employee_id

-- Sual 8
-- state_province si null olmayan seherleri, olkeleri gosterin
-- (istifade edilecek cedveller: hr.locations ve hr.countries)
select l.city, c.country_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
where l.state_province is not NULL

-- Sual 9
-- employee id si 103 olan isciden daha cox maas alan iscileri gosterin
select first_name, salary
from hr.employees
where salary>(select salary
from hr.employees
where employee_id=103)
order by 2

-- Sual 10
-- employee_id si cut olan iscilerin, adini, departament adini, maasini, region_name
-- elave istifade edeceyiniz cedvel (hr.emp_details_view)
-- Way 1
select e.employee_id, e.first_name, d.department_name, e.salary, r.region_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
inner join hr.regions r
on r.region_id=c.region_id
where mod(e.employee_id,2)=0

-- Way 2
select employee_id, first_name, department_name, salary, region_name
from hr.emp_details_view
where mod(employee_id,2)=0



