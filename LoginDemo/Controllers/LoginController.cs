using CYQ.Data;
using CYQ.Data.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
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

        public ActionResult Repassword(string code)
        {
            ViewBag.code = code;
            ViewBag.userName = "Amanda Smith";
            return View();
        }
        /// <summary>
        /// 重设密码
        /// </summary>
        /// <returns></returns>
        public string setPassword()
        {
            string id = "63de5222-6903-4a2a-9aa1-38dc79468f03";
            string result = "0";
            AppConfig.Debug.OpenDebugInfo = true;
            AppDebug.Start();
            using (MAction action = new MAction(TableNames.Base_User))
            {
                if (action.Fill(id))
                {
                    action.Update();
                    result = "1";
                }
               
            }
            //Console.WriteLine(AppDebug.Info);
            AppDebug.Stop();
            return result;
        }

        /// <summary>
        /// 发送找回密码邮件
        /// </summary>
        /// <returns></returns>
        public string SendEmail(string email)
        {
            string message = string.Empty;

            using (MAction action = new MAction(TableNames.Base_User))
            {
                action.SetPara("Email", email);
                if (action.Fill("Email=@Email"))
                {
                    ////生成随机码
                    string strcode = Guid.NewGuid().ToString();
                    string titletxt = "密码找回";
                    string bodytxt = "这是主体" + "http://" + HttpContext.Request.Url.Authority.ToLower()
                    + "/Login/Repassword?code=" + strcode;
                    try
                    {
                        SendEmail("309957373@qq.com", titletxt, bodytxt, true);
                        message = "发送成功";
                    }
                    catch (Exception)
                    {
                        message = "发送异常";

                    }
                }
                else
                {
                    message = "对不起，您输入的邮箱用户不存在！";
                }
            }
            return message;

        }

        #region 发送电子邮件
        /// <summary>
        /// 发送电子邮件,所有SMTP配置信息均在config配置文件中system.net节设置.
        /// </summary>
        /// <param name="receiveEmail">接收电子邮件的地址</param>
        /// <param name="msgSubject">电子邮件的标题</param>
        /// <param name="msgBody">电子邮件的正文</param>
        /// <param name="IsEnableSSL">是否开启SSL</param>
        public static bool SendEmail(string receiveEmail, string msgSubject, string msgBody, bool IsEnableSSL)
        {
            //创建电子邮件对象
            MailMessage email = new MailMessage();
            //设置接收人的电子邮件地址
            email.To.Add(receiveEmail);
            //设置邮件的标题
            email.Subject = msgSubject;
            //设置邮件的正文
            email.Body = msgBody;
            //设置邮件为HTML格式
            email.IsBodyHtml = true;
            email.From = new MailAddress("zuoluo11@qq.com");

            //创建SMTP客户端，将自动从配置文件中获取SMTP服务器信息
            SmtpClient smtp = new SmtpClient("smtp.qq.com");
            smtp.Credentials = new NetworkCredential("zuoluo11@qq.com", "dxtgkuzsirytbjbd");
            //开启SSL
            smtp.EnableSsl = IsEnableSSL;


            try
            {
                //发送电子邮件
                smtp.Send(email);

                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion
    }



}
