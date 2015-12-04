using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace home.insurance.cn.Data
{
    public enum EnumOrderStatus
    {
        /// <summary>
        /// 0 未支付
        /// </summary>
        UnPay = 0,

        /// <summary>
        /// 1 等待支付
        /// </summary>
        Wating = 1,

        /// <summary>
        /// 2已支付
        /// </summary>
        Paid = 2,
        
        /// <summary>
        /// 3 完成订单
        /// </summary>
        Success = 3,

        /// <summary>
        /// 4 已失败
        /// </summary>
        Failed = 4
    }
}
