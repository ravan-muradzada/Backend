--TASK 1:
--max maasi 50 ci departamentin max maasindan daha cox olan iscilerin
--her birinin oz departamentine gore (descending) rankini tapin:
select department_id, salary, 
dense_rank() OVER (partition by department_id order by salary desc) as m
from hr.employees
where salary>(select max(salary)
from hr.employees
where department_id=50)
order by 1


--TASK 2:
--Her street_addressin en cox maas alan iscilerinin adini gosterin:
select *
from (select e.first_name, e.salary, l.street_address,
dense_rank() OVER (partition by l.street_address order by e.salary desc) as dn
from hr.employees e
inner join hr.departments d
on e.department_id=d.department_id
inner join hr.locations l
on l.location_id=d.location_id)
where dn=1


--TASK 3:
--Maasi 90 ci departamentin en cox maas alan iscisinden az, 110 cu departamentin 
--en cox maas alan iscisinden ise cox olan iscileri gosterin:
select first_name, salary
from hr.employees
where salary>(select max(salary)
from hr.employees
where department_id=110) and salary<(select max(salary)
from hr.employees
where department_id=90)
order by 2

--TASK 4:
--Her bir departametin icerisinde yerlesen sobelerin,(job_idlerin)
--maaslarinin dense_rankini tapin:
select department_id, job_id, salary, 
dense_rank() OVER (partition by department_id, job_id order by salary desc) as dn
from hr.employees


--TASK 5:
--Commission_pct sutunu bos olan sutunlarin icerisinden en tecrubeli 10 iscini gosterin:
select *
from (select first_name, hire_date,
dense_rank() OVER(order by hire_date) as dn
from hr.employees
where commission_pct is NULL)
where dn<=10

--TASK 6:
--o iscileri gosterin ki, oz departamentinin umumi maasinin yarisindan daha cox maas alsin:
select *
from (select first_name, salary, department_id,
sum(salary/2) OVER(partition by department_id) as s
from hr.employees)
where salary>s

--TASK 7:
--her bir iscinin oz departamentlerinin en tecrubeli iscisinden
--nece il az islediyini gosterin:
--analitik funksiya (min istifade ederek)
select first_name, department_id, hire_date, 
min(hire_date) OVER (partition by department_id) as m,
round((hire_date-min(hire_date) OVER (partition by department_id))/365,2) as ferq
from hr.employees

--TASK 8:
--her bir departamentin umumi maasi ile iscilerin maasinin ferqini gosterin:
select department_id, salary, 
sum(salary) OVER (partition by department_id) as sum,
(sum(salary) OVER (partition by department_id))-salary as ferq
from hr.employees

--TASK 9:
--her bir ay uzre ayriliqda iscilerin adini soyadini ise basladigi ayi ve umumi maaslari gosterin:
select first_name, last_name, to_char(hire_date, 'month'),  
sum(salary) OVER (partition by to_char(hire_date,'mm'))
from hr.employees

--TASK 10:
--her bir il uzre ayriliqda iscilerin adini soyadini ise basladigi ili ve umumi maaslari gosterin:
select first_name, last_name, to_char(hire_date, 'yyyy'),  
sum(salary) OVER (partition by to_char(hire_date,'yy'))
from hr.employees




















