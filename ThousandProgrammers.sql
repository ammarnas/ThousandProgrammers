 CREATE DATABASE ThousandProgrammers


CREATE TABLE Users(
	UserId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Email nvarchar(50) NULL,
	Username nvarchar(50) NULL,
	Passwrod nvarchar(50) NULL);

	insert into Users values ('a@a.com','ammar','aaaaa');
	insert into Users values ('ab@ab.com','abdullah','ababab');
	insert into Users values ('sa@sa.com','saed','saedsaed');
	insert into Users values ('ob@ob.com','obada','3bada123');
	insert into Users values ('fa@fa.com','fadi','fadi123');
	insert into Users values ('abdalmohimen@gmail.com','abdalmohimen','abdalmohimen321');
	insert into Users values ('msalati@gmail.com','mohammed','mohammedAbc');
	insert into Users values ('mahmodAli@gmail.com','mahmodAli','usef123');
	insert into Users values ('khaled.emp@gmail.com','khaild','khaild');
	insert into Users values ('Omar.emp@gmail.com','3mar','3marAbc');

CREATE TABLE [Admin](
	AdminId   int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(50) NULL,
	LastName  nvarchar(50) NULL,
	LastLogin datetime NULL,
	UserId    int NULL,
	CONSTRAINT FK_User_Admin FOREIGN KEY (UserId) 
	REFERENCES Users (UserId));

	insert into [Admin] values ('abdalmohimen','abdalmohimen',2022-11-03,6);


	CREATE TABLE [Status](
	StatusId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Status nvarchar(50) NULL,
	Date Date NULL)

	insert into [Status] values ('Ready To Start','3-11-2022');
	insert into [Status] values ('Student','2022-11-03');
	insert into [Status] values ('Graduate','2022-11-03');


	CREATE TABLE Colleges(
	CollegeId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	CollegeName nvarchar(50) NULL,
	)
		
		
	insert into Colleges values ('Information engneering');



	CREATE TABLE Universities(
	UniversityId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	U_Name nvarchar(50) NULL)


	insert into Universities values ('Idleb');
	insert into Universities values ('Aleppo');
	insert into Universities values ('Sham');


	CREATE TABLE UniversityColleges(
	UniversityCollegesId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	UniversityId int NULL,
	CollegeId int NULL,
	Position nvarchar(50) NULL,
	CONSTRAINT FK_UniversityColleges_Colleges FOREIGN KEY (CollegeId) 
	REFERENCES Colleges (CollegeId),
	CONSTRAINT FK_UniversityColleges_Universities FOREIGN KEY (UniversityId) 
	REFERENCES Universities (UniversityId))


	insert into UniversityColleges values (1,1,'Idleb');
	insert into UniversityColleges values (2,1,'Izaz');
	insert into UniversityColleges values (3,1,'Izaz');




	CREATE TABLE Student(
	StudentId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	UniversityId int NULL,
	CollegeId int NULL,
	UserId int NULL,
	StatusId int NULL,
	CONSTRAINT FK_Student_Admin FOREIGN KEY (UserId) 
	REFERENCES Users (UserId),
	CONSTRAINT FK_Student_Status FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusId),
	CONSTRAINT FK_Student_Colleges FOREIGN KEY (CollegeId) 
	REFERENCES Colleges (CollegeId),
	CONSTRAINT FK_Student_Universities FOREIGN KEY (UniversityId) 
	REFERENCES Universities (UniversityId)
	);


	insert into Student values ('ammar','naser',1,1,1,1);
	insert into Student values ('abdullah','jbero',1,1,2,1);
	insert into Student values ('saed','hizraoy',3,1,3,1);
	insert into Student values ('Obada','halbi',2,1,4,1);
	insert into Student values ('fadi','halabi',2,1,5,1);



	
	CREATE TABLE Trainers(
	TrainerId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	Specialize nvarchar(50) NULL,
	UserId int NULL,
	CONSTRAINT FK_Trainers_Admin FOREIGN KEY (UserId) 
	REFERENCES Users (UserId));


	insert into Trainers values ('abdalmohimen','abdalmohimen','DB',6);
	insert into Trainers values ('mohammed','msalati','ASP.NET',7);
	insert into Trainers values ('mahmodAli','mohammed','Laravel',8);


	CREATE TABLE PreviousExperience(
	PreviousExperienceId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Titel nvarchar(50) NULL,
	Specialize nvarchar(50) NULL,
	Date date NULL,
	Donor nvarchar(50) NULL,
	TrainerId int NULL,
	CONSTRAINT FK_PreviousExperience_Trainers FOREIGN KEY (TrainerId) 
	REFERENCES Trainers (TrainerId));


	insert into PreviousExperience values ('C#','NET','2015-01-01','Microsft',2);
	insert into PreviousExperience values ('ASP','NET','2016-01-01','Microsft',2);
	insert into PreviousExperience values ('DB','Analays','2017-01-01','Oracal',1);
	insert into PreviousExperience values ('PHP','BackEnd','2018-01-01','Microsft',3);

	CREATE TABLE Course(
	CourseId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) NULL,
	CreatedByAdminId int NULL);

	insert into Course values ('Full stack NET',1)
	insert into Course values ('Full Stack Laravel',1)

	CREATE TABLE CourseStudents(
	CourseStudentsId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	StudentId int NULL,
	CourseId int NULL,
	CONSTRAINT FK_CourseStudents_Student FOREIGN KEY (StudentId) 
	REFERENCES Student (StudentId),
	CONSTRAINT FK_CourseStudents_Course FOREIGN KEY (CourseId) 
	REFERENCES Course (CourseId)
	);

	insert into CourseStudents values (2,1)
	insert into CourseStudents values (3,1)
	insert into CourseStudents values (4,2)
	insert into CourseStudents values (5,2)
	insert into CourseStudents values (6,2)

	CREATE TABLE Parts(
	PartId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	PartName nvarchar(50) NULL,
	TrainerId int NULL,
	CONSTRAINT FK_Parts_Trainers FOREIGN KEY (TrainerId) 
	REFERENCES Trainers (TrainerId));
	
	insert into Parts values ('CSharp',2)
	insert into Parts values ('ASP',2)
	insert into Parts values ('DB',1)
	insert into Parts values ('PHP',3)
	insert into Parts values ('Laravel',3)
	
	
	CREATE TABLE PartsOfCourse(
	PartsOfCourseId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	StartDate nvarchar(50) NULL,
	EndDate nvarchar(50) NULL,
	CourseId int NULL,
	PartId int NULL,
	CONSTRAINT FK_PartsOfCourse_Course FOREIGN KEY (CourseId) 
	REFERENCES Course (CourseId),
	CONSTRAINT FK_PartsOfCourse_Parts FOREIGN KEY (PartId) 
	REFERENCES Parts (PartId));
	
	
	insert into PartsOfCourse values ('1-1-2022','1-3-2022',1,1)
	insert into PartsOfCourse values ('1-4-2022','1-6-2022',1,2)
	insert into PartsOfCourse values ('1-2-2022','1-4-2022',2,3)
	insert into PartsOfCourse values ('1-5-2022','1-7-2022',2,4)

	
	CREATE TABLE CourseDays(
	DayId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Day] nvarchar(50) NULL,
	PartId int NULL,
	CONSTRAINT FK_CourseDays_Parts FOREIGN KEY (PartId) 
	REFERENCES Parts (PartId));


	insert into CourseDays values (1,1)
	insert into CourseDays values (3,1)
	insert into CourseDays values (5,1)
	insert into CourseDays values (7,1)
	insert into CourseDays values (2,1)
	insert into CourseDays values (4,1)
	insert into CourseDays values (6,1)


	CREATE TABLE Lectures(
	LectureId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title nvarchar(50) NULL,
	Notes nvarchar(50) NULL,
	PartsOfCourseId int NULL,
	CONSTRAINT FK_Lectures_PartsOfCourseId FOREIGN KEY (PartsOfCourseId) 
	REFERENCES PartsOfCourse (PartsOfCourseId)
	);

	insert into Lectures values ('introduction to cSharp','Start',1)
	insert into Lectures values ('condition stattement','if switch',1)
	insert into Lectures values ('introduction to cSharp','Start',1)
	insert into Lectures values ('introduction to cSharp','Start',1)

	CREATE TABLE Attendance(
	AttendanceId int NOT NULL,
	StudentId int NULL,
	LectureId int NULL,
	IsAttendance bit NULL,
	CONSTRAINT FK_Attendance_Lectures FOREIGN KEY (LectureId) 
	REFERENCES Lectures (LectureId),
	CONSTRAINT FK_Attendance_Student FOREIGN KEY (StudentId) 
	REFERENCES Student (StudentId)
	)

	insert into Attendance values (2,1,True)
	insert into Attendance values (3,1,False)
	insert into Attendance values (2,2,True)
	insert into Attendance values (3,2,True)
	insert into Attendance values (4,3,True)
	insert into Attendance values (5,3,False)
	insert into Attendance values (6,3,True)

	
	CREATE TABLE Assignments(
	AssignmentId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	StartDate date NULL,
	LastDate date NULL,
	Title nvarchar(50) NULL,
	LectureId int NULL,
	Timer time(7) NULL,
	TrainerId int NULL,
	CONSTRAINT FK_Assignments_Lecture FOREIGN KEY (LectureId) 
	REFERENCES Lectures (LectureId),
	CONSTRAINT FK_Assignments_Trainer FOREIGN KEY (TrainerId) 
	REFERENCES Trainers (TrainerId));


	insert into Assignments values ('2022-01-07','2022-01-08','First Assignments',1,'00:05:00',2)
	insert into Assignments values ('2022-01-10','2022-01-12','Second assignment',2,'00:05:00',3)


	CREATE TABLE Questions(
	QuestionId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Question nvarchar(50) NULL,
	AssignmentId int NULL,
	Grade nvarchar(50) NULL,
	CONSTRAINT FK_Questions_Assignments FOREIGN KEY (AssignmentId) 
	REFERENCES Assignments (AssignmentId));

	insert into Questions values ('print hello world',1,0)
	insert into Questions values ('sum two number',2,0)

	CREATE TABLE Answers(
	AnswerId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Answer nvarchar(50) NULL,
	QuestionId int NULL,
	StudentId int NULL,
	CONSTRAINT FK_Answers_Questions FOREIGN KEY (QuestionId) 
	REFERENCES Questions (QuestionId),
	CONSTRAINT FK_Answers_Student FOREIGN KEY (StudentId) 
	REFERENCES Student (StudentId));

	insert into Questions values ('hello world',1,2)
	insert into Questions values ('Hello World',1,3)
	insert into Questions values ('2+3',2,2)
	insert into Questions values ('4+5',2,3)

	CREATE TABLE Company(
	CompanyId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) NULL,
	Email nvarchar(50) NULL,
	address nvarchar(50) NULL)

	insert into Company values ('Micrsoft','micro@soft.com','America')
	insert into Company values ('LinkedIn','linke@In.com','America')


	CREATE TABLE Employees(
	EmployeeId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) NULL,
	CompanyId int NULL,
	UserId int NULL,
	CONSTRAINT FK_Employees_Admin FOREIGN KEY (UserId) 
	REFERENCES Users (UserId),
	CONSTRAINT FK_Employees_Company FOREIGN KEY (CompanyId) 
	REFERENCES Company (CompanyId));

	insert into Employees values ('khaild',1,1)
	insert into Employees values ('Omar',2,2)

	CREATE TABLE Jobs(
	JobId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Position nvarchar(50) NULL,
	Date date NULL,
	CompanyId int NULL,
	CONSTRAINT FK_Jobs_Company FOREIGN KEY (CompanyId) 
	REFERENCES Company (CompanyId));

	insert into Jobs values ('full stack dev','2022-01-05',1)
	insert into Jobs values ('front end','2022-07-07',1)
	insert into Jobs values ('back end','2022-01-06',2)

	CREATE TABLE Requirements(
	RequirementsId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Details nvarchar(50) NULL,
	JobId int NULL,
	CONSTRAINT FK_Requirements_Jobs FOREIGN KEY (JobId) 
	REFERENCES Jobs (JobId));

	insert into Requirements values ('asp.net',1)
	insert into Requirements values ('html',2)
	insert into Requirements values ('css',2)
	insert into Requirements values ('js',2)
	insert into Requirements values ('c#',3)
	insert into Requirements values ('sql',3)
	insert into Requirements values ('entity freamwork',3)


	CREATE TABLE Posts(
	PostId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Titel nvarchar(50) NULL,
	PostContent nvarchar(50) NULL,
	Date date NULL,
	Image nvarchar(50) NULL,
	CompanyId int NULL,
	EmployeeId int NULL,
	CONSTRAINT FK_Posts_Company FOREIGN KEY (CompanyId) 
	REFERENCES Company (CompanyId),
	CONSTRAINT FK_Posts_Employee FOREIGN KEY (EmployeeId) 
	REFERENCES Employees (EmployeeId),
	)

	insert into Posts values ('what is new in .NET 8','the new futuer in .NET 8 ','2022-02-11','/image/.NET8.png',1,2)
	insert into Posts values ('how to fast your query','top 3 wrong make yor query slowly','2022-12-02','/image/query.jpg',2,1)

	
	CREATE TABLE Comments(
	CommentId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	CommentContent nvarchar(50) NULL,
	Date date NULL,
	PostId int NULL,
	EmployeeId int NULL,
	CONSTRAINT FK_Comments_Post FOREIGN KEY (PostId) 
	REFERENCES Posts (PostId),
	CONSTRAINT FK_Comments_Employee FOREIGN KEY (EmployeeId) 
	REFERENCES Employees (EmployeeId),
	)

	insert into Comments values ('Wow','2022-02-11',1,1)
	insert into Comments values ('thanks it was very good','2022-02-12',3,2)
	
	
