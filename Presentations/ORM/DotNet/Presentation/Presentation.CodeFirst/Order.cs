using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentation.CodeFirst
{
    public class Order
    {
        public int Id { get; set; }
        public virtual IList<Product> Products { get; set; } 
        public double TotalPrice { get; set; } // Not Mapped
        public int? BuyerId { get; set; }
        public virtual User Buyer { get; set; }
        public string DeliveryAddress { get; set; }
        public DeliveryType DeliveryType { get; set; }
    }
}
