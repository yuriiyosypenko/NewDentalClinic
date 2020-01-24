CREATE TABLE [dbo].[Procedure] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Type]         NVARCHAR (128)   NULL,
    [RequiredTime] TIME (7)         NULL,
    CONSTRAINT [PK_Procedure] PRIMARY KEY CLUSTERED ([Id] ASC)
);

