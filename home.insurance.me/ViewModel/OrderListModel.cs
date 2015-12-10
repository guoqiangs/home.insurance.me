using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace home.insurance.cn.ViewModel
{
    public class OrderListModel
    {
        
        public string CreateTime { get; set; }
        public string OrderCode { get; set; }
        public string PlanId { get; set; }
        public string ProductId { get; set; }
        public string ProductName { get; set; }
        public byte? Status { get; set; }
        public string OrderAmount { get; set; }
    
    }
}
