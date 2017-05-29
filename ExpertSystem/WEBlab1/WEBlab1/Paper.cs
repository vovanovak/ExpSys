using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WEBlab1
{
    class Paper
    {
        private int a, b;

        public void SetDef(int a, int b)
        {
            this.a = a;
            this.b = b;
        }

        public bool IsCompatible(Paper paper)
        {
            if ((paper.a <= this.a && paper.b <= this.b) ||
                (paper.a <= this.b && paper.b <= this.a))
                return true;
            return false;
        }

    }
}
