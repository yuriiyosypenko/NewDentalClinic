/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*Define two roles*/
insert into dbo.AspNetRoles (Id, Name) values ('AF51CCAE-8218-41E4-A7EF-8625ADB49801', 'Admin')
go
insert into dbo.AspNetRoles (Id, Name) values ('4551AD90-8C19-45DA-84E2-46B25F0E53A1', 'User')
go

/*Create admin (password:123456)*/
insert into dbo.AspNetUsers (Id, FirstName, LastName, Email, EmailConfirmed, PasswordHash, SecurityStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEndDateUtc, LockoutEnabled, AccessFailedCount, UserName)
values ('2A47C31C-93E2-4302-9FF3-265A461F3D1A', 'Иван', 'Иванов', 'admin@gmail.com', '0', 'AJqLNkWEe0FfEhr0Yk0PDVBALPivWmUxfVYRVnD6sBgp7YEM/1TP2jXwvQ2CgyaoLA==', '3a6c3aa7-8a23-4330-a9c3-82bdf0c62a4f', 'NULL', '0', '0', 'NULL', '0', '0', 'admin@gmail.com')
go

/*Give admin role to admin*/
insert into dbo.AspNetUserRoles (UserId, RoleId) values ('2A47C31C-93E2-4302-9FF3-265A461F3D1A', 'AF51CCAE-8218-41E4-A7EF-8625ADB49801')
go

/*Add procedures*/
insert into dbo."Procedure" (Id, Type, RequiredTime) values ('44e74131-14fd-41f9-86c8-ba0821e1af95', 'Пломбирование', '00:30:00')
go
insert into dbo."Procedure" (Id, Type, RequiredTime) values ('6e5a30e8-1634-42aa-aa95-b2e2dbfeb504', 'Пломбирование канала', '00:45:00')
go
insert into dbo."Procedure" (Id, Type, RequiredTime) values ('54cbaf1c-caa1-409c-b097-cac866d73ec5', 'Очистка от зубного камня', '00:20:00')
go
insert into dbo."Procedure" (Id, Type, RequiredTime) values ('f20d1f6d-bd65-4ede-8cab-9f0986ccfef3', 'Установка коронки', '01:00:00')
go
insert into dbo."Procedure" (Id, Type, RequiredTime) values ('77a1f2fe-e930-446d-9f6d-8977be41da7e', 'Протезирование', '01:30:00')
go