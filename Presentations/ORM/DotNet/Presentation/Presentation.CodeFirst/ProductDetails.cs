using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentation.CodeFirst
{
    public class ProductDetails
    {
        public int Id { get; set; }
        public int? ProductId { get; set; }
        public virtual Product Product { get; set; }
        public double Price { get; set; }
        public double Discount { get; set; }
        public long Quantity { get; set; }
    }
}
