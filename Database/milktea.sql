/*
 Navicat Premium Data Transfer

 Source Server         : SQL server
 Source Server Type    : SQL Server
 Source Server Version : 14001000
 Source Catalog        : milktea
 Source Schema         : main

 Target Server Type    : SQL Server
 Target Server Version : 14001000
 File Encoding         : 65001

 Date: 28/11/2019 14:04:50
*/


-- ----------------------------
-- Table structure for detailOrder
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[main].[detailOrder]') AND type IN ('U'))
	DROP TABLE [main].[detailOrder]
GO

CREATE TABLE [main].[detailOrder] (
  [idDetail] int  IDENTITY(1,1) NOT NULL,
  [idOrder] int  NULL,
  [idProduct] int  NULL,
  [numProduct] int  NULL
)
GO

ALTER TABLE [main].[detailOrder] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for employess
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[main].[employess]') AND type IN ('U'))
	DROP TABLE [main].[employess]
GO

CREATE TABLE [main].[employess] (
  [idEmp] int  IDENTITY(1,1) NOT NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [birth] date  NULL,
  [address] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [phone] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [idPosison] int  NOT NULL
)
GO

ALTER TABLE [main].[employess] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for order
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[main].[order]') AND type IN ('U'))
	DROP TABLE [main].[order]
GO

CREATE TABLE [main].[order] (
  [idOrder] int  IDENTITY(1,1) NOT NULL,
  [idEmp] int  NOT NULL,
  [timeOrder] int  NOT NULL,
  [idStatusOrder] int DEFAULT ((1)) NOT NULL,
  [idTable] int  NOT NULL
)
GO

ALTER TABLE [main].[order] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for posison
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[main].[posison]') AND type IN ('U'))
	DROP TABLE [main].[posison]
GO

