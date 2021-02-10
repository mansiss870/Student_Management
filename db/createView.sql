create view student_view as select roll_number,student.name as
name,address,city_code,city.name as city_name,gender,indian,date_of_birth from student inner join
city on city.code=student.city_code order by student.name;