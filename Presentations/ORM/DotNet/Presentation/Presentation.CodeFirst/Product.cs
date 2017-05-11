using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentation.CodeFirst
{
    public class Product
    {
        public int Id { get; set; }
        public string Header { get; set; }
        public string Description { get; set; }
        public int? CreatorId { get; set; }
        public virtual User Creator { get; set; }
        public int? ProductDetailsId { get; set; }
        public virtual ProductDetails ProductDetails { get; set; }
        public virtual IList<Category> Categories { get; set; }
        public virtual IList<ProductReview> Reviews { get; set; }
    }
}
