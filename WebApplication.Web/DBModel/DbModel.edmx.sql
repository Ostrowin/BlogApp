
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/15/2018 14:12:42
-- Generated from EDMX file: E:\Projekty\BlogApp\WebApplication.Web\DBModel\DbModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [test];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[SalesLT].[FK_CustomerAddress_Address_AddressID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[CustomerAddress] DROP CONSTRAINT [FK_CustomerAddress_Address_AddressID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_CustomerAddress_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[CustomerAddress] DROP CONSTRAINT [FK_CustomerAddress_Customer_CustomerID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_Product_ProductCategory_ProductCategoryID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[Product] DROP CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_Product_ProductModel_ProductModelID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[Product] DROP CONSTRAINT [FK_Product_ProductModel_ProductModelID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[ProductModelProductDescription] DROP CONSTRAINT [FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_ProductModelProductDescription_ProductModel_ProductModelID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[ProductModelProductDescription] DROP CONSTRAINT [FK_ProductModelProductDescription_ProductModel_ProductModelID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_SalesOrderDetail_Product_ProductID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[SalesOrderDetail] DROP CONSTRAINT [FK_SalesOrderDetail_Product_ProductID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[SalesOrderDetail] DROP CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_SalesOrderHeader_Address_BillTo_AddressID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_SalesOrderHeader_Address_ShipTo_AddressID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID];
GO
IF OBJECT_ID(N'[SalesLT].[FK_SalesOrderHeader_Customer_CustomerID]', 'F') IS NOT NULL
    ALTER TABLE [SalesLT].[SalesOrderHeader] DROP CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[SalesLT].[Address]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[Address];
GO
IF OBJECT_ID(N'[SalesLT].[Customer]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[Customer];
GO
IF OBJECT_ID(N'[SalesLT].[CustomerAddress]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[CustomerAddress];
GO
IF OBJECT_ID(N'[SalesLT].[Product]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[Product];
GO
IF OBJECT_ID(N'[SalesLT].[ProductCategory]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[ProductCategory];
GO
IF OBJECT_ID(N'[SalesLT].[ProductDescription]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[ProductDescription];
GO
IF OBJECT_ID(N'[SalesLT].[ProductModel]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[ProductModel];
GO
IF OBJECT_ID(N'[SalesLT].[ProductModelProductDescription]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[ProductModelProductDescription];
GO
IF OBJECT_ID(N'[SalesLT].[SalesOrderDetail]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[SalesOrderDetail];
GO
IF OBJECT_ID(N'[SalesLT].[SalesOrderHeader]', 'U') IS NOT NULL
    DROP TABLE [SalesLT].[SalesOrderHeader];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Address'
CREATE TABLE [dbo].[Address] (
    [AddressID] int IDENTITY(1,1) NOT NULL,
    [AddressLine1] nvarchar(60)  NOT NULL,
    [AddressLine2] nvarchar(60)  NULL,
    [City] nvarchar(30)  NOT NULL,
    [StateProvince] nvarchar(50)  NOT NULL,
    [CountryRegion] nvarchar(50)  NOT NULL,
    [PostalCode] nvarchar(15)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Customer'
CREATE TABLE [dbo].[Customer] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [NameStyle] bit  NOT NULL,
    [Title] nvarchar(8)  NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [MiddleName] nvarchar(50)  NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Suffix] nvarchar(10)  NULL,
    [CompanyName] nvarchar(128)  NULL,
    [SalesPerson] nvarchar(256)  NULL,
    [EmailAddress] nvarchar(50)  NULL,
    [Phone] nvarchar(25)  NULL,
    [PasswordHash] varchar(128)  NOT NULL,
    [PasswordSalt] varchar(10)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'CustomerAddress'
CREATE TABLE [dbo].[CustomerAddress] (
    [CustomerID] int  NOT NULL,
    [AddressID] int  NOT NULL,
    [AddressType] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'Product'
CREATE TABLE [dbo].[Product] (
    [ProductID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ProductNumber] nvarchar(25)  NOT NULL,
    [Color] nvarchar(15)  NULL,
    [StandardCost] decimal(19,4)  NOT NULL,
    [ListPrice] decimal(19,4)  NOT NULL,
    [Size] nvarchar(5)  NULL,
    [Weight] decimal(8,2)  NULL,
    [ProductCategoryID] int  NULL,
    [ProductModelID] int  NULL,
    [SellStartDate] datetime  NOT NULL,
    [SellEndDate] datetime  NULL,
    [DiscontinuedDate] datetime  NULL,
    [ThumbNailPhoto] varbinary(max)  NULL,
    [ThumbnailPhotoFileName] nvarchar(50)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductCategory'
CREATE TABLE [dbo].[ProductCategory] (
    [ProductCategoryID] int IDENTITY(1,1) NOT NULL,
    [ParentProductCategoryID] int  NULL,
    [Name] nvarchar(50)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductDescription'
CREATE TABLE [dbo].[ProductDescription] (
    [ProductDescriptionID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(400)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductModel'
CREATE TABLE [dbo].[ProductModel] (
    [ProductModelID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CatalogDescription] nvarchar(max)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'ProductModelProductDescription'
CREATE TABLE [dbo].[ProductModelProductDescription] (
    [ProductModelID] int  NOT NULL,
    [ProductDescriptionID] int  NOT NULL,
    [Culture] nchar(6)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesOrderDetail'
CREATE TABLE [dbo].[SalesOrderDetail] (
    [SalesOrderID] int  NOT NULL,
    [SalesOrderDetailID] int IDENTITY(1,1) NOT NULL,
    [OrderQty] smallint  NOT NULL,
    [ProductID] int  NOT NULL,
    [UnitPrice] decimal(19,4)  NOT NULL,
    [UnitPriceDiscount] decimal(19,4)  NOT NULL,
    [LineTotal] decimal(38,6)  NOT NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- Creating table 'SalesOrderHeader'
CREATE TABLE [dbo].[SalesOrderHeader] (
    [SalesOrderID] int  NOT NULL,
    [RevisionNumber] tinyint  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [DueDate] datetime  NOT NULL,
    [ShipDate] datetime  NULL,
    [Status] tinyint  NOT NULL,
    [OnlineOrderFlag] bit  NOT NULL,
    [SalesOrderNumber] nvarchar(25)  NOT NULL,
    [PurchaseOrderNumber] nvarchar(25)  NULL,
    [AccountNumber] nvarchar(15)  NULL,
    [CustomerID] int  NOT NULL,
    [ShipToAddressID] int  NULL,
    [BillToAddressID] int  NULL,
    [ShipMethod] nvarchar(50)  NOT NULL,
    [CreditCardApprovalCode] varchar(15)  NULL,
    [SubTotal] decimal(19,4)  NOT NULL,
    [TaxAmt] decimal(19,4)  NOT NULL,
    [Freight] decimal(19,4)  NOT NULL,
    [TotalDue] decimal(19,4)  NOT NULL,
    [Comment] nvarchar(max)  NULL,
    [rowguid] uniqueidentifier  NOT NULL,
    [ModifiedDate] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AddressID] in table 'Address'
ALTER TABLE [dbo].[Address]
ADD CONSTRAINT [PK_Address]
    PRIMARY KEY CLUSTERED ([AddressID] ASC);
GO

-- Creating primary key on [CustomerID] in table 'Customer'
ALTER TABLE [dbo].[Customer]
ADD CONSTRAINT [PK_Customer]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [CustomerID], [AddressID] in table 'CustomerAddress'
ALTER TABLE [dbo].[CustomerAddress]
ADD CONSTRAINT [PK_CustomerAddress]
    PRIMARY KEY CLUSTERED ([CustomerID], [AddressID] ASC);
GO

-- Creating primary key on [ProductID] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [PK_Product]
    PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

-- Creating primary key on [ProductCategoryID] in table 'ProductCategory'
ALTER TABLE [dbo].[ProductCategory]
ADD CONSTRAINT [PK_ProductCategory]
    PRIMARY KEY CLUSTERED ([ProductCategoryID] ASC);
GO

-- Creating primary key on [ProductDescriptionID] in table 'ProductDescription'
ALTER TABLE [dbo].[ProductDescription]
ADD CONSTRAINT [PK_ProductDescription]
    PRIMARY KEY CLUSTERED ([ProductDescriptionID] ASC);
GO

-- Creating primary key on [ProductModelID] in table 'ProductModel'
ALTER TABLE [dbo].[ProductModel]
ADD CONSTRAINT [PK_ProductModel]
    PRIMARY KEY CLUSTERED ([ProductModelID] ASC);
GO

-- Creating primary key on [ProductModelID], [ProductDescriptionID], [Culture] in table 'ProductModelProductDescription'
ALTER TABLE [dbo].[ProductModelProductDescription]
ADD CONSTRAINT [PK_ProductModelProductDescription]
    PRIMARY KEY CLUSTERED ([ProductModelID], [ProductDescriptionID], [Culture] ASC);
GO

-- Creating primary key on [SalesOrderID], [SalesOrderDetailID] in table 'SalesOrderDetail'
ALTER TABLE [dbo].[SalesOrderDetail]
ADD CONSTRAINT [PK_SalesOrderDetail]
    PRIMARY KEY CLUSTERED ([SalesOrderID], [SalesOrderDetailID] ASC);
GO

-- Creating primary key on [SalesOrderID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [PK_SalesOrderHeader]
    PRIMARY KEY CLUSTERED ([SalesOrderID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AddressID] in table 'CustomerAddress'
ALTER TABLE [dbo].[CustomerAddress]
ADD CONSTRAINT [FK_CustomerAddress_Address_AddressID]
    FOREIGN KEY ([AddressID])
    REFERENCES [dbo].[Address]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAddress_Address_AddressID'
CREATE INDEX [IX_FK_CustomerAddress_Address_AddressID]
ON [dbo].[CustomerAddress]
    ([AddressID]);
GO

-- Creating foreign key on [BillToAddressID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID]
    FOREIGN KEY ([BillToAddressID])
    REFERENCES [dbo].[Address]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Address_BillTo_AddressID'
CREATE INDEX [IX_FK_SalesOrderHeader_Address_BillTo_AddressID]
ON [dbo].[SalesOrderHeader]
    ([BillToAddressID]);
GO

-- Creating foreign key on [ShipToAddressID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID]
    FOREIGN KEY ([ShipToAddressID])
    REFERENCES [dbo].[Address]
        ([AddressID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Address_ShipTo_AddressID'
CREATE INDEX [IX_FK_SalesOrderHeader_Address_ShipTo_AddressID]
ON [dbo].[SalesOrderHeader]
    ([ShipToAddressID]);
GO

-- Creating foreign key on [CustomerID] in table 'CustomerAddress'
ALTER TABLE [dbo].[CustomerAddress]
ADD CONSTRAINT [FK_CustomerAddress_Customer_CustomerID]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customer]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CustomerID] in table 'SalesOrderHeader'
ALTER TABLE [dbo].[SalesOrderHeader]
ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customer]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderHeader_Customer_CustomerID'
CREATE INDEX [IX_FK_SalesOrderHeader_Customer_CustomerID]
ON [dbo].[SalesOrderHeader]
    ([CustomerID]);
GO

-- Creating foreign key on [ProductCategoryID] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID]
    FOREIGN KEY ([ProductCategoryID])
    REFERENCES [dbo].[ProductCategory]
        ([ProductCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_ProductCategory_ProductCategoryID'
CREATE INDEX [IX_FK_Product_ProductCategory_ProductCategoryID]
ON [dbo].[Product]
    ([ProductCategoryID]);
GO

-- Creating foreign key on [ProductModelID] in table 'Product'
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID]
    FOREIGN KEY ([ProductModelID])
    REFERENCES [dbo].[ProductModel]
        ([ProductModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_ProductModel_ProductModelID'
CREATE INDEX [IX_FK_Product_ProductModel_ProductModelID]
ON [dbo].[Product]
    ([ProductModelID]);
GO

-- Creating foreign key on [ProductID] in table 'SalesOrderDetail'
ALTER TABLE [dbo].[SalesOrderDetail]
ADD CONSTRAINT [FK_SalesOrderDetail_Product_ProductID]
    FOREIGN KEY ([ProductID])
    REFERENCES [dbo].[Product]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SalesOrderDetail_Product_ProductID'
CREATE INDEX [IX_FK_SalesOrderDetail_Product_ProductID]
ON [dbo].[SalesOrderDetail]
    ([ProductID]);
GO

-- Creating foreign key on [ParentProductCategoryID] in table 'ProductCategory'
ALTER TABLE [dbo].[ProductCategory]
ADD CONSTRAINT [FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID]
    FOREIGN KEY ([ParentProductCategoryID])
    REFERENCES [dbo].[ProductCategory]
        ([ProductCategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID'
CREATE INDEX [IX_FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID]
ON [dbo].[ProductCategory]
    ([ParentProductCategoryID]);
GO

-- Creating foreign key on [ProductDescriptionID] in table 'ProductModelProductDescription'
ALTER TABLE [dbo].[ProductModelProductDescription]
ADD CONSTRAINT [FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID]
    FOREIGN KEY ([ProductDescriptionID])
    REFERENCES [dbo].[ProductDescription]
        ([ProductDescriptionID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID'
CREATE INDEX [IX_FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID]
ON [dbo].[ProductModelProductDescription]
    ([ProductDescriptionID]);
GO

-- Creating foreign key on [ProductModelID] in table 'ProductModelProductDescription'
ALTER TABLE [dbo].[ProductModelProductDescription]
ADD CONSTRAINT [FK_ProductModelProductDescription_ProductModel_ProductModelID]
    FOREIGN KEY ([ProductModelID])
    REFERENCES [dbo].[ProductModel]
        ([ProductModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SalesOrderID] in table 'SalesOrderDetail'
ALTER TABLE [dbo].[SalesOrderDetail]
ADD CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]
    FOREIGN KEY ([SalesOrderID])
    REFERENCES [dbo].[SalesOrderHeader]
        ([SalesOrderID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------