using CYQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LoginDemo.Controllers
{
    public class EasyRememberController : Controller
    {
        //
        // GET: /EasyRemember/

        public ActionResult Index()
        {
            return View();
        }
        /// <summary>
        /// 新增
        /// </summary>
        /// <returns></returns>
        public ActionResult SubmitForm()
        {

            using (MAction action = new MAction("Base_MemoryInfo"))
            {

                bool result = false;
                if (string.IsNullOrEmpty(Request.Form["ID"]))
                {
                    DateTime today = DateTime.Now;
                    action.Set("CreateDate", DateTime.Now);
                    action.Set("AlertDate1", today.AddDays(1).ToString("yyyy-MM-dd"));
                    action.Set("AlertDate2", today.AddDays(2).ToString("yyyy-MM-dd"));
                    action.Set("AlertDate3", today.AddDays(3).ToString("yyyy-MM-dd"));
                    action.Set("AlertDate4", today.AddDays(7).ToString("yyyy-MM-dd"));
                    action.Set("AlertDate5", today.AddDays(15).ToString("yyyy-MM-dd"));
                    result = action.Insert(true);
                }
                else
                {
                    result = action.Update(true);
                }

                if (result)
                {
                    return Content("1");
                }
                else
                {
                    return Content("0");
                }

            }
        }
        /// <summary>
        /// 获得列表
        /// </summary>
        /// <returns></returns>
        public ActionResult GetDataList()
        {
            using (MAction action = new MAction("Base_MemoryInfo"))
            {
                string result = action.Select().ToJson();
                return Json(result);
            }

        }
        public ActionResult DeleteOne(int ID)
        {
            using (MAction action = new MAction("Base_MemoryInfo"))
            {
                if (action.Delete(ID))
                {
                    return Content("1");
                }
                else
                {
                    return Content("0");
                }

            }

        }


    }
}
