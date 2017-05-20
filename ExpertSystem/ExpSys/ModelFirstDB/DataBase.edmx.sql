
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/16/2017 12:18:46
-- Generated from EDMX file: C:\Users\user\ExpSys\ExpertSystem\ExpSys\ModelFirstDB\DataBase.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ExpSys];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ProfileSet'
CREATE TABLE [dbo].[ProfileSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [login] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserCategorySet'
CREATE TABLE [dbo].[UserCategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [Profile_Id] int  NULL
);
GO

-- Creating table 'UserRigthsSet'
CREATE TABLE [dbo].[UserRigthsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Profile_Id] int  NULL,
    [Operation_Id] int  NULL,
    [UserCategory_Id] int  NOT NULL
);
GO

-- Creating table 'OperationSet'
CREATE TABLE [dbo].[OperationSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [typeOfObject] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ActionSet'
CREATE TABLE [dbo].[ActionSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Profile_Id] int  NOT NULL,
    [Asessement_Id] int  NULL
);
GO

-- Creating table 'AsessementSet'
CREATE TABLE [dbo].[AsessementSet] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'InvitationSet'
CREATE TABLE [dbo].[InvitationSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Profile_Id] int  NOT NULL,
    [Asessement_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'ProfileSet'
ALTER TABLE [dbo].[ProfileSet]
ADD CONSTRAINT [PK_ProfileSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserCategorySet'
ALTER TABLE [dbo].[UserCategorySet]
ADD CONSTRAINT [PK_UserCategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserRigthsSet'
ALTER TABLE [dbo].[UserRigthsSet]
ADD CONSTRAINT [PK_UserRigthsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OperationSet'
ALTER TABLE [dbo].[OperationSet]
ADD CONSTRAINT [PK_OperationSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ActionSet'
ALTER TABLE [dbo].[ActionSet]
ADD CONSTRAINT [PK_ActionSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AsessementSet'
ALTER TABLE [dbo].[AsessementSet]
ADD CONSTRAINT [PK_AsessementSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'InvitationSet'
ALTER TABLE [dbo].[InvitationSet]
ADD CONSTRAINT [PK_InvitationSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Profile_Id] in table 'UserRigthsSet'
ALTER TABLE [dbo].[UserRigthsSet]
ADD CONSTRAINT [FK_ProfileUserRigths]
    FOREIGN KEY ([Profile_Id])
    REFERENCES [dbo].[ProfileSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfileUserRigths'
CREATE INDEX [IX_FK_ProfileUserRigths]
ON [dbo].[UserRigthsSet]
    ([Profile_Id]);
GO

-- Creating foreign key on [Profile_Id] in table 'UserCategorySet'
ALTER TABLE [dbo].[UserCategorySet]
ADD CONSTRAINT [FK_ProfileUserCategory]
    FOREIGN KEY ([Profile_Id])
    REFERENCES [dbo].[ProfileSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfileUserCategory'
CREATE INDEX [IX_FK_ProfileUserCategory]
ON [dbo].[UserCategorySet]
    ([Profile_Id]);
GO

-- Creating foreign key on [Operation_Id] in table 'UserRigthsSet'
ALTER TABLE [dbo].[UserRigthsSet]
ADD CONSTRAINT [FK_OperationUserRigths]
    FOREIGN KEY ([Operation_Id])
    REFERENCES [dbo].[OperationSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OperationUserRigths'
CREATE INDEX [IX_FK_OperationUserRigths]
ON [dbo].[UserRigthsSet]
    ([Operation_Id]);
GO

-- Creating foreign key on [UserCategory_Id] in table 'UserRigthsSet'
ALTER TABLE [dbo].[UserRigthsSet]
ADD CONSTRAINT [FK_UserCategoryUserRigths]
    FOREIGN KEY ([UserCategory_Id])
    REFERENCES [dbo].[UserCategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCategoryUserRigths'
CREATE INDEX [IX_FK_UserCategoryUserRigths]
ON [dbo].[UserRigthsSet]
    ([UserCategory_Id]);
GO

-- Creating foreign key on [Profile_Id] in table 'ActionSet'
ALTER TABLE [dbo].[ActionSet]
ADD CONSTRAINT [FK_ProfileEntity1]
    FOREIGN KEY ([Profile_Id])
    REFERENCES [dbo].[ProfileSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfileEntity1'
CREATE INDEX [IX_FK_ProfileEntity1]
ON [dbo].[ActionSet]
    ([Profile_Id]);
GO

-- Creating foreign key on [Profile_Id] in table 'InvitationSet'
ALTER TABLE [dbo].[InvitationSet]
ADD CONSTRAINT [FK_ProfileInvitation]
    FOREIGN KEY ([Profile_Id])
    REFERENCES [dbo].[ProfileSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfileInvitation'
CREATE INDEX [IX_FK_ProfileInvitation]
ON [dbo].[InvitationSet]
    ([Profile_Id]);
GO

-- Creating foreign key on [Asessement_Id] in table 'InvitationSet'
ALTER TABLE [dbo].[InvitationSet]
ADD CONSTRAINT [FK_AsessementInvitation]
    FOREIGN KEY ([Asessement_Id])
    REFERENCES [dbo].[AsessementSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AsessementInvitation'
CREATE INDEX [IX_FK_AsessementInvitation]
ON [dbo].[InvitationSet]
    ([Asessement_Id]);
GO

-- Creating foreign key on [Asessement_Id] in table 'ActionSet'
ALTER TABLE [dbo].[ActionSet]
ADD CONSTRAINT [FK_AsessementAction]
    FOREIGN KEY ([Asessement_Id])
    REFERENCES [dbo].[AsessementSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AsessementAction'
CREATE INDEX [IX_FK_AsessementAction]
ON [dbo].[ActionSet]
    ([Asessement_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------