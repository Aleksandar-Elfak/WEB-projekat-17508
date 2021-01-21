import { Movie } from "./movie.js";

export class Category{
    constructor(name, desc, id){
        this.movies = [];
        this.id = id;
        this.Name = name;
        this.Description = desc;
        this.container = null;
    }

    addMovie(name){
        this.movies.push(name);
    }

    draw(host){
        var el = document.querySelector(".list");
        host.removeChild(el);
        
        this.container = document.createElement("div");
        this.container.className = "list";
        host.appendChild(this.container);
        
        this.drawMovie(this.container);     
    }

    drawMovie(host){

        this.movies.forEach(element => {
            element.category = this;
            element.draw(host);
        });
    }

    findMovie(id){
        for (const element of this.movies) {
            if(element.id == id){
                return element;
            }
        }
    }

    findId(id){
        for (const iterator of this.movies) {
            if(iterator.id == id){
                return true;
            }
        }
    }
}