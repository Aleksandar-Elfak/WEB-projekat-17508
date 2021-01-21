using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Server.Models;

namespace Server.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ServerController : ControllerBase
    {
        public ServerContext Context { get; set; }
        public ServerController(ServerContext context)
        {
            Context = context;
        }

        [Route("ReadShop")]
        [HttpGet]
        public async Task<List<Shop>> ReadShop()
        {
            return await Context.Shops.Include(p => p.Categories).ThenInclude(a => a.Movies).ToListAsync();
        }

        [Route("CreateShop")]
        [HttpPost]
        public async Task CreateShop([FromBody] Shop shop)
        {
            Context.Shops.Add(shop);
            await Context.SaveChangesAsync();
        }

        [Route("UpdateShop")]
        [HttpPut]
        public async Task UpdateShop([FromBody] Shop shop)
        {
            Context.Update<Shop>(shop);
            await Context.SaveChangesAsync();
        }

        [Route("DeleteShop")]
        [HttpDelete]
        public async Task DeleteShop(int id)
        {
            var shop = await Context.Shops.FindAsync(id);
            Context.Remove(shop);
            await Context.SaveChangesAsync();
        }

        [Route("ReadCategory")]
        [HttpGet]
        public async Task<List<Category>> ReadCategory()
        {
            return await Context.Categories.Include(p => p.Movies).ToListAsync();
        }

        [Route("CreateCategory/{shopID}")]
        [HttpPost]
        public async Task CreateCategory(int shopID, [FromBody] Category category)
        {
            var shop = await Context.Shops.FindAsync(shopID);
            category.Shop = shop;
            Context.Categories.Add(category);
            await Context.SaveChangesAsync();
        }

        [Route("CreateMovie/{categoryID}")]
        [HttpPost]
        public async Task<IActionResult> CreateMovie(int categoryID, [FromBody] Movie movie)
        {
            var category = await Context.Categories.FindAsync(categoryID);
            movie.Category = category;

            if (movie.Image == "" || movie.Category == null || movie.Description == "" || movie.Length == "" || movie.Name == "" || movie.Score == "")
            {
                return StatusCode(406);
            }
            else
            {
                Context.Movies.Add(movie);
                await Context.SaveChangesAsync();
                int a = movie.ID;
                return Ok(a);
            }
        }

        [Route("UpdateMovie")]
        [HttpPut]
        public async Task<IActionResult> UpdateMovie([FromBody] Movie movie)
        {
            if (movie.Image == "" || movie.Description == "" || movie.Length == "" || movie.Name == "" || movie.Score == "")
            {
                return StatusCode(406);
            }
            else
            {
                Context.Update<Movie>(movie);
                await Context.SaveChangesAsync();
                return Ok();
            }

        }

        [Route("DeleteMovie")]
        [HttpDelete]
        public async Task DeleteMovie(int id)
        {
            var movie = await Context.Movies.FindAsync(id);
            Context.Remove(movie);
            await Context.SaveChangesAsync();
        }
    }
}
