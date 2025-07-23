select * from hr.candidates;
select * from hr.employees;


select * from hr.employees e left join hr.candidates c on e.fullname = c.fullname;

select * from hr.employees e right join hr.candidates c on e.fullname = c.fullname;
