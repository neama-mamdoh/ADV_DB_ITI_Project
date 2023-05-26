--drop database Examination_system
create database Examination_system

use Examination_system

create table instructor (
						 ins_id int primary key identity(1,1),	
						 ins_name nvarchar(30) not null,
						 MGR_ID int references instructor(ins_id)
)
---- --------------------------
create table branch (
						branch_num int primary key identity (1,1), 
						branch_name	nvarchar(20) not null,
						MGR_ID int references instructor(ins_id)	
)
-------------------------------------------
--drop table track
create table track (
						Tr_id int primary key identity (1,1), 
						Tr_name	nvarchar(20) not null,
						MGR_ID int references instructor(ins_id),
						Dep_name nvarchar(20)
)
-------------------------------------------
create table intake (
						intake_num int primary key identity (1,1), 
						intake_name	nvarchar(20) not null,
						MGR_ID int references instructor(ins_id)	
)
-----------------------------------------------
create table branch_intake_track (
						branch_num int references branch(branch_num),
						Tr_id int references track(Tr_id),
						intake_num int references intake(intake_num),
						primary key (branch_num,Tr_id,intake_num)		
)
-----------------------------------
create table Student(
					Std_id int primary key identity(1,1),
					Std_name nvarchar(50),
					intake_num int references intake(intake_num),
					branch_num int references branch(branch_num),
					Tr_id int references track(Tr_id),
					MGR_ID int references instructor(ins_id)	
)
----------------------------------------
create table Course(
					Crs_id int primary key identity(1,1),
					Crs_name nvarchar(50),
					Descriotion nvarchar(80),
					Min_degree int,
					Max_degree int
					)
--------------------------------------------
create table ins_teach_course (
						Crs_id int references Course (Crs_id),
						ins_id int references instructor(ins_id),
						class nvarchar(5),
						primary key (ins_id,Crs_id)
						)
---------------------------------------------
create table std_ins_crs(
						Crs_id int references Course (Crs_id),
						ins_id int references instructor(ins_id),
						Std_id int references Student(Std_id),
						primary key (Std_id,ins_id,Crs_id)
						)
----------------------------------------------------
create table Exam (
					exam_id int primary key identity (1,1),
					exam_type nvarchar(20) not null,
					exam_start datetime default(getdate()),
					exam_end datetime default(DATEADD(hour,1,getdate())),
					allowance_obj nvarchar(20),
					ins_id int references instructor(ins_id),
					T_f_ques int,
					msq_ques int,
					text_ques int
					)
--------------------------------------------------
create table Ques_pool(
						ques_num int primary key identity (1,1),
						ques_type nvarchar(20) not null,
						ques_text nvarchar(100) not null,
						ques_ans nvarchar(100) not null,
						Crs_id int references Course (Crs_id)
						)
--------------------------------------------
create table Exam_Ques_pool(
							ques_num int references Ques_pool (ques_num),
							exam_id int references Exam (exam_id),
							exam_degree int, 
							primary key (exam_id,ques_num)
							)
-------------------------------------------
 
 create table std_exam (
						exam_id int references Exam (exam_id),
						Std_id int references Student (Std_id),
						exam_date date default (getdate()),
						std_degree int,
						primary key (exam_id,Std_id)
						)
------------------------------------------
create table Ques_option (
							ques_num int references Ques_pool (ques_num),
							option_letter nvarchar(2),
							option_text nvarchar(50),
							primary key (ques_num,option_letter)
							)
-----------------------------------------------------------------------
create table std_answer_exam_ques(
									Std_id int references Student (Std_id),	
									ques_num int references Ques_pool (ques_num),
									std_answer nvarchar(100),
									primary key (Std_id,ques_num)
								)
------------------------------------------------
create table Accounts (
						username nvarchar(50) primary key ,
						[user_id] int unique not null,
						[role] nvarchar(50),
						pass nvarchar(20))
---------------------------------------------------------------------						
alter table student
drop column username
select * from std_exam;
select * from std_answer_exam_ques;
delete from std_answer_exam_ques;

alter table instructor
add username nvarchar(50) references accounts(username);

update instructor set username='ahmedy1' where ins_id=1;
update instructor set username='adamy2' where ins_id=2;
update instructor set username='mohamede3' where ins_id=3;
update instructor set username='mostafam4' where ins_id=4;
update instructor set username='hadeern5' where ins_id=5;
update instructor set username='neamam6' where ins_id=6;
update instructor set username='hagerm7' where ins_id=7;
update instructor set username='yasserg8' where ins_id=8;

alter table student
add username nvarchar(50) references accounts(username);

update Student set username='heba' where Std_id=1;
update Student set username='mohamed' where Std_id=2;
update Student set username='kholoud' where Std_id=3;
update Student set username='adham' where Std_id=4;
update Student set username='omar' where Std_id=5;
update Student set username='belal' where Std_id=6;
update Student set username='ali' where Std_id=7;

alter table std_answer_exam_ques
add exam_id int

alter table std_answer_exam_ques
add username nvarchar(50) references accounts(username) ;

alter table exam_ques_pool
add  crs_id int references course(Crs_id) ;

update Exam_Ques_pool
set crs_id=3
where exam_id=1;
update Exam_Ques_pool
set crs_id=2
where exam_id=2;

insert into std_ins_crs
values(2,4,1)

alter table std_exam
add username nvarchar(50) references accounts(username);