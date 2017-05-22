using Presentation.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentation.ModelFirst
{
    public class ModelFirstPresenter : IPresentable
    {
        private PresentationEntities context;


        public ModelFirstPresenter()
        {
            context = new PresentationEntities();
        }
        public async Task Add20Entities()
        {
            for (int i = 0; i < 20; i++)
            {
                context.Categories.Add(new Category() { Name = $"Category{i}" });
            }

            await context.SaveChangesAsync();
        }

        public async Task ClearTable()
        {
            context.Categories.RemoveRange(context.Categories);
            await context.SaveChangesAsync();
        }

        public async Task DeleteEntity()
        {
            var firstThousandCategories = context.Categories.Take(1000).ToArray();
            context.Categories.RemoveRange(firstThousandCategories);
            await context.SaveChangesAsync();
        }

        public void Dispose()
        {
            if (context != null)
                context.Dispose();
        }

        public async Task UpdateEntity()
        {
            var firstCategory = context.Categories.FirstOrDefault();
            firstCategory.Name += " new 0";
            await context.SaveChangesAsync();
        }

        public async Task WhereExample()
        {
            var foundCategories = await context.Categories
                .Where(c => !c.Name.Contains("new")).ToListAsync();
            foreach (var category in foundCategories)
            {
                Console.WriteLine($"Category {category.Id}, {category.Name}");
            }
        }
    }
}
