import { Shop } from "./shop.js";
import { Category as Category } from "./category.js";
import { Movie } from "./movie.js";

fetch("https://localhost:5001/Server/ReadShop").then(p => {
    p.json().then(data =>{
        const shop = new Shop();
        data[0].categories.forEach(category => {
            const categ = new Category(category.name, category.description, category.id);
            category.movies.forEach(movie => {
                const m = new Movie(movie.name, movie.description, movie.image, movie.length, movie.score, movie.id);
                categ.addMovie(m);
            });
            shop.addCategory(categ);
        });
        shop.draw(document.body);
    });
});

// const shop = new Shop();

// let m;

// let a  = new Category("Action");





// shop.addCategory(a);
// a  = new Category("Adventure");
// shop.addCategory(a);
// a  = new Category("Comedy");
// shop.addCategory(a);
// a  = new Category("Crime");

// m = new Movie("The Godfather", "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
//     "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UY901_.jpg",
//     "2h 55min", "9.2/10", 1);

// a.addMovie(m);

// m = new Movie("Pulp Fiction", "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.", 
// "https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1055_.jpg",
// "2h 34min", "8.9/10", 2);

// a.addMovie(m);

// m = new Movie("The Silence of the Lambs", " A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.", 
// "https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UY867_.jpg",
// "1h 58min", "8.6/10", 3);

// a.addMovie(m);

// shop.addCategory(a);
// a  = new Category("Fantasy");
// shop.addCategory(a);
// a  = new Category("Horror");
// shop.addCategory(a);
// a  = new Category("Romance");
// shop.addCategory(a);
// a  = new Category("Sci-Fi");
// shop.addCategory(a);
// a  = new Category("Thriller");
// shop.addCategory(a);

// shop.draw(document.body);