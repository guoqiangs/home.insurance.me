using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Web.Security;

using I.Utility.Helper;
using I.Utility.Extensions;
using X3;

using home.insurance.cn.Data;

namespace home.insurance.cn.FormUI
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var ip = UtilX3.GetRealIP();
            var mobile = this.txtMobile.Text.Trim();
            var password = this.txtPassword.Text.Trim();

            if (mobile.Length == 0 || password.Length == 0)
                return;

            if (mobile.Length > 11)
                mobile = mobile.Substring(0, 11);

            var service = new Repository();
            var count = service.GetUserInfoByMobile(mobile, ip);
            if (count == 0)
                return;//todo

            var saltPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(ConfigurationManager.AppSettings["salt"] + password, "MD5");

            var userInfo = new BaseInfo_UserInfo
            {
                Password = saltPassword,
                Mobile = mobile,
            };

            count = service.Login(userInfo);
            if (count > 0)
            {
                UtilX3.SetCookie(ConfigurationManager.AppSettings["cookieName"], userInfo.ID.ToString(), 30);
                Response.Redirect("../FormUI/04Order/List");
            }
        }
    }
}