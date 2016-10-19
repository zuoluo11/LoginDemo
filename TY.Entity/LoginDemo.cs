using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TY.Enum.LoginDemo
{
    public enum TableNames { Base_Module, Base_User }

    #region 枚举
    public enum Base_Module { ModuleId, ParentId, Category, Code, FullName, Icon, IconClass, Location, Target, Level, Isexpand, AllowButton, AllowView, AllowForm, Authority, DataScope, Remark, Enabled, SortCode, DeleteMark, CreateDate, CreateUserId, CreateUserName, ModifyDate, ModifyUserId, ModifyUserName }
    public enum Base_User { UserID, FullName, Email, Address, City, Country, Username, Password }
    #endregion
}