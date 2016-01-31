using NewsSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NewsSite.Migrations
{
    public class SeedData
    {
        public static Random Rand = new Random();

        public List<Category> Categories;

        public List<Article> Articles;

        public SeedData()
        {
            this.Categories = new List<Category>();
            Categories.Add(new Category() { Name = "Art" });
            Categories.Add(new Category() { Name = "Economy" });
            Categories.Add(new Category() { Name = "Technology" });
            Categories.Add(new Category() { Name = "Education" });
            Categories.Add(new Category() { Name = "Sports" });
            Categories.Add(new Category() { Name = "Science" });
            Categories.Add(new Category() { Name = "Weather" });

            AppUser user = new AppUser() { UserName = "Anonimous" };

        }
    }
}