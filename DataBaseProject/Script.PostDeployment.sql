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
insert into [dbo].[AspNetRoles] ([Id], [Name]) values (N'AF51CCAE-8218-41E4-A7EF-8625ADB49801', N'Admin')
go
insert into [dbo].AspNetRoles ([Id], [Name]) values (N'4551AD90-8C19-45DA-84E2-46B25F0E53A1', N'User')
go

/*Create admin (password:123456)*/
insert into [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName])
values (N'2A47C31C-93E2-4302-9FF3-265A461F3D1A', N'Иван', N'Иванов', N'admin@gmail.com', N'0', N'AJqLNkWEe0FfEhr0Yk0PDVBALPivWmUxfVYRVnD6sBgp7YEM/1TP2jXwvQ2CgyaoLA==', N'3a6c3aa7-8a23-4330-a9c3-82bdf0c62a4f', NULL, N'0', N'0', NULL, N'0', N'0', N'admin@gmail.com')
go

/*Give admin role to admin*/
insert into [dbo].[AspNetUserRoles] ([UserId], [RoleId]) values (N'2A47C31C-93E2-4302-9FF3-265A461F3D1A', N'AF51CCAE-8218-41E4-A7EF-8625ADB49801')
go

/*Add procedures*/
insert into [dbo].[Procedure] ([Id], [Type], [RequiredTime]) values (N'44e74131-14fd-41f9-86c8-ba0821e1af95', N'Пломбирование', N'00:30:00')
go
insert into [dbo].[Procedure] ([Id], [Type], [RequiredTime]) values (N'6e5a30e8-1634-42aa-aa95-b2e2dbfeb504', N'Пломбирование канала', N'00:45:00')
go
insert into [dbo].[Procedure] ([Id], [Type], [RequiredTime]) values (N'54cbaf1c-caa1-409c-b097-cac866d73ec5', N'Очистка от зубного камня', N'00:20:00')
go
insert into [dbo].[Procedure] ([Id], [Type], [RequiredTime]) values (N'f20d1f6d-bd65-4ede-8cab-9f0986ccfef3', N'Установка коронки', N'01:00:00')
go
insert into [dbo].[Procedure] ([Id], [Type], [RequiredTime]) values (N'77a1f2fe-e930-446d-9f6d-8977be41da7e', N'Протезирование', N'01:30:00')
go
