using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WEBlab1
{
    class Solver
    {
        private bool[,] matrix;
        public void GetMatrix()
        {
            int Num = 3;
            Paper[] paper = new Paper[Num];
            Paper[] paperBox = new Paper[Num];

            int a, b;
            Console.Write("paper");
            foreach (Paper p in paper)
            {
                a = Console.Read();
                b = Console.Read();
                p.SetDef(a, b);
            }

            Console.Write("paperBox");
            foreach (Paper pb in paperBox)
            {
                a = Console.Read();
                b = Console.Read();
                pb.SetDef(a, b);
            }

            this.matrix = new bool[Num, Num];

            for (int i = 0; i < Num; i++)
                for (int j = 0; j < Num; j++)
                    matrix[i, j] = paperBox[i].IsCompatible(paper[j]);
        }

        public bool Solve(int n)
        {
            for (int i = 0; i < matrix.Length; i++)
            {

            }
            return false;
        }

        public void PrintRes()
        {

        }

    }
}
