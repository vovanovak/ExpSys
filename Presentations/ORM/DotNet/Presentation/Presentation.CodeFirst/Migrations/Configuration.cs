namespace Presentation.CodeFirst.Migrations
{
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Presentation.CodeFirst.AdvertismentDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(Presentation.CodeFirst.AdvertismentDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //

            if (!context.Categories.Any())
            {
                var categories = new string[] { "Clothes", "Food", "Hardware", "Phones", "Notebooks" };
                foreach (var category in categories)
                {
                    context.Categories.Add(new Category() { Name = category });
                }
                context.SaveChanges();
            }
        }
    }
}
