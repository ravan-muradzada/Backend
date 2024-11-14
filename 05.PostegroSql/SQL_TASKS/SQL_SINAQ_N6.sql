-- Sual 1
-- 3 cu en cox maas alan iscini tapin(butun melumatlarini)
select *
from (select e.*,
dense_rank() OVER(order by salary desc) as dn
from hr.employees e)
where dn=3

-- Sual 2
-- iscinin adini,soyadini, start_date ni, end dateni, job_idsini (job_history) tapin
-- istifade edeceyiniz elave cedvel (job_history)
select e.first_name, e.last_name, jh.start_date, jh.end_date, jh.job_id
from hr.employees e
inner join hr.job_history jh
on e.employee_id=jh.employee_id

-- Sual 3
-- iscinin emp idsini, adini, soyadini, dep adini, seherini, olkenin idsini, olkesinin adini gosterin
--Melumat gotureceyiniz cedvel adlari (hr.employees, hr.departments, hr.locations, hr.countries)
select e.employee_id, e.first_name, e.last_name, d.department_name, l.city, c.country_id, c.country_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id

-- Sual 4 
-- adindaki herflerin sayi cut olan adlari, hemin --iscilərin nece ay islediyini gosterin. 
-- Siralama adinin uzunluguna gore olsun artan ardicilliqla:
select first_name, length(first_name), trunc(months_between(sysdate, hire_date),1) as umumi_ay
from hr.employees
where mod(length(first_name),2)=0
order by 2

-- Sual 5
-- iscilerin adini soyadini dep idsini dep adini ( natural join le sadece joinle ve using join)
--istifade edərek gosterin
select e.first_name, e.last_name, e.department_id, d.department_name
from hr.employees e
natural join hr.departments d

select e.first_name, e.last_name, e.department_id, d.department_name
from hr.employees e
join hr.departments d
on e.department_id=d.department_id

select e.first_name, e.last_name, e.department_id, d.department_name
from hr.employees e
join hr.departments d
using (department_id)

-- Sual 6
-- adi den olan iscinin adini, soyadini, maasini, dep idsini, dep adini gosterin
select e.first_name, e.last_name, e.salary, e.department_id, d.department_name
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
where lower(first_name)='den'

-- Sual 7 
-- en az maas alan departamentin en az maasini, ve dep adini gosterin:
select m, department_name
from (select e.salary, d.department_name,
min(e.salary) OVER() as m
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id)
where salary=m

-- Sual 7 
-- en az maas alan departamentin en az maasini, ve dep adini gosterin:
select m, department_name
from (select e.salary, d.department_name,
min(e.salary) OVER() as m
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id)
where salary=m

-- Sual 8 
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

-- Sual 9 
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

-- Sual 10
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