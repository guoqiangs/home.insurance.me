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
    public partial class Confirm : PageBase
    {
        /// <summary>
        /// 供前端页面显示具体产品信息使用
        /// </summary>
        public string productId = "0";
        
        /// <summary>
        /// 渲染页面使用
        /// </summary>
        public ViewModel.ConfirmModel viewModel = null;
        
        /// <summary>
        /// 订单号
        /// </summary>
        public string orderCode = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.CurrentUser == null)
                Response.Redirect(ConfigurationManager.AppSettings["SiteUrl"] + "FormUI/Home");

            if (!this.IsPostBack)
            {
                orderCode = this.Request.QueryString["ordercode"];

                var order = new Repository().GetOrderByCode(orderCode);
                productId = order.Order_ItemInfo.FirstOrDefault().ProductId;

                viewModel = new ViewModel.ConfirmModel();
                viewModel.OrderAmount = order.AmountPayable.ToString();
                viewModel.PolicyHolderName = order.Order_ItemInfo.FirstOrDefault().Order_PolicyHolder.FirstOrDefault().PolicyholderName;
                viewModel.PolicyHolderBirthday = "";//数据库中没有投保人生日
                viewModel.PolicyHolderIdentifyNumber = order.Order_ItemInfo.FirstOrDefault().Order_PolicyHolder.FirstOrDefault().IdentifyNumber;
                viewModel.PolicyHolderMobile = order.Order_ItemInfo.FirstOrDefault().Order_PolicyHolder.FirstOrDefault().Mobile;
                viewModel.PolicyHolderEmail = "";
                viewModel.PolicyStartDate = order.Order_ItemInfo.FirstOrDefault().Order_PolicyHolder.FirstOrDefault().StartDate.ToString();
                viewModel.PolicyEndDate = order.Order_ItemInfo.FirstOrDefault().Order_PolicyHolder.FirstOrDefault().EndDate.ToString();
                viewModel.PolicyRationCount = order.Order_ItemInfo.FirstOrDefault().Order_PolicyHolder.FirstOrDefault().RationCount.ToString();
                


            }
        }

        protected void NextBtn_Click(object sender, EventArgs e)
        {
            orderCode = this.Request.QueryString["ordercode"];

            if (orderCode != null)
            {
                //更新订单状态为 - wating 待支付
                new Repository().UpdateOrderStatus(orderCode, (int)EnumOrderStatus.Wating);

                Response.Redirect("pay.aspx?ordercode=" + orderCode);
                
            }

        }
    }
}