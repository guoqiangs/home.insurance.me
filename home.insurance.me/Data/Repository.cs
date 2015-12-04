using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using I.Utility.Helper;
using I.Utility.Extensions;

using Newtonsoft.Json;

namespace home.insurance.cn.Data
{

    
    public class Repository
    {
       /// <summary>
       /// 更新支付银行
       /// </summary>
       /// <param name="ordercode"></param>
       /// <param name="bankId"></param>
       /// <returns></returns>
        public int UpdateOrderPayBank(string ordercode, int bankId)
        {
            int result = 0;
            using (var context = new EntityMember())
            {
                var query = context.Order_BaseInfo.Where(c => c.Code == ordercode).FirstOrDefault();
                if (query != null)
                {
                    query.BankId = bankId;
                    result = context.SaveChanges();
                }
            }
            return result;
        }

        /// <summary>
        /// 更新支付状态
        /// </summary>
        /// <param name="ordercode"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public int UpdateOrderStatus(string ordercode, byte status)
        {
            int result = 0;
            using (var context = new EntityMember())
            {
                var query = context.Order_BaseInfo.Where(c => c.Code == ordercode).FirstOrDefault();
                if (query != null)
                {                   
                    query.Status = status;
                    result = context.SaveChanges();
                }
            }
            return result;
        }

        /// <summary>
        /// 支付后更新数据库
        /// </summary>
        /// <param name="ordercode"></param>
        /// <param name="tradeNo"></param>
        /// <param name="paidAmount"></param>
        /// <param name="payTime"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public int UpdatePay(string ordercode,string tradeNo, string paidAmount,DateTime payTime,byte status)
        {
            int result = 0;
            using (var context = new EntityMember())
            {
                var query = context.Order_BaseInfo.Where(c => c.Code == ordercode).FirstOrDefault();
                if (query != null && query.Status == (int)EnumOrderStatus.Paid || query.Status == (int)EnumOrderStatus.Success)
                {
                    result = 1;
                    return result;
                }

                if (query != null)
                {
                    query.TradeNo = tradeNo;
                    query.PaidAmount = Convert.ToDecimal(paidAmount);
                    query.PayTime = payTime;
                    query.Status = status;
                    result = context.SaveChanges();
                }                
            }
            return result;
        }

        /// <summary>
        /// 获取单个订单
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        public Order_BaseInfo GetSingleOrderByCode(string code)
        {
            Order_BaseInfo order = null;
            try
            {
                using (var context = new EntityMember())
                {

                    var query = context.Order_BaseInfo
                        .Where(c => c.Code == code)
                        .FirstOrDefault();

                    order = query;
                }
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }
            return order;
        }

        /// <summary>
        /// 获取订单信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Order_BaseInfo GetOrderByID(int id)
        {
            Order_BaseInfo order = null;
            try
            {
                using (var context = new EntityMember())
                {

                    var query = context.Order_BaseInfo
                        .Include("BaseInfo_UserInfo")
                        .Include("Order_ItemInfo")
                        .Include("Order_ItemInfo.Order_PolicyHolder")
                        .Include("Order_ItemInfo.Order_PolicyHolder.Order_InsuredPerson")
                        .Include("Order_ItemInfo.Order_PolicyHolder.Order_InsuredPerson.Order_Beneficiary")
                        .Where(c => c.ID == id)
                        .FirstOrDefault();

                    order = query;
                }
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }
            return order;
        }

        /// <summary>
        /// 获取订单信息
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        public Order_BaseInfo GetOrderByCode(string code)
        {
            Order_BaseInfo order = null;
            try
            {
                using (var context = new EntityMember())
                {

                    var query = context.Order_BaseInfo
                        .Include("BaseInfo_UserInfo")
                        .Include("Order_ItemInfo")                        
                        .Include("Order_ItemInfo.Order_PolicyHolder")
                        .Include("Order_ItemInfo.Order_PolicyHolder.Order_InsuredPerson")
                        .Include("Order_ItemInfo.Order_PolicyHolder.Order_InsuredPerson.Order_Beneficiary")
                        .Where(c => c.Code == code)
                        .FirstOrDefault();

                    order = query;
                }
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }
            return order;
        }

