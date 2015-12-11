using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace home.insurance.cn
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // 在应用程序启动时运行的代码
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            var error = this.Context.Server.GetLastError();
            var message = "Error Caught in Application_Error event\n" +
                "\nError in:" + Request.Url.ToString() +
                "\nError Message:" + error.Message +
                "\nError Source:" + error.Source +
                "\nError Data:" + error.Data.ToString() +
                "\nError InnerException:" + error.InnerException.ToString() +
                "\nStack Trace:" + error.StackTrace;

            I.Utility.Helper.LogHelper.AppError(message);
        }
    }
}