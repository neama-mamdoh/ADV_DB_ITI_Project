/** created by mostafa and ahmed*/

use Examination_system;
--create an exam in order to add to it th questions manuelly.
/*the system will send the crs ID & Ins ID automatically to the procedure and the instructor will enter the exam details,
in order to have an empty created exam to be able to add specific questions to it manuelly,and he must do this of his course only and after it is done the system will return a
message contians the exam ID.*/

create proc [dbo].[Manual_exam] @insid int,@crsid int,@examT nvarchar(20),@allow nvarchar(20),@mcqN int,@t_fN int,@textN int,@exam_start datetime,@exam_end datetime
as
begin
if (@insid = (select ins_id from ins_teach_course where Crs_id = @crsid))
begin
insert into Exam  (exam_type,exam_start,exam_end,allowance_obj,ins_id,T_f_ques,msq_ques,text_ques)
values (@examT,@exam_start,@exam_end,@allow,@insid,@t_fN,@mcqN,@textN)

declare @mag int
select @mag = (select top(1) exam_id from Exam order by exam_id desc  )

print 'Your Exam Id is' + str(@mag)
end
else
print 'You do not have premission to add exam to this course'
end


-- create user a user defined table to store multiple record on it.

create type man_exam2 as table (ques_num int,exam_id int,degree int,crs_id int,insid int)

--create a procedure 



alter proc [dbo].[set_manuel_exam_degree2] @manexam man_exam2 readonly 
as
begin 

declare @ques_num2 int, @exam_id2 int,@degree2 int,@crs_id2 int,@insid2 int

		select @ques_num2 = ques_num from @manexam
			select @exam_id2 = exam_id from @manexam
			select @degree2  = degree from @manexam
			select @crs_id2  = crs_id from @manexam
			select @insid2  = insid from @manexam

if (@insid2 = (select ins_id from ins_teach_course where Crs_id = @crs_id2)) 
begin
				begin tran f
	declare std_cur cursor
			for select ques_num,exam_id,degree,crs_id from @manexam
	
		declare @ques_num int, @exam_id int,@degree int,@crs_id int

		select @ques_num = ques_num from @manexam
			select @exam_id = exam_id from @manexam
			select @degree  = degree from @manexam
			select @crs_id  = crs_id from @manexam

			open std_cur 
			--3- fetch
			begin
				print @@Fetch_status
				-- @@Fetch_Status, has default -1
				--returns:
					-- 0 success 
					-- 1 failed  
					--2 no more rows to fetch
				fetch std_cur into @ques_num,@exam_id,@degree,@crs_id
				While @@fetch_status=0  
				begin
					insert into Exam_Ques_pool (ques_num,exam_id,exam_degree,crs_id) 
					values (@ques_num,@exam_id,@degree,@crs_id)

					fetch std_cur into @ques_num,@exam_id,@degree,@crs_id
				end
				end			
		--4-Close Cursoe
		close std_cur
		--5-deallocate
		deallocate std_cur
		commit 
		end
		else print 'You do not have premission to add questions to this exam'
end


/*to add the questions to an exam that it is created manuly with setting the degree of each question,the system will run the
below quesry and the parameters to be entered to the insert statment in one shot.*/
--run



--the below trigger prevents adding total degrees of an exam more than the course maximum degrees. (for the random exam)
alter trigger [dbo].[check_max] on [dbo].[Exam_Ques_pool]
  after  insert 
  as 
  begin 
  if  (select sum(exam_degree) from Exam_Ques_pool where exam_id = (select distinct exam_id from inserted))  
	 >= ((select [Max_degree]from Course where Crs_id=(select distinct crs_id from inserted) ))+1
		begin
		rollback
		print 'You exceed the Maximiun degree for this exam'
		  end
    end




