/** created by hager and hadeer*/

use Examination_system


Create proc SP_Edit_inst  @username_mgr nvarchar(50),@inst_id int, @inst_name nvarchar(50), 
@mgr_id int,@username_inst nvarchar(50)
 as
 begin
 If (USER_NAME()= @username_mgr )
   begin
    update instructor 
	 set [ins_name]= @inst_name ,[MGR_ID]= @mgr_id, username= @username_inst
	 where [ins_id]= @inst_id
   end
 end
------------------------------------------------------------------------------------------

Create Proc  SP_Edit_course @username_mgr nvarchar(50),@Crs_name nvarchar(50), 
@Descriotion nvarchar(50), @Min_degree int, @Max_degree int
 as
 begin
   If (USER_NAME()= @username_mgr )
   begin
     update Course
	  set [Crs_name]= @Crs_name, [Descriotion]= @Descriotion, 
	  [Min_degree]= @Min_degree, [Max_degree]= @Max_degree
	  Where [Crs_name]= @Crs_name;
   end
 end
 ------------------------------------------------------------------------------------------


Create proc SP_Edit_ins_teach_course @username_mgr nvarchar(50), @Crs_id int, @ins_id int, @class nvarchar(50)
as
 begin
   If (USER_NAME()= @username_mgr )
   begin
     update ins_teach_course
	 set [Crs_id]= @Crs_id, [ins_id]= @ins_id, [class]= @class
	 where [ins_id]= @ins_id and Crs_id=@Crs_id
   end
end
----------------------------------------------------------------------------------------


Create Proc SP_Edit_branch @username_mgr nvarchar(50), @branch_num int , @branch_name nvarchar(50), @MGR_ID int
as
 begin
   If (USER_NAME()= @username_mgr )
   begin
     update SP_Edit_branch
	 set [branch_name]= @branch_name, [MGR_ID]= @MGR_ID, [branch_num]= @branch_num
	 Where [branch_num]= @branch_num
   end
end
---------------------------------------------------------------------------------------

Create Proc SP_Edit_track @username_mgr nvarchar(50), @Tr_id int, @Tr_name nvarchar(50), @MGR_ID int, @Dep_name nvarchar(50)
as
begin
 If (USER_NAME()= @username_mgr )
   begin
   update track 
   set [Tr_name]= @Tr_name, [MGR_ID]= @MGR_ID, [Dep_name]= @Dep_name 
   where [Tr_id]= @Tr_id
   end
end