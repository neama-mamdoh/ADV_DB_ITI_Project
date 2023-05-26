--create manual exam 
exec Manual_exam 2,3,'corrective','allownce options',5,2,0,0,0

--add questions to manual exam
declare @manexam as man_exam2
insert into @manexam values (3,24,1,3,2),
							(4,24,1,3,2),(5,24,1,3,2),
							(6,24,1,3,2),(7,24,1,3,2),
							(8,24,1,3,2),(9,24,5,3,2);
exec set_manuel_exam_degree2 @manexam
select * from Exam_Ques_pool
--add questions to manual exam --when degree is more than course degree

exec Manual_exam 2,3,'corrective','allownce options',5,2,0,0,0
declare @manexam as man_exam2
insert into @manexam values (3,20,1,3,2),
							(4,20,1,3,2),(5,20,1,3,2),
							(6,20,1,3,2),(7,20,1,3,2),
							(8,20,1,3,2),(9,20,5,3,2);
exec set_manuel_exam_degree2 @manexam
select * from Exam_Ques_pool where exam_id=26
--create random exam
exec random_exam 2,3,'reqular','allownce options',5,2,0

--add questions to random exam
exec set_random_exam_degree 5,26,6,3,2
exec set_random_exam_degree 6,26,6,3,2
exec set_random_exam_degree 7,26,6,3,2
exec set_random_exam_degree 8,26,6,3,2
exec set_random_exam_degree 10,26,6,3,2


--show stuent answers
exec showstd_answers 'ahmedy1',1,2


--set student degree for specific exam
exec set_std_grade 'ahmedy1',1,2,8