 CREATE DATABASE ThousandProgrammers


CREATE TABLE Users(
	UserId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Email nvarchar(50) NULL,
	Username nvarchar(50) NULL,
	Passwrod nvarchar(50) NULL);



CREATE TABLE [Admin](
	AdminId   int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(50) NULL,
	LastName  nvarchar(50) NULL,
	LastLogin datetime NULL,
	UserId    int NULL,
	CONSTRAINT FK_User_Admin FOREIGN KEY (UserId) 
	REFERENCES Users (UserId));


	CREATE TABLE [Status](
	StatusId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Status nvarchar(50) NULL,
	Date Date NULL)

	
	CREATE TABLE Colleges(
	CollegeId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	CollegeName nvarchar(50) NULL,
	)

	CREATE TABLE Universities(
	UniversityId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	U_Name nvarchar(50) NULL)

	CREATE TABLE UniversityColleges(
	UniversityCollegesId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	UniversityId int NULL,
	CollegeId int NULL,
	Position nvarchar(50) NULL,
	CONSTRAINT FK_UniversityColleges_Colleges FOREIGN KEY (CollegeId) 
	REFERENCES Colleges (CollegeId),
	CONSTRAINT FK_UniversityColleges_Universities FOREIGN KEY (UniversityId) 
	REFERENCES Universities (UniversityId))


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


	


	


	CREATE TABLE Trainers(
	TrainerId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	Specialize nvarchar(50) NULL,
	UserId int NULL,
	CONSTRAINT FK_Trainers_Admin FOREIGN KEY (UserId) 
	REFERENCES Users (UserId));



	CREATE TABLE PreviousExperience(
	PreviousExperienceId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Titel nvarchar(50) NULL,
	Specialize nvarchar(50) NULL,
	Date date NULL,
	Donor nvarchar(50) NULL,
	TrainerId int NULL,
	CONSTRAINT FK_PreviousExperience_Trainers FOREIGN KEY (TrainerId) 
	REFERENCES Trainers (TrainerId));


	CREATE TABLE Course(
	CourseId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) NULL,
	CreatedByAdminId int NULL);


	CREATE TABLE CourseStudents(
	CourseStudentsId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	StudentId int NULL,
	CourseId int NULL,
	CONSTRAINT FK_CourseStudents_Student FOREIGN KEY (StudentId) 
	REFERENCES Student (StudentId),
	CONSTRAINT FK_CourseStudents_Course FOREIGN KEY (CourseId) 
	REFERENCES Course (CourseId)
	);


	CREATE TABLE Parts(
	PartId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	PartName nvarchar(50) NULL,
	TrainerId int NULL,
	CONSTRAINT FK_Parts_Trainers FOREIGN KEY (TrainerId) 
	REFERENCES Trainers (TrainerId));
	
	
	
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

	
	CREATE TABLE CourseDays(
	DayId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Day] nvarchar(50) NULL,
	PartId int NULL,
	CONSTRAINT FK_CourseDays_Parts FOREIGN KEY (PartId) 
	REFERENCES Parts (PartId));



	CREATE TABLE Lectures(
	LectureId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Title nvarchar(50) NULL,
	Notes nvarchar(50) NULL,
	PartsOfCourseId int NULL,
	CONSTRAINT FK_Lectures_PartsOfCourseId FOREIGN KEY (PartsOfCourseId) 
	REFERENCES PartsOfCourse (PartsOfCourseId)
	);


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


	CREATE TABLE Questions(
	QuestionId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Question nvarchar(50) NULL,
	AssignmentId int NULL,
	Grade nvarchar(50) NULL,
	CONSTRAINT FK_Questions_Assignments FOREIGN KEY (AssignmentId) 
	REFERENCES Assignments (AssignmentId));


	CREATE TABLE Answers(
	AnswerId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Answer nvarchar(50) NULL,
	QuestionId int NULL,
	StudentId int NULL,
	CONSTRAINT FK_Answers_Questions FOREIGN KEY (QuestionId) 
	REFERENCES Questions (QuestionId),
	CONSTRAINT FK_Answers_Student FOREIGN KEY (StudentId) 
	REFERENCES Student (StudentId));


	CREATE TABLE Company(
	CompanyId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) NULL,
	Email nvarchar(50) NULL,
	address nvarchar(50) NULL)


	CREATE TABLE Employees(
	EmployeeId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name nvarchar(50) NULL,
	CompanyId int NULL,
	UserId int NULL,
	CONSTRAINT FK_Employees_Admin FOREIGN KEY (UserId) 
	REFERENCES Users (UserId),
	CONSTRAINT FK_Employees_Company FOREIGN KEY (CompanyId) 
	REFERENCES Company (CompanyId));


	CREATE TABLE Jobs(
	JobId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Position nvarchar(50) NULL,
	Date date NULL,
	CompanyId int NULL,
	CONSTRAINT FK_Jobs_Company FOREIGN KEY (CompanyId) 
	REFERENCES Company (CompanyId));


	CREATE TABLE Requirements(
	RequirementsId int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Details nvarchar(50) NULL,
	JobId int NULL,
	CONSTRAINT FK_Requirements_Jobs FOREIGN KEY (JobId) 
	REFERENCES Jobs (JobId));



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

	
	

	


	

	

	


	


	