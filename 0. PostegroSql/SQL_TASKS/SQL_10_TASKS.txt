--TASK 1:
--her seherin ortalama maasini ve iscilerinin adini gosterin:
select e.salary, e.first_name,
avg(e.salary) OVER (partition by l.city) as result
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id

--TASK 2:
--her department_namein iscilerinin ortalama maasla oz maaslarinin
--muqayisesini tapin:
select e.salary,
avg(e.salary) OVER (partition by d.department_name) as ortalama,
avg(e.salary) OVER (partition by d.department_name)-salary as ferq
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id

--TASK 3:
--her job_idnin ortalama maasi ile iscilerinin maasininin ferqini tapin:
select salary,
avg(salary) OVER (partition by job_id) as ortalama,
avg(salary) OVER (partition by job_id)-salary as ferq
from hr.employees 

--TASK 4:
--her olkenin ortalama maasindan daha az maas alan  iscilerin
--adini olkesini maasini ve her olkenin ortalama maasini gosterin:
select *
from (select e.first_name, c.country_name, e.salary, 
avg(salary) OVER (partition by c.country_name) as ortalama,
avg(salary) OVER (partition by c.country_name)-e.salary as ferq
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id)
where ferq>salary


--TASK 5:
--her job_idinin isci sayini analitik funksiya istifadə edərək göstərin:
select *
from (select job_id, 
count(*) OVER(partition by job_id) as c
from hr.employees)
order by c asc


--TASK 6:
--her job_idnin, tecrubesi en cox olan iscisinin maasini, hemin job_idnin
--maksimum maasi arasindaki ferqi tapin:
select *
from (select job_id, salary, 
dense_rank() OVER(partition by job_id order by salary desc) as mm
from hr.employees)
where mm=1

select *
from (select job_id, salary,
dense_rank() OVER(partition by job_id order by hire_date asc) tm
from hr.employees)
where tm=1


select tecrube.job_id, tecrube.salary as t, max_maas.salary m, (max_maas.salary-tecrube.salary) as ferq   
	from (select *
			from (select job_id, salary,
			dense_rank() OVER(partition by job_id order by hire_date asc) tm
			from hr.employees)
			where tm=1) tecrube

	inner join (select *
            from (select job_id, salary, 
            dense_rank() OVER(partition by job_id order by salary desc) as mm
            from hr.employees)
            where mm=1) max_maas

on tecrube.job_id=max_maas.job_id

--TASK 7:
--Yalniz USA olkesinin iscilerinin maasina gore rankini tapin(dense)
select c.country_name, e.salary,
dense_rank() OVER(partition by c.country_name order by e.salary desc) as dn
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id
inner join hr.countries c
on c.country_id=l.country_id
where lower(country_name)='united states of america'
