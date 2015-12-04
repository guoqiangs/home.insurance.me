using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace home.insurance.cn.Data
{
    public static class Pay
    {
        /// <summary>
        /// 支付后更新
        /// </summary>
        /// <param name="ordercode"></param>
        /// <param name="payAccount"></param>
        /// <param name="payTime"></param>
        /// <returns></returns>
        public static EnumOrderStatus Do(string ordercode,string tradeNo, string payAccount,DateTime payTime)
        {
            ResultData resultData = new ResultData();

            var service = new home.insurance.cn.Data.Repository();
            var updateResult = service.UpdatePay(ordercode,tradeNo, payAccount.ToString(), payTime, (int)EnumOrderStatus.Paid);
            if (updateResult > 0)
            {
                var result = home.insurance.cn.Data.Policy.Do(ordercode);
                //更新订单状态为已投保
                if (result.Status == 1)
                {
                    service.UpdateOrderStatus(ordercode, (int)EnumOrderStatus.Success);
                    return EnumOrderStatus.Success;                  
                }
                else
                {
                    return EnumOrderStatus.Paid;
                }
            }
            else
            {
                return EnumOrderStatus.Failed;
            }
        }
       
    }
}