CREATE TABLE [main].[posison] (
  [idPosison] int  IDENTITY(1,1) NOT NULL,
  [namePosison] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [main].[posison] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of posison
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [main].[posison] ON
GO

INSERT INTO [main].[posison] ([idPosison], [namePosison]) VALUES (N'1', N'Giám đốc'), (N'2', N'Quản lý'), (N'3', N'Nhân viên')
GO

SET IDENTITY_INSERT [main].[posison] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for product
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[main].[product]') AND type IN ('U'))
	DROP TABLE [main].[product]
GO

CREATE TABLE [main].[product] (
  [idProduct] int  IDENTITY(1,1) NOT NULL,
  [nameProduct] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [priceProduct] int  NOT NULL
)
GO

ALTER TABLE [main].[product] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for statusOrdor
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[main].[statusOrdor]') AND type IN ('U'))
	DROP TABLE [main].[statusOrdor]
GO

CREATE TABLE [main].[statusOrdor] (
  [idStatusOrder] int  IDENTITY(1,1) NOT NULL,
  [nameStatusOrder] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [main].[statusOrdor] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of statusOrdor
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [main].[statusOrdor] ON
GO

INSERT INTO [main].[statusOrdor] ([idStatusOrder], [nameStatusOrder]) VALUES (N'1', N'Chưa thanh toán'), (N'2', N'Đã thanh toán')
GO

SET IDENTITY_INSERT [main].[statusOrdor] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for statusTable
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[main].[statusTable]') AND type IN ('U'))
	DROP TABLE [main].[statusTable]
GO

CREATE TABLE [main].[statusTable] (
  [idStatusTable] int  IDENTITY(1,1) NOT NULL,
  [nameStatusTable] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [main].[statusTable] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of statusTable
-- ----------------------------
BEGIN TRANSACTION
GO

SET IDENTITY_INSERT [main].[statusTable] ON
GO

INSERT INTO [main].[statusTable] ([idStatusTable], [nameStatusTable]) VALUES (N'1', N'Còn chống'), (N'2', N'Có khách'), (N'3', N'Đặt trước'), (N'4', N'Bảo trì')
GO

SET IDENTITY_INSERT [main].[statusTable] OFF
GO

COMMIT
GO


-- ----------------------------
-- Table structure for table
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[main].[table]') AND type IN ('U'))
	DROP TABLE [main].[table]
GO

CREATE TABLE [main].[table] (
  [idTable] int  IDENTITY(1,1) NOT NULL,
  [idStatusTable] int  NOT NULL
)
GO

ALTER TABLE [main].[table] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Auto increment value for detailOrder
-- ----------------------------
DBCC CHECKIDENT ('[main].[detailOrder]', RESEED, 1)
GO


-- ----------------------------
-- Indexes structure for table detailOrder
-- ----------------------------
CREATE NONCLUSTERED INDEX [idOd]
ON [main].[detailOrder] (
  [idOrder] ASC
)
GO

CREATE NONCLUSTERED INDEX [idPr]
ON [main].[detailOrder] (
  [idProduct] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table detailOrder
-- ----------------------------
ALTER TABLE [main].[detailOrder] ADD CONSTRAINT [PK__detailOr__75EC3C0654EBE13C] PRIMARY KEY CLUSTERED ([idDetail])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for employess
-- ----------------------------
DBCC CHECKIDENT ('[main].[employess]', RESEED, 2)
GO


-- ----------------------------
-- Indexes structure for table employess
-- ----------------------------
CREATE NONCLUSTERED INDEX [idPs]
ON [main].[employess] (
  [idPosison] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table employess
-- ----------------------------
ALTER TABLE [main].[employess] ADD CONSTRAINT [PK__employes__3213E83F46F2B8CB] PRIMARY KEY CLUSTERED ([idEmp])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for order
-- ----------------------------
DBCC CHECKIDENT ('[main].[order]', RESEED, 1)
GO


-- ----------------------------
-- Indexes structure for table order
-- ----------------------------
CREATE NONCLUSTERED INDEX [idEmp]
ON [main].[order] (
  [idEmp] ASC
)
GO

CREATE NONCLUSTERED INDEX [idSO]
ON [main].[order] (
  [idStatusOrder] ASC
)
GO

CREATE NONCLUSTERED INDEX [idTbl]
ON [main].[order] (
  [idTable] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table order
-- ----------------------------
ALTER TABLE [main].[order] ADD CONSTRAINT [PK__person__C8AAF6FFAD15DCB5] PRIMARY KEY CLUSTERED ([idOrder])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for posison
-- ----------------------------
DBCC CHECKIDENT ('[main].[posison]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table posison
-- ----------------------------
ALTER TABLE [main].[posison] ADD CONSTRAINT [PK__posison__3680ED07C0B3B908] PRIMARY KEY CLUSTERED ([idPosison])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for product
-- ----------------------------
DBCC CHECKIDENT ('[main].[product]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table product
-- ----------------------------
ALTER TABLE [main].[product] ADD CONSTRAINT [PK__product__5EEC79D1F643403B] PRIMARY KEY CLUSTERED ([idProduct])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for statusOrdor
-- ----------------------------
DBCC CHECKIDENT ('[main].[statusOrdor]', RESEED, 2)
GO


-- ----------------------------
-- Primary Key structure for table statusOrdor
-- ----------------------------
ALTER TABLE [main].[statusOrdor] ADD CONSTRAINT [PK__statusOr__E2921A606FE58BBE] PRIMARY KEY CLUSTERED ([idStatusOrder])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for statusTable
-- ----------------------------
DBCC CHECKIDENT ('[main].[statusTable]', RESEED, 4)
GO


-- ----------------------------
-- Primary Key structure for table statusTable
-- ----------------------------
ALTER TABLE [main].[statusTable] ADD CONSTRAINT [PK__statusTa__7D7362E1B7A0E42F] PRIMARY KEY CLUSTERED ([idStatusTable])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for table
-- ----------------------------
DBCC CHECKIDENT ('[main].[table]', RESEED, 1)
GO


-- ----------------------------
-- Indexes structure for table table
-- ----------------------------
CREATE NONCLUSTERED INDEX [idST]
ON [main].[table] (
  [idStatusTable] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table table
-- ----------------------------
ALTER TABLE [main].[table] ADD CONSTRAINT [PK__ok__716BDE2432F42C51] PRIMARY KEY CLUSTERED ([idTable])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table detailOrder
-- ----------------------------
ALTER TABLE [main].[detailOrder] ADD CONSTRAINT [FK_detailOrder_order] FOREIGN KEY ([idOrder]) REFERENCES [main].[order] ([idOrder]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [main].[detailOrder] ADD CONSTRAINT [FK_detailOrder_product] FOREIGN KEY ([idProduct]) REFERENCES [main].[product] ([idProduct]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table employess
-- ----------------------------
ALTER TABLE [main].[employess] ADD CONSTRAINT [fk_employess_posison_1] FOREIGN KEY ([idPosison]) REFERENCES [main].[posison] ([idPosison]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table order
-- ----------------------------
ALTER TABLE [main].[order] ADD CONSTRAINT [FK_order_statusOrdor] FOREIGN KEY ([idStatusOrder]) REFERENCES [main].[statusOrdor] ([idStatusOrder]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [main].[order] ADD CONSTRAINT [FK_order_table] FOREIGN KEY ([idTable]) REFERENCES [main].[table] ([idTable]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [main].[order] ADD CONSTRAINT [FK_order_employess] FOREIGN KEY ([idEmp]) REFERENCES [main].[employess] ([idEmp]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table table
-- ----------------------------
ALTER TABLE [main].[table] ADD CONSTRAINT [FK_table_statusTable] FOREIGN KEY ([idStatusTable]) REFERENCES [main].[statusTable] ([idStatusTable]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

