insert into instructor(ins_name)
Values
         ('Mohammed Elsaid'),
		  ('Mostafa Mahmoud'),
		  ('Hadeer Nasr'),
		  ('Neama Mamdooh'),
		  ('Hager Mahmoud');
insert into instructor(ins_name)
Values 
               ('Yasser Galal');
select * from instructor
update instructor 
set MGR_ID = 2
where ins_id != 2

update instructor
set MGR_ID = 8
Where ins_id = 4
---------------------------

Select * from Course
insert into Course 
Values
('Testing', 'Software testing', 5, 10),
('Frontend', 'Front end Development', 5, 10),
('Software', 'Software course', 5, 10),
('Social Media', 'Social Media Marketing', 5, 10),
('Cyber Security', 'Cyber Security Network', 5, 10);
------------------------------------
select * from Student
insert into Student (Std_name)
Values   ('Heba'),
         ('Mohamed'),
         ('Kholoud'),
         ('Adham'),
		 ('Omar'),
		 ('Belal'),
		 ('Ali');
-----------------------------
 Select * from track

insert into track (Tr_name, Dep_name)
Values  ('Testing', 'Testing Dep'),
        ('Frontend', 'Frontend Dep'),
		('Software', 'Software Dep'),
		('Social Media', 'Social Media Dep'),
		('Cyber Security', 'Cyber Security Dep');
-------------------------------
Select * from branch
insert into branch (branch_name)
Values 
 ('Mansoura'),
 ('Aswan');

 update branch
 set MGR_ID =8
 Where branch_name = 'Mansoura'

 update branch
 set MGR_ID =2
 Where branch_name = 'Aswan'
---------------------------------

 Select * from exam
insert into Exam(Exam_type,msq_ques,text_ques)
     values ('regular',8,2)
insert into Exam(Exam_type,msq_ques)
   values ('regular',10),  ('Corrective',10)
insert into Exam(Exam_type,msq_ques,T_f_ques)
    values ('regular',5,5),  ('regular',5,5)
insert into Exam(Exam_type,allowance_obj,msq_ques,text_ques)
values ('regular','Caculator',8,2)
-------------------------
Select * from intake
insert into intake (intake_name)
values 
        ('T5'),
		('M5'),
		('CS5'),
		('SW5'),
		('FE5');
-----------------------------------
Select * from ins_teach_course
insert into ins_teach_course (Crs_id,ins_id,class)
Values (1,5,'A'),
       (2,4,'B'),
	   (3,2,'C'),
	   (5,3,'D'),
	   (4,1,'E');



insert into Accounts ([user_id], [role], pass)










