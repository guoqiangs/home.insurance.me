using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;
using I.Utility.Helper;
using I.Utility.Extensions;
using X3;

namespace home.insurance.cn.Data
{
    public class PageBase: System.Web.UI.Page
    {


        BaseInfo_UserInfo GetCurrentUser()
        {
            var cookie = UtilX3.GetCookie(ConfigurationManager.AppSettings["cookieName"]);

            if (cookie.IsNull())
                Response.Redirect("~/FormUI/Home");

            var service = new Repository();
            var userInfo = new BaseInfo_UserInfo();

            userInfo = service.GetUserInfoByID(cookie.ParseTo<int>());

            return userInfo;
        }

        public BaseInfo_UserInfo CurrentUser
        {
            get
            {
                return this.GetCurrentUser();
            }
        }
    }
}
