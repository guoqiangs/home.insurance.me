using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

using I.Utility.Helper;
using I.Utility.Extensions;
using home.insurance.cn.Data;

namespace home.insurance.cn.FormUI._04Order
{
    public partial class Pay : PageBase
    {
        public string orderCode = null;
        public Order_BaseInfo order = null;        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.CurrentUser == null)
                Response.Redirect(ConfigurationManager.AppSettings["SiteUrl"] + "FormUI/Home");

            if (!this.IsPostBack)
            {
                orderCode = this.Request.QueryString["orderCode"];

                order = new Repository().GetOrderByCode(orderCode);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            orderCode = this.Request.QueryString["orderCode"];
            
            //更新支付银行
            new Repository().UpdateOrderPayBank(orderCode, (int)EnumBank.Alipay);


            #region TODO by guoqiangs 开发跳过支付宝，直接支付成功，走后续投保操作 

            //order = new Repository().GetOrderByCode(orderCode);

            //string trade_no = "模拟支付宝返回交易码";//模拟支付宝支付成功返回交易码
            //var status = home.insurance.cn.Data.Pay.Do(order.Code, trade_no, order.AmountPayable.ToString(), DateTime.Now);
            //Response.Write(status.ToString());

            #endregion

            #region TODO by guoqiangs 上线替换成链接支付宝

            order = new Repository().GetOrderByCode(orderCode);
            var response = Alipay.CreateRequest(order);
            Response.Write(response);
            #endregion


        }
    }
}