        /// <summary>
        /// 下单操作
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public int AddOrder(Order_BaseInfo order)
        {
            int orderid = 0;
            try
            {
                using (var context = new EntityMember())
                {
                    context.Order_BaseInfo.Add(order);
                    orderid = context.SaveChanges();
                }

                //this.AddLog(JsonConvert.SerializeObject(order), "增加订单", 20, order.CreateMemberID.Value);
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }
            return orderid;
        }


        /// <summary>
        /// 获取订单列表
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public List<Order_BaseInfo> GetOrderList(int userId)
        {
            var list = new List<Order_BaseInfo>();

            try
            {
                using (var context = new EntityMember())
                {
                    var query = from f in context.Order_BaseInfo
                                where
                                    f.CreateMemberID == userId
                                orderby f.CreateTime descending
                                select f;

                    list = query.ToList();
                }
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }

            return list;
        }

        public void AddLog(string info, string memo, byte type, int createMemberId)
        {
            try
            {
                using (var context = new EntityMember())
                {
                    var log = new SYS_LogInfo
                    {
                        ActionMemo = memo,
                        ActionType = type,
                        CreateMemberID = createMemberId,
                        ActionMsg = info
                    };

                    context.SaveChanges();
                }
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }
        }

        public BaseInfo_UserInfo GetUserInfoByID(int id)
        {
            var userInfo = new BaseInfo_UserInfo();
            if (id <= 0)
                return userInfo;

            try
            {
                using (var context = new EntityMember())
                {
                    userInfo = (from x in context.BaseInfo_UserInfo
                                   where
                                        x.ID == id
                                   select x).FirstOrDefault();
                }

                this.AddLog(JsonConvert.SerializeObject(userInfo), "根据ID查询用户", 18, id);
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }

            return userInfo;
        }

        public void AddUserInfo(BaseInfo_UserInfo userInfo)
        {
            if (userInfo == null)
                return;

            try
            {
                using (var context = new EntityMember())
                {
                    context.BaseInfo_UserInfo.Add(userInfo);

                    context.SaveChanges();
                }

                this.AddLog(JsonConvert.SerializeObject(userInfo), "增加用户", 10, userInfo.ID);
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }
        }

        public int GetUserInfoByMobile(string mobile,string ip)
        {
            var returnValue = 0;
            if (mobile.IsNull())
                return returnValue;

            try
            {
                using (var context = new EntityMember())
                {
                    returnValue = (from x in context.BaseInfo_UserInfo
                                   where
                                     x.Mobile == mobile
                                   select x).Count();
                }

                this.AddLog(mobile, "ip :" + ip + " ,通过手机检查用户是否存在", 11, 0);
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }

            return returnValue;
        }

        public int Login(BaseInfo_UserInfo userInfo)
        {
            var returnValue = 0;
            if (userInfo != null)
                return returnValue;

            try
            {
                using (var context = new EntityMember())
                {
                    returnValue = (from x in context.BaseInfo_UserInfo
                                   where
                                        x.Mobile == userInfo.Mobile &&
                                        x.Password == userInfo.Password
                                   select x).Count();
                }

                this.AddLog(
                    userInfo.Mobile,
                    returnValue > 0 ? string.Format("用户{0}登录成功，时间{1}", userInfo.Mobile, DateTime.Now) :
                                    string.Format("用户{0}登录失败，时间{1}", userInfo.Mobile, DateTime.Now), 15, 0);
            }
            catch (Exception error)
            {
                LogHelper.AppError(error.Message);
            }

            return returnValue;
        }


        




    }
}
