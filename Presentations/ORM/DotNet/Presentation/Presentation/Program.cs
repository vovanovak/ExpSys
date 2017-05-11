using Presentation.CodeFirst;
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
        static void Main(string[] args)
        {
            using (var ctx = new AdvertismentDbContext())
            {
                //var categories = new string[] { "Clothes", "Food", "Hardware", "Phones", "Notebooks" };
                //foreach(var category in categories)
                //{
                //    ctx.Categories.Add(new Category() { Name = category });
                //}
                //ctx.SaveChanges();
                
                //Clear
                var categories = ctx.Categories.ToArray();
                ctx.Categories.RemoveRange(categories);
                ctx.SaveChanges();

                var listCategoryNames = new List<string>();

                for (int i = 0; i < 100; i++)
                {
                    listCategoryNames.Add("category" + i);
                }

                Stopwatch watch = new Stopwatch();
                watch.Start();

                ctx.Categories.AddRange(listCategoryNames.Select(name => new Category() { Name = name }));
                //foreach(var category in listCategoryNames)
                //{
                //    ctx.Categories.Add(new Category { Name = category });
                //}
                ctx.SaveChanges();

                watch.Stop();


                Console.WriteLine("Elapsed: " + watch.ElapsedMilliseconds);
            }
        }
    }
}
