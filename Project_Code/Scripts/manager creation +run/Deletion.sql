/** created by hager and hadeer*/

use Examination_system

Alter table instructor 
Add isdeleted bit;

Alter table Course
Add isdeleted bit;

Alter table ins_teach_course
Add isdeleted bit;
select * from ins_teach_course
--proc for delete instructor
create proc SP_inst_is_deleted @username nvarchar(30), @ins_id int
as 
 begin 
  if (USER_NAME() =@username)
   begin
  update instructor
  set isdeleted =1
  where ins_id=@ins_id
   end
 end
------------------------------------------------------


--proc for delete course


Create Proc SP_Crs_is_deleted @username nvarchar(30), @Crs_id int
as 
begin
  if (User_name() =@username)
  begin
  update Course
  set isdeleted =1
  where Crs_id=@crs_id
  end
end
-------------------------------------------------------
--proc for delete instructor teach course


create proc SP_insteachcourse_isdeleted @username nvarchar(50), @crs_id int ,@ins_id int 
as
 begin
   if (USER_NAME() =@username)
  begin
  update ins_teach_course
  set isdeleted =1
  where Crs_id=@crs_id and ins_id=@ins_id
  end
 end

