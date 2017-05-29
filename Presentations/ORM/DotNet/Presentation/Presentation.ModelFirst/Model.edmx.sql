
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/23/2017 08:59:00
-- Generated from EDMX file: C:\Users\user\ExpSys\Presentations\ORM\DotNet\Presentation\Presentation.ModelFirst\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ModFirstDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ProductCategories_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductCategories] DROP CONSTRAINT [FK_ProductCategories_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductCategories_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductCategories] DROP CONSTRAINT [FK_ProductCategories_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Orders_dbo_Users_BuyerId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_dbo_Orders_dbo_Users_BuyerId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_Products_dbo_Orders_Order_Id]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_dbo_Products_dbo_Orders_Order_Id];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_ProductDetails_dbo_Products_Id]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductDetails] DROP CONSTRAINT [FK_dbo_ProductDetails_dbo_Products_Id];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_ProductReviews_dbo_Products_ProductId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductReviews] DROP CONSTRAINT [FK_dbo_ProductReviews_dbo_Products_ProductId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_ProductReviews_dbo_Users_ReviewerId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductReviews] DROP CONSTRAINT [FK_dbo_ProductReviews_dbo_Users_ReviewerId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[ProductDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductDetails];
GO
IF OBJECT_ID(N'[dbo].[ProductReviews]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductReviews];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[ProductCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductCategories];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TotalPrice] float  NOT NULL,
    [BuyerId] int  NULL,
    [DeliveryAddress] nvarchar(max)  NULL,
    [DeliveryType] int  NOT NULL
);
GO

-- Creating table 'ProductDetails'
CREATE TABLE [dbo].[ProductDetails] (
    [Id] int  NOT NULL,
    [ProductId] int  NULL,
    [Price] float  NOT NULL,
    [Discount] float  NOT NULL,
    [Quantity] bigint  NOT NULL
);
GO

-- Creating table 'ProductReviews'
CREATE TABLE [dbo].[ProductReviews] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ProductId] int  NULL,
    [ReviewerId] int  NULL,
    [Rating] real  NOT NULL,
    [Review] nvarchar(max)  NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Header] nvarchar(max)  NULL,
    [Description] nvarchar(max)  NULL,
    [CreatorId] int  NULL,
    [ProductDetailsId] int  NULL,
    [Order_Id] int  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NULL,
    [FullName] nvarchar(max)  NULL,
    [Phone] nvarchar(max)  NULL
);
GO

-- Creating table 'ProductCategories'
CREATE TABLE [dbo].[ProductCategories] (
    [Categories_Id] int  NOT NULL,
    [Products_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductDetails'
ALTER TABLE [dbo].[ProductDetails]
ADD CONSTRAINT [PK_ProductDetails]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductReviews'
ALTER TABLE [dbo].[ProductReviews]
ADD CONSTRAINT [PK_ProductReviews]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Categories_Id], [Products_Id] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [PK_ProductCategories]
    PRIMARY KEY CLUSTERED ([Categories_Id], [Products_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Categories_Id] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [FK_ProductCategories_Category]
    FOREIGN KEY ([Categories_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Products_Id] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [FK_ProductCategories_Product]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCategories_Product'
CREATE INDEX [IX_FK_ProductCategories_Product]
ON [dbo].[ProductCategories]
    ([Products_Id]);
GO

-- Creating foreign key on [BuyerId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_dbo_Orders_dbo_Users_BuyerId]
    FOREIGN KEY ([BuyerId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Orders_dbo_Users_BuyerId'
CREATE INDEX [IX_FK_dbo_Orders_dbo_Users_BuyerId]
ON [dbo].[Orders]
    ([BuyerId]);
GO

-- Creating foreign key on [Order_Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_dbo_Products_dbo_Orders_Order_Id]
    FOREIGN KEY ([Order_Id])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_Products_dbo_Orders_Order_Id'
CREATE INDEX [IX_FK_dbo_Products_dbo_Orders_Order_Id]
ON [dbo].[Products]
    ([Order_Id]);
GO

-- Creating foreign key on [Id] in table 'ProductDetails'
ALTER TABLE [dbo].[ProductDetails]
ADD CONSTRAINT [FK_dbo_ProductDetails_dbo_Products_Id]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProductId] in table 'ProductReviews'
ALTER TABLE [dbo].[ProductReviews]
ADD CONSTRAINT [FK_dbo_ProductReviews_dbo_Products_ProductId]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_ProductReviews_dbo_Products_ProductId'
CREATE INDEX [IX_FK_dbo_ProductReviews_dbo_Products_ProductId]
ON [dbo].[ProductReviews]
    ([ProductId]);
GO

-- Creating foreign key on [ReviewerId] in table 'ProductReviews'
ALTER TABLE [dbo].[ProductReviews]
ADD CONSTRAINT [FK_dbo_ProductReviews_dbo_Users_ReviewerId]
    FOREIGN KEY ([ReviewerId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_ProductReviews_dbo_Users_ReviewerId'
CREATE INDEX [IX_FK_dbo_ProductReviews_dbo_Users_ReviewerId]
ON [dbo].[ProductReviews]
    ([ReviewerId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------