using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentation.CodeFirst
{
    public class ProductReview
    {
        public int Id { get; set; }
        public int? ProductId { get; set; }
        public virtual Product Product { get; set; }
        public int? ReviewerId { get; set; }
        public virtual User Reviewer { get; set; }
        public float Rating { get; set; }
        public string Review { get; set; }
    }
}
