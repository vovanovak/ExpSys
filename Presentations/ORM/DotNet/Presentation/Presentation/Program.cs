using Presentation.CodeFirst;
using Presentation.DatabaseFirst;
using Presentation.Interfaces;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentation
{
    class Program
    {
        private static Stopwatch watch = new Stopwatch();
        private static readonly string separator = new string('-', 25);
        static void Main(string[] args)
        {
            TestCodeFirst();
            TestDatabaseFirst();
        }

        public async static Task MeasureTime(Stopwatch watch, Func<Task> action)
        {
            watch.Restart();
            await action();
            watch.Stop();
            Console.WriteLine($"{action.Method.Name} Execution Time: {watch.ElapsedMilliseconds}");
        }

        public static async Task Test(IPresentable presenter)
        {
            await MeasureTime(watch, presenter.ClearTable);
            await MeasureTime(watch, presenter.Add20Entities);
            await MeasureTime(watch, presenter.UpdateEntity);
            await MeasureTime(watch, presenter.DeleteEntity);
            await MeasureTime(watch, presenter.WhereExample);
        }   
        
        public static void TestCodeFirst()
        {
            Console.WriteLine("EF Code First test: ");

            using (var presenter = new CodeFirstPresenter())
            {
                Test(presenter).Wait();
            }

            Console.WriteLine(separator);
        }

        public static void TestDatabaseFirst()
        {
            Console.WriteLine("EF Database First test: ");

            using (var presenter = new DatabaseFirstPresenter())
            {
                Test(presenter).Wait();
            }

            Console.WriteLine(separator);
        }
    }
}
