/** created by hager and hadeer*/

use Examination_system
select * from branch
select * from track
select * from intake
select * from branch_intake_track


--add student
Create proc SP_AddStudent @username_mgr nvarchar(50), @Std_name nvarchar(50),@intake_num int,
 @branch_num int, @Tr_id int, @MGR_ID int, @username_std nvarchar(50)
 as
 begin
  if (User_Name() =@username_mgr)
    begin
	 insert into Student (Std_name, intake_num, branch_num, Tr_id, MGR_ID, username)
	 values (@Std_name,@intake_num, @branch_num, @Tr_id, @MGR_ID,@username_std)
	end
 end

------------------------------------------------------------------------

 --add instructor
Create Proc SP_AddInstructor @username_mgr nvarchar(50), @inst_name nvarchar(50), 
@mgr_id int, @username_Inst nvarchar(50)
as
begin
  if (User_Name() =@username_mgr)
    begin
	 insert into instructor (ins_name, Mgr_id, Username)
	 values (@inst_name, @mgr_id, @username_Inst)
	end
end 
------------------------------------------------------------------------

--add course
Create Proc SP_AddCourse @username_mgr nvarchar(50), @Crs_name nvarchar(50), @Descriotion nvarchar(100),
@Max_degree int, @Min_degree int
as
begin
   if (User_Name() =@username_mgr)
    begin
	  insert into Course(Crs_name,Descriotion,Max_degree,Min_degree)
	  Values (@Crs_name, @Descriotion, @Max_degree, @Min_degree)
	end
end
-----------------------------------------------------------------------
--add instructor teach course
insert into ins_teach_course(Crs_id,ins_id,class)
values(1,2,'ca3')

Create Proc PS_Add_Ins_teach_course @username_mgr nvarchar(50),@Crs_id int, @ins_id int,
@class nvarchar(10)
as
begin
   if (User_Name() =@username_mgr)
    begin
	  insert into ins_teach_course(Crs_id,ins_id,class)
	  Values (@Crs_id, @ins_id, @class)
	end
end
------------------------------------------------------------------


--add intake
alter Proc PS_Addintake @username_mgr nvarchar(50),@intake_name nvarchar(50),
@mgr_id int
as
begin
   if (User_Name() =@username_mgr)
    begin
	  insert into intake (intake_name,MGR_ID)
	  values ( @intake_name,@mgr_id)
	end
end
-------------------------------------------------------------------

--add branch


Create Proc PS_Addbranch @username_mgr nvarchar(50), @branch_name nvarchar(50),@MGR_ID int
as
begin
  if (User_Name() =@username_mgr)
    begin
	  insert into branch(branch_name,MGR_ID)
	  values(@branch_name,@MGR_ID)
	end
end
-------------------------------------------------------------------
 
 --add track

Create Proc SP_Addtrack  @username_mgr nvarchar(50), @Tr_name nvarchar(50), @MGR_ID int,
@Dep_name nvarchar(50)
as
begin
  if (User_Name() =@username_mgr)
    begin
	  insert into track(Tr_name, MGR_ID, Dep_name)
	  Values (@Tr_name, @MGR_ID, @Dep_name)
	end
end

