using Microsoft.EntityFrameworkCore;

namespace Server.Models
{

    public class ServerContext : DbContext
    {
        public DbSet<Shop> Shops { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Movie> Movies { get; set; }
        public ServerContext(DbContextOptions options) : base(options)
        {

        }
    }
}