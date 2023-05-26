--delete instructor
exec SP_inst_is_deleted 'yasserg8', 3


--delete course
exec SP_Crs_is_deleted 'yasserg8', 3


--delete instructor teach course
 exec SP_insteachcourse_isdeleted 'yasserg8', 4,1

 --add student
 exec SP_AddStudent 'yasserg8','Eyad Mosaad', 1, 4, 1, 1,'eyad';

 --add instructor
 exec SP_AddInstructor 'yasserg8','Mera Ali', 8,'mera'

 --add course
 exec SP_AddCourse 'yasserg8','back_end','yujtrgedas',50,25

 --add instructor teach course
 exec PS_Add_Ins_teach_course 'yasserg8',1,2,'ca3'

 --add intake
 exec PS_Addintake 'yasserg8','intake 40',2

 --add branch
exec PS_Addbranch 'yasserg8','Assuit',5

--add track
exec SP_Addtrack 'yasserg8','css', 8, 'php'


--update instructor
exec SP_Edit_inst 'yasserg8',3,'mohamed elsaied',8,'mohamed3'

--update course
exec SP_Edit_course 'yasserg8',2,'frontend','front end development',5,10

--update instructor teach course
exec SP_Edit_ins_teach_course 'yasserg8',4,1,'D'

--update branch
exec SP_Edit_branch 'yasserg8',2,'Aswan',2

--update intake
exec SP_Edit_track 'yasserg8',4,'software testing',8,'testing dep'

