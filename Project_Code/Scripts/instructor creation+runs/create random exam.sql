/** created by mostafa and ahmed*/



-- create an exam and generate it's questions randomly .

/*the system will send the crs ID & Ins ID automatically to the procedure and the instructor will enter the exam details and 
the number of each question he/she wants then the system will create the exam and generate the question matching the number of
each type the instructor entered and he must do this of his course only and after it is done the system will return a
message contians the exam ID.*/

alter proc random_exam( @insid int,@crsid int,@examT nvarchar(20),@allow nvarchar(20), @mcqN int,@t_fN int,@textN int)
  
  as
  begin
  if (@insid = (select ins_id from ins_teach_course where Crs_id = @crsid)) 
  begin 
  insert into Exam (exam_type,allowance_obj,ins_id,T_f_ques,msq_ques,text_ques)
values (@examT,@allow,@insid,@t_fN,@mcqN,@textN)

  declare @mag int
select @mag = (select top(1) exam_id from Exam order by exam_id desc  )
  insert into Exam_Ques_pool (ques_num,exam_id,crs_id)

  select a.ques_num,a.exam_id,a.Crs_id
 from
(SELECT TOP (@t_fN) ques_num,exam_id,Crs_id FROM [dbo].[Ques_pool] ,Exam
where ques_type in('T_F') and Crs_id= @crsid and exam_id = @mag
ORDER BY NEWID()) as a
union 
select b.ques_num,b.exam_id,b.Crs_id from
(SELECT TOP (@mcqN) ques_num,exam_id,Crs_id FROM [dbo].[Ques_pool] ,Exam
where ques_type in('mcq') and Crs_id= @crsid and exam_id = @mag
ORDER BY NEWID()) as b
union 
select c.ques_num,c.exam_id,c.Crs_id from
(SELECT TOP (@textN) ques_num,exam_id,Crs_id FROM [dbo].[Ques_pool] ,Exam
where ques_type in('text') and Crs_id= @crsid and exam_id = @mag
ORDER BY NEWID()) as c


print 'Your Exam Id is' + str(@mag)
end
else
		print 'You do not have premission to add exam to this course' 

end

--run

--exec random_exam (instructor id),(course Id),(exam type),(allownce options),(number of Mcq ques),(number of true or false ques),(number of text ques)

-- the below procedure is to set the exam degeree of the questions that have been generated manuely.

alter proc [dbo].[set_random_exam_degree] @ques_num int,@exam_id int,@degree int,@crs_id int,@insid int 
as
begin 
	if ( (select sum(exam_degree)  from Exam_Ques_pool where exam_id =  @exam_id )+ @degree <=
  (select [Max_degree]  from Course where Crs_id= @crs_id ))
  begin
if (@insid = (select ins_id from ins_teach_course where Crs_id = @crs_id)) 
begin
	update Exam_Ques_pool 
	set exam_degree = @degree
	where ques_num = @ques_num and exam_id = @exam_id
		end
		end
		else print 'premission denied or you exceed the max number of degrees'
end

-- the below trigger prevents adding total degrees of an exam more than the course maximum degrees. (for the manuel exam)



