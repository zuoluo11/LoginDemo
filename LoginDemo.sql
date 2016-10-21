/*
Navicat SQL Server Data Transfer

Source Server         : .
Source Server Version : 100000
Source Host           : .:1433
Source Database       : LoginDemo
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 100000
File Encoding         : 65001

Date: 2016-10-21 16:04:33
*/


-- ----------------------------
-- Table structure for Base_Module
-- ----------------------------
DROP TABLE [Base_Module]
GO
CREATE TABLE [Base_Module] (
[ModuleId] varchar(50) NOT NULL ,
[ParentId] varchar(50) NULL DEFAULT ((0)) ,
[Category] varchar(50) NULL ,
[Code] varchar(50) NULL ,
[FullName] varchar(50) NULL ,
[Icon] varchar(50) NULL ,
[IconClass] varchar(50) NULL ,
[Location] varchar(200) NULL ,
[Target] varchar(50) NULL ,
[Level] int NULL ,
[Isexpand] int NULL ,
[AllowButton] int NULL ,
[AllowView] int NULL ,
[AllowForm] int NULL ,
[Authority] int NULL ,
[DataScope] int NULL ,
[Remark] varchar(200) NULL ,
[Enabled] int NULL DEFAULT ((1)) ,
[SortCode] int NULL ,
[DeleteMark] int NULL DEFAULT ((0)) ,
[CreateDate] datetime NULL DEFAULT (getdate()) ,
[CreateUserId] varchar(50) NULL ,
[CreateUserName] varchar(50) NULL ,
[ModifyDate] datetime NULL ,
[ModifyUserId] varchar(50) NULL ,
[ModifyUserName] varchar(50) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模块菜单表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模块菜单表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'ModuleId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模块主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'ModuleId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模块主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'ModuleId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'ParentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父级主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'ParentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'ParentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'Category')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Category'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Category'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'Code')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Code'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Code'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'FullName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'FullName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'FullName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'Icon')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'图标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Icon'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'图标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Icon'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'IconClass')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'图标样式类名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'IconClass'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'图标样式类名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'IconClass'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'Location')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'访问地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Location'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'访问地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Location'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'Target')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'目标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Target'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'目标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Target'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'Level')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'级别层次'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'级别层次'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'Isexpand')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'展开'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Isexpand'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'展开'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Isexpand'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'AllowButton')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'动态按钮'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'AllowButton'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'动态按钮'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'AllowButton'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'AllowView')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'动态视图'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'AllowView'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'动态视图'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'AllowView'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'AllowForm')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'动态表单'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'AllowForm'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'动态表单'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'AllowForm'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'Authority')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'访问权限'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Authority'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'访问权限'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Authority'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'DataScope')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据范围'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'DataScope'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据范围'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'DataScope'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'Remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'Enabled')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'有效'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Enabled'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'有效'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'Enabled'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'SortCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'SortCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'SortCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'DeleteMark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'删除标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'DeleteMark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'删除标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'DeleteMark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'CreateDate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'CreateDate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'CreateDate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'CreateUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建用户主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'CreateUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建用户主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'CreateUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'CreateUserName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'CreateUserName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'CreateUserName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'ModifyDate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'ModifyDate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'ModifyDate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'ModifyUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改用户主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'ModifyUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改用户主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'ModifyUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'Base_Module', 
'COLUMN', N'ModifyUserName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'ModifyUserName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改用户'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'Base_Module'
, @level2type = 'COLUMN', @level2name = N'ModifyUserName'
GO

-- ----------------------------
-- Records of Base_Module
-- ----------------------------
BEGIN TRANSACTION
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Table structure for Base_User
-- ----------------------------
DROP TABLE [Base_User]
GO
CREATE TABLE [Base_User] (
[UserID] nvarchar(50) NOT NULL ,
[FullName] nvarchar(50) NULL ,
[Email] nvarchar(50) NULL ,
[Address] nvarchar(100) NULL ,
[City] nvarchar(50) NULL ,
[Country] nvarchar(50) NULL ,
[Username] nchar(10) NULL ,
[Password] nchar(10) NULL 
)


GO

-- ----------------------------
-- Records of Base_User
-- ----------------------------
BEGIN TRANSACTION
GO
INSERT INTO [Base_User] ([UserID], [FullName], [Email], [Address], [City], [Country], [Username], [Password]) VALUES (N'2179ae52-7f89-46c9-8581-418120d7a21d', null, null, null, null, null, null, null), (N'63de5222-6903-4a2a-9aa1-38dc79468f03', N'432', N'12@q.com', N'432', null, N'AU', N'test      ', N'321       ')
GO
GO
COMMIT TRANSACTION
GO

-- ----------------------------
-- Indexes structure for table Base_Module
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Base_Module
-- ----------------------------
ALTER TABLE [Base_Module] ADD PRIMARY KEY NONCLUSTERED ([ModuleId])
GO

-- ----------------------------
-- Indexes structure for table Base_User
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Base_User
-- ----------------------------
ALTER TABLE [Base_User] ADD PRIMARY KEY ([UserID])
GO
