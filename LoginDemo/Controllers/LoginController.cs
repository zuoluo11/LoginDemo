using CYQ.Data;
using CYQ.Data.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TY.Enum.LoginDemo;


namespace LoginDemo.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/

        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public ActionResult Login(string username, string password)
        {
            if (Session["AdminLoginSun"] == null)
            {
                Session["AdminLoginSun"] = 1;
            }
            else
            {
                Session["AdminLoginSun"] = Convert.ToInt32(Session["AdminLoginSun"]) + 1;
            }
            //判断登录错误次数
            if (Session["AdminLoginSun"] != null && Convert.ToInt32(Session["AdminLoginSun"]) > 5)
            {
                Log.WriteLogToTxt("错误超过5次、IP所在城市");
                return Content("6");
            }

            string result = "0";
            using (MAction action = new MAction(TableNames.Base_User))
            {
                action.SetPara(Base_User.Username, username, System.Data.DbType.String);
                action.SetPara(Base_User.Password, password, System.Data.DbType.String);
                string where = "Username=@Username and Password=@Password";
                if (action.Exists(where))
                {
                    result = "1";
                }
            }
            return Content(result);
        }
        /// <summary>
        /// 注册用户
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public ActionResult Register()
        {
            using (MAction action = new MAction(TableNames.Base_User))
            {
                action.Insert(true);
                action.Data.ToEntity<TableNames>();
            }
            return RedirectToAction("Index", "Login");
        }


        /// <summary>
        /// 发送找回密码邮件
        /// </summary>
        /// <returns></returns>
        public string SendEmail(string email)
        {
            int IsOk = 0;
            string Message = string.Empty;


            //检查邮箱
            if (string.IsNullOrEmpty(email))
            {
                Message = "对不起，邮箱不可为空！";
                return Content(new JsonMessage { Success = false, Code = IsOk.ToString(), Message = Message }.ToString());
            }


            //检查用户信息
            Base_UserBll bll = new Base_UserBll();
            Base_User model = bll.Repository().FindEntity("Email", email);
            if (string.IsNullOrEmpty(model.UserId))
            {
                Message = "对不起，您输入的邮箱用户不存在！";
                return Content(new JsonMessage { Success = false, Code = IsOk.ToString(), Message = Message }.ToString());
            }
            else
            {
                //发送取回密码的短信或邮件
                #region 发送邮件==================

                ////生成随机码
                string strcode = Guid.NewGuid().ToString();
                ////获得邮件内容

                Base_MailTemplate mailModel = new Base_MailTemplateBll().Repository().FindEntity("CallIndex", "getpassword");
                if (string.IsNullOrEmpty(mailModel.MailTemplateGuid))
                {
                    Message = "邮件发送失败，邮件模板内容不存在！";
                    return Content(new JsonMessage { Success = false, Code = IsOk.ToString(), Message = Message }.ToString());
                }
                //检查是否重复提交

                Base_UserCodeBll codeBll = new Base_UserCodeBll();
                Base_UserCode codeModel;
                codeModel = codeBll.Repository().FindEntityBySql(string.Format(("select * from Base_UserCode where status=0 and datediff({0},EffTime,getdate())<=0 and UserId='{1}'"), "d", model.UserId));
                if (string.IsNullOrEmpty(codeModel.UserCodeGuid))
                {
                    codeModel = new Base_UserCode();
                    codeModel.Create();
                    //写入数据库
                    codeModel.UserId = model.UserId;
                    codeModel.UserName = model.RealName;
                    codeModel.Type = "FindPWD";
                    codeModel.StrCode = strcode;
                    codeModel.EffTime = DateTime.Now.AddDays(1);
                    codeModel.AddTime = DateTime.Now;
                    codeModel.Count = 0;
                    codeModel.Status = 0;
                    codeModel.UserIP = NetHelper.GetIPAddress();
                    codeBll.Repository().Insert(codeModel);
                }
                //替换模板内容
                string titletxt = mailModel.MailTitle;
                string bodytxt = mailModel.MailContent;
                titletxt = titletxt.Replace("{webname}", ConfigHelper.AppSettings("CustomerCompanyName"));
                titletxt = titletxt.Replace("{username}", model.RealName);
                bodytxt = bodytxt.Replace("{webname}", ConfigHelper.AppSettings("SoftName"));
                bodytxt = bodytxt.Replace("{valid}", "1");//有效期
                bodytxt = bodytxt.Replace("{username}", model.RealName);
                bodytxt = bodytxt.Replace("{webtel}", ConfigHelper.AppSettings("Contact"));
                bodytxt = bodytxt.Replace("{weburl}", "http://" + HttpContext.Request.Url.Authority.ToLower());

                bodytxt = bodytxt.Replace("{linkurl}", "http://" + HttpContext.Request.Url.Authority.ToLower()
                    + "/Login/Repassword?code=" + codeModel.StrCode);

                //发送邮件
                try
                {
                    NetHelper.SendEmail(model.Email, titletxt, bodytxt, true);
                }
                catch
                {
                    Message = "邮件发送失败，请联系本站管理员！";
                    return Content(new JsonMessage { Success = false, Code = IsOk.ToString(), Message = Message }.ToString());

                }
                Message = "邮件发送成功，请登录邮箱查看邮件！";
                IsOk = 1;
                return Content(new JsonMessage { Success = true, Code = IsOk.ToString(), Message = Message }.ToString());

                #endregion
            }



        }
    }



}
