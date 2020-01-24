CREATE TABLE [dbo].[Registration] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [Title]       NVARCHAR (128)   NULL,
    [Start]       DATETIME         NULL,
    [UserId]      UNIQUEIDENTIFIER NULL,
    [ProcedureId] UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Registration_AspNetUsers] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Registration_Procedure] FOREIGN KEY ([ProcedureId]) REFERENCES [dbo].[Procedure] ([Id])
);

