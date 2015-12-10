using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
namespace home.insurance.cn.FormUI._02Product
{
    public partial class Detail : System.Web.UI.Page
    {
        public string SiteUrl = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            SiteUrl = ConfigurationManager.AppSettings["SiteUrl"];
        }
    }
}