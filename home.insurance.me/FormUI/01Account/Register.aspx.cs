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

namespace home.insurance.cn.FormUI._01Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var ip = UtilX3.GetRealIP();
            var name = this.txtName.Text.Trim();
            var password = this.txtPassword.Text.Trim();
            var mobile = this.txtPhone.Text.Trim();

            if (mobile.Length == 0 || name.Length == 0 || password.Length == 0)
                return;

            if (mobile.Length > 11)
                mobile = mobile.Substring(0, 11);

            var service = new Repository();
            var count = service.GetUserInfoByMobile(mobile, ip);
            if (count > 0)
                return;

            var saltPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(ConfigurationManager.AppSettings["salt"] + password, "MD5");

            var userInfo = new BaseInfo_UserInfo
            {
                Name = name,
                Password = saltPassword,
                Mobile = mobile,
                Status = 1,
                CreateIP = ip,
                CreateTime = DateTime.Now
            };

            service.AddUserInfo(userInfo);

            UtilX3.SetCookie(ConfigurationManager.AppSettings["cookieName"], userInfo.ID.ToString(), 30);

            Response.Redirect(ConfigurationManager.AppSettings["SiteUrl"] + "FormUI/04Order/List");
        }
    }
}