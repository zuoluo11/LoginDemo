using CYQ.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace LoginDemo
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            AppConfig.Log.IsWriteLog = true;
            AppConfig.Log.LogPath = "自定义错误日志";

            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Login", action = "Index", id = UrlParameter.Optional }
            );

        }
    }
}