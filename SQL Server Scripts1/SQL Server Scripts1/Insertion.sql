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


---------------------------------------------
select * from std_ins_crs;
insert into std_ins_crs(Std_id,ins_id,crs_id)
     values (1,2,3),(4,5,6),(5,3,5),(7,1,4);

--------------------------------------------
select * from branch_intake_track;
insert into branch_intake_track(branch_num,intake_num,Tr_id)
     values (1,1,4),(1,1,5),(1,1,6),(2,4,4),(2,4,5),(2,4,6),(2,1,4),(2,1,8),(2,1,7);
--------------------------------------------
select * from Exam_Ques_pool;
insert into Exam_Ques_pool(exam_id,ques_num,exam_degree)
     values (1,1,3),(1,2,2),(1,3,1),(1,4,1),(1,5,1),(1,6,1),(1,7,1),(1,8,1),(1,9,1),(1,10,1),
			(2,11,1),(2,12,1),(2,13,1),(2,14,1),(2,15,1),(2,16,1),(2,17,1),(2,18,1),(2,19,1),(2,20,1);
----------------------------------------------
select * from Accounts;
--students users
insert into Accounts(username,user_id,role,pass) values('heba',1,'student','pass12345');
insert into Accounts(username,user_id,role,pass) values('mohamed',2,'student','pass12341');
insert into Accounts(username,user_id,role,pass) values('kholoud',3,'student','pass12342');
insert into Accounts(username,user_id,role,pass) values('adham',4,'student','pass12343');
insert into Accounts(username,user_id,role,pass) values('omar',5,'student','pass12344');
insert into Accounts(username,user_id,role,pass) values('belal',6,'student','pass12346');
insert into Accounts(username,user_id,role,pass) values('ali',7,'student','pass12347');
--instructors users
insert into Accounts(username,user_id,role,pass) values('ahmedy1',911,'instructor','pass2461');
insert into Accounts(username,user_id,role,pass) values('adamy2',922,'manager','pass2462');
insert into Accounts(username,user_id,role,pass) values('mohamede3',933,'instructor','pass2463');
insert into Accounts(username,user_id,role,pass) values('mostafam4',944,'instructor','pass2464');
insert into Accounts(username,user_id,role,pass) values('hadeern5',955,'instructor','pass2465');
insert into Accounts(username,user_id,role,pass) values('neamam6',966,'instructor','pass2466');
insert into Accounts(username,user_id,role,pass) values('hagerm7',977,'instructor','pass2467');
insert into Accounts(username,user_id,role,pass) values('yasserg8',988,'manager','pass2468');

-----------------------------------------------------------------
alter trigger Encrypt_password
on dbo.Accounts
instead of insert
as
begin
declare @username nvarchar(50),@userid int,@role nvarchar(50),@pass varchar(500);
select @username=username from inserted;
select @userid=user_id from inserted;
select @role=role from inserted;
select @pass=pass from inserted;
insert into Accounts values(@username,@userid,@role,ENCRYPTBYPASSPHRASE('Pwd',@pass));
end




--Decryption code 
--select convert(varchar(200),DECRYPTBYPASSPHRASE('Pwd',pass)) as decryptPSW,convert(varbinary(500),pass) as password,* from Accounts

