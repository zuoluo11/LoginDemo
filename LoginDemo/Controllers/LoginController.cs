using CYQ.Data;
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
            }
            return RedirectToAction("Index", "Login");
        }

    }
}
