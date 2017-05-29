using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WEBlab1
{
    class Program
    {
        static void Main(string[] args)
        {
            Solver s = new Solver();
            s.GetMatrix();
            s.Solve();
            s.PrintRes();
        }
    }
}
