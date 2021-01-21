export class Movie{
    constructor(name, desc, img, length, score, id){
        this.name = name;
        this.desc = desc;
        this.img = img;
        this.length = length;
        this.score = score;
        this.container;
        this.id = id;
    }
    
    draw(host){
        const t = this;

        this.container = document.createElement("a");
        this.container.href = "#";
        this.container.onclick = ev => {
            this.fillEdit();
        }
        host.appendChild(this.container);

        const movieDisplay = document.createElement("div");
        movieDisplay.className = "movieDisplay";
        this.container.appendChild(movieDisplay);

        const img = document.createElement("img");
        img.className = "img";
        img.src = this.img;
        movieDisplay.appendChild(img);

        const info = document.createElement("div");
        info.className = "info";
        movieDisplay.appendChild(info);

        const name = document.createElement("div");
        name.className = "movieName";
        name.innerHTML = this.name;
        info.appendChild(name);

        const desc = document.createElement("div");
        desc.className = "movieDesc";
        desc.innerHTML = this.desc;
        info.appendChild(desc);

        const lenSco = document.createElement("div");
        lenSco.className = "lenSco";
        info.appendChild(lenSco);

        const len = document.createElement("div");
        len.className = "len";
        len.innerHTML = this.length;
        lenSco.appendChild(len);

        const Score = document.createElement("div");
        Score.className = "score";
        Score.innerHTML = this.score;
        lenSco.appendChild(Score);

        const deleteBtn = document.createElement("button");
        deleteBtn.className = "deleteBtn";
        deleteBtn.innerHTML = "Delete";
        deleteBtn.onclick = ev =>{
            this.deleteMovie();
            ev.stopPropagation();
        }
        lenSco.appendChild(deleteBtn);

    }

    fillEdit(){
        let a = document.querySelector(".img");
        a.src = this.img;

        a = document.querySelector(".editName");
        a.value = this.name;

        a = document.querySelector(".editDesc");
        a.value = this.desc;

        a = document.querySelector(".editLength");
        a.value = this.length;

        a = document.querySelector(".editScore");
        a.value = this.score;

        a = document.querySelector(".editImg");
        a.value = this.img;

        a = document.querySelector(".id");
        a.value = this.id;
        a.disabled = true;

        a = document.querySelector(".movieButton");
        a.innerHTML = "Update";

        a = document.querySelector(".comboBox");
        switch (this.category.Name) {
            case "Action":
                a.selectedIndex = 0;
                break;
            case "Comedy":
                a.selectedIndex = 1;
                break;
            case "Crime":
                a.selectedIndex = 2;
                break;
            case "Fantasy":
                a.selectedIndex = 3;
                break;
            case "Horror":
                a.selectedIndex = 4;
                break;
            case "Romance":
                a.selectedIndex = 5;
                break;
            case "Sci-Fi":
                a.selectedIndex = 6;
                break;
        }
        a.disabled = true;
    }

    deleteMovie(){

        fetch("https://localhost:5001/Server/DeleteMovie?id=" + this.id, {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json"
            }
        })
        

        const parent = this.container.parentNode;
        parent.removeChild(this.container);
        this.category.movies = this.category.movies.filter(el=>
            el.name !== this.name);

        let a = document.querySelector(".img");
        a.src = "https://templatelab.com/wp-content/uploads/2019/06/movie-poster-template-02.jpg";

        a = document.querySelector(".editName");
        a.value = "Movie Name";

        a = document.querySelector(".editDesc");
        a.value = "Movie Description";

        a = document.querySelector(".editLength");
        a.value = "Duration of the movie";

        a = document.querySelector(".editScore");
        a.value = "Movie Score";

        a = document.querySelector(".editImg");
        a.value = "Image Link";

        a = document.querySelector(".id");
        a.value = "ID";

        a = document.querySelector(".movieButton");
        a.innerHTML = "Add";

        a = document.querySelector(".comboBox");
        a.disabled = false;
    }
}