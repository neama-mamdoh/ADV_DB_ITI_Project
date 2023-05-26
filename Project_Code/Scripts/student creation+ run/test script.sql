DECLARE @answers AS t;

insert into @answers values
(1,11,'d',2,'heba'),
(1,12,'c',2,'heba'),
(1,13,'c',2,'heba'),
(1,14,'d',2,'heba'),
(1,15,'b',2,'heba'),
(1,16,'c',2,'heba'),
(1,17,'c',2,'heba'),
(1,18,'c',2,'heba'),
(1,19,'b',2,'heba'),
(1,20,'c',2,'heba');

exec submit_My_Answers @answers;

select * from std_answer_exam_ques
select * from std_exam

