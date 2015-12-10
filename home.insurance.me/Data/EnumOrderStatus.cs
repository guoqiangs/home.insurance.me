﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using I.Utility.Extensions;
namespace home.insurance.cn.Data
{
    public enum EnumOrderStatus
    {
        /// <summary>
        /// 0 未支付
        /// </summary>
        [AttachData(EnmuRemark.Text, "未支付")]
        UnPay = 0,

        /// <summary>
        /// 1 等待支付
        /// </summary>
        [AttachData(EnmuRemark.Text, "等待支付")]
        Wating = 1,

        /// <summary>
        /// 2已支付
        /// </summary>
        [AttachData(EnmuRemark.Text, "已支付")]
        Paid = 2,

        /// <summary>
        /// 3 完成订单
        /// </summary>
        [AttachData(EnmuRemark.Text, "完成订单")]
        Success = 3,

        /// <summary>
        /// 4 已失败
        /// </summary>
        [AttachData(EnmuRemark.Text, "已失败")]
        Failed = 4
    }
}
