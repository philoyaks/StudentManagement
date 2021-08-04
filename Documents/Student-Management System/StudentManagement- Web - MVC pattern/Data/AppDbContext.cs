using Microsoft.EntityFrameworkCore;
using Practice.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace Practice.Data
{
    public class AppDbContext:DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options):base(options)
        {

        }

        public DbSet<StudentDetails> StudentDetails { get; set; }
        public DbSet<ClassName> ClassNames { get; set; }
    }
}
