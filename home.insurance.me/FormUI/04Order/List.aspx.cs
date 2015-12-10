using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;

using I.Utility.Helper;
using I.Utility.Extensions;
using X3;

using home.insurance.cn.Data;

namespace home.insurance.cn.FormUI._04Order
{
    public partial class List : PageBase
    {
        public string status = "0";
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.CurrentUser == null)
                Response.Redirect(ConfigurationManager.AppSettings["SiteUrl"] + "FormUI/Home");
             
            if (!this.Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this.Request.QueryString["status"]))
                {
                    status = this.Request.QueryString["status"];
                }                
                this.BindList(status);               
            }
        }

        void BindList(string status)
        {            
            int CreateMemberID = this.CurrentUser.ID;
                        
            List<ViewModel.OrderListModel> modelList = new List<ViewModel.OrderListModel>();

            try
            {
                List<Order_BaseInfo> orderlist = new Repository().GetOrderList(CreateMemberID);
                foreach (var order in orderlist)
                {
                    ViewModel.OrderListModel model = new ViewModel.OrderListModel();
                    model.CreateTime = order.CreateTime.ToString();
                    model.OrderCode = order.Code;
                    model.PlanId = order.Order_ItemInfo.FirstOrDefault().PlanId;
                    model.ProductId = order.Order_ItemInfo.FirstOrDefault().ProductId;
                    model.ProductName = order.Order_ItemInfo.FirstOrDefault().ProductName;
                    model.Status = order.Status;
                    model.OrderAmount = order.AmountPayable.ToString();
                    modelList.Add(model);
                }

                switch (status)
                {
                    case "0": break;
                    case "1": modelList = modelList.Where(c => c.Status == (int)EnumOrderStatus.UnPay || c.Status == (int)EnumOrderStatus.Wating || c.Status == (int)EnumOrderStatus.Failed).ToList(); break;
                    case "2": modelList = modelList.Where(c => c.Status == (int)EnumOrderStatus.Paid || c.Status == (int)EnumOrderStatus.Success).ToList(); break;
                }

                this.rpOrderList.DataSource = modelList;
                this.rpOrderList.DataBind();

            }
            catch (Exception ex)
            {
                I.Utility.Helper.LogHelper.AppError(string.Format("[订单列表加载异常]->CreateMemberID={0}&error={1}",
                    CreateMemberID, ex.Message));
            }

        }
    }
}