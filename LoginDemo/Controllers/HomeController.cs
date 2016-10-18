using CYQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TY.Service;

namespace LoginDemo.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(string username, string password)
        {
            string userId = "1";
            MAction action = new MAction(TableNames.Base_User);
            action.SetPara(Base_User.UserID, userId, System.Data.DbType.String);
            string where = "UserID=@UserID";
            action.Fill(where);
            string full = action.Get<string>(Base_User.FullName);
            return Content(full);
        }
        public ActionResult MainIndex()
        {
            return View();
        }

    }
}
