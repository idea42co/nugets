using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Data.Entity.ModelConfiguration.Configuration;
using $rootnamespace$.Samples;

namespace $rootnamespace$
{
    public class DataContext : DbContext
    {
        // Use this area to add DbSet's to your context.
        public DbSet<SampleModel> Samples { get; set; }

        static DataContext()
        {
            Database.SetInitializer<DataContext>(null);
        }

        public DataContext()
            : base("Name=DataContext")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Here, you can define your mappings. Do this in a seperate folder for bigger projects.   
            // But, if you are doing something simple, it's okay to do it here.
            modelBuilder.Entity<SampleModel>().HasKey(t => t.SampleModelID);
        }
    }
}
