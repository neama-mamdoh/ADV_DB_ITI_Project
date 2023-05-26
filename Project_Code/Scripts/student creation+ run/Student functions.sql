/**created by neama*/

--instructor assign exam to student --we added it after disscution and didn't run it 
alter proc ins_assign_Exam @ins_username nvarchar(50),@std_id int,@exam_id int
as
begin
	if(USER_NAME()=@ins_username)
	begin
		insert into std_exam (Std_id,exam_id) values(@std_id,@exam_id)
	end
end

--student show assigned exams to him --we added it after disscution and didn't run it
create proc exam_assigned_to_std @std_username nvarchar(50),@std_id int
as
begin
	if(USER_NAME()=@std_username)
	begin
		select exam_id from std_exam where Std_id=@std_id
	end
end


CREATE TYPE t 
   AS TABLE
      (userid int,quesID int,ques_ans nvarchar(50),examid int,username nvarchar(50));


alter proc submit_My_Answers
@answers t READONLY
as
begin
	if(USER_NAME()=(select distinct username from @answers))
	begin
		if(select distinct Crs_id from Exam_Ques_pool where exam_id=(select distinct examid from @answers)) in
		(select Crs_id from std_ins_crs where Std_id=(select distinct userid from @answers))
		begin
			
			declare std_cur cursor
			for select userid,quesID,ques_ans,examid,username from @answers
			
			declare @userid int
			declare @quesID int
			declare @ques_ans nvarchar(50)
			declare @examid int
			declare @username nvarchar(50)

			select @userid=userid from @answers;
			select @quesID=quesID from @answers;
			select @ques_ans=ques_ans from @answers;
			select @examid=examid from @answers;
			select @username=username from @answers;
			open std_cur 
			--3- fetch
			begin
				print @@Fetch_status
				-- @@Fetch_Status, has default -1
				--returns:
					-- 0 success 
					-- 1 failed  
					--2 no more rows to fetch

				fetch std_cur into @userid,@quesID,@ques_ans,@examid,@username
				While @@fetch_status=0  
				begin
					insert into std_answer_exam_ques values(@userid,@quesID,@ques_ans,@examid,@username);
					fetch std_cur into @userid,@quesID,@ques_ans,@examid,@username
				end
			end
		--4-Close Cursoe
		close std_cur
		--5-deallocate
		deallocate std_cur

			insert into std_exam values((select distinct examid from @answers),(select distinct userid from @answers),SYSDATETIME(),0,USER_NAME());
			print 'exam submitted successfully';
		end
		else
		begin
			print 'you are not authorized to submit this exam';
		end
	end
end


alter trigger Check_Answers
on std_answer_exam_ques
after insert
as
begin
	declare s_cur cursor
	for select ques_num,std_answer from dbo.std_answer_exam_ques where username=USER_NAME()
	for read only  --read only or Update
	declare @std_id int
	declare @ques_num int
	declare @std_answer nvarchar(50)
	declare @count int
	declare @ques_mark int
	select @std_id=std_id from std_answer_exam_ques;
	set @count=0
	--2- open Cursor
	open s_cur 
	--3- fetch
	begin
		print @@Fetch_status
		-- @@Fetch_Status, has default -1
		--returns:
			-- 0 success 
			-- 1 failed  
			--2 no more rows to fetch

		fetch s_cur into @ques_num,@std_answer
		While @@fetch_status=0  
		begin
					if((select ques_ans from Ques_pool where ques_num=@ques_num)=@std_answer)
					begin
						select @ques_mark=exam_degree from Exam_Ques_pool where ques_num=@ques_num;
						set @count=@count+@ques_mark;
					end
					fetch s_cur into @ques_num,@std_answer
					
		end
	end
	update std_exam
	set std_degree=@count where username=USER_NAME();
	--4-Close Cursoe
	close s_cur
	--5-deallocate
	deallocate s_cur
end
go
create proc showstd_answers @username nvarchar(50),@std_id int,@examid int
as
begin
	if(USER_NAME()=@username)
	begin
		select * from std_answer_exam_ques
		where Std_id=@std_id and exam_id=@examid
	end
end

create proc set_std_grade @username nvarchar(50),@std_id int,@examid int,@degree int
as
begin
	if(USER_NAME()=@username)
	begin
		update std_exam
		set std_degree= @degree
		where Std_id=@std_id and exam_id=@examid
	end
end


