import { Category } from "./category.js";
import { Movie } from "./movie.js";

export class Shop{
    
    constructor(){
        this.categories = [];
        this.container = null;
        this.botbot;
    }

    addCategory(cat){
        this.categories.push(cat);
    }

    show(k, host){

        var name = document.querySelector(".formCategoryName");
        name.innerHTML = k.Name;

        var desc = document.querySelector(".formCategoryDesc");
        desc.innerHTML = k.Description;

        k.draw(host);
    }

    showAll(host){

        var name = document.querySelector(".formCategoryName");
        name.innerHTML = "All";

        var desc = document.querySelector(".formCategoryDesc");
        desc.innerHTML = "Movies from all categories in one place.";

        var el = document.querySelector(".list");
        host.removeChild(el);

        const list = document.createElement("div");
        list.className = "list";
        host.appendChild(list);

        this.categories.forEach(element => {
                element.drawMovie(list);
        });
    }

    draw(host){
        if(!host)
        throw new Error("Host is undefined");
        this.container = document.createElement("div");
        host.appendChild(this.container);
        this.container.className = "container";

        this.drawTop();
        this.drawBot();
    }

    drawTop(){
        const top = document.createElement("div");
        top.className = "top";
        top.innerHTML = "Movies";
        this.container.appendChild(top);
    }
    drawBot(){
        const bot = document.createElement("div");
        bot.className = "bot";
        this.container.appendChild(bot);

        const categ = document.createElement("ul");
        categ.className = "categories";

        bot.appendChild(categ);

        const botbot = document.createElement("div");
        botbot.className = "botbot";
        bot.appendChild(botbot);

        this.botbot = botbot;

        this.drawForm(botbot);

        const list = document.createElement("div");
        list.className = "list";
        botbot.appendChild(list);
        
        const allLink = document.createElement("a");
        allLink.className = "link";
        allLink.href = "#";
            
        const all = document.createElement("li");
        all.innerHTML = "All";
        all.className = "category";
            
        categ.appendChild(allLink);
        const shop = this;
        allLink.addEventListener("click", function(){shop.showAll(botbot);});
        allLink.appendChild(all);
        
        this.categories.forEach(element => {
            const link = document.createElement("a");
            link.className = "link";
            link.href = "#";

            const a = document.createElement("li");
            a.innerHTML = element.Name;
            a.className = "category";

            categ.appendChild(link);
            link.addEventListener("click", function(){shop.show(element, botbot);});
            link.appendChild(a);

        });        
    }

    drawForm(botbot){
        const form = document.createElement("div");
        form.className = "form";
        botbot.appendChild(form);

        const formCategory = document.createElement("div");
        formCategory.className = "formCategory";
        form.appendChild(formCategory);

        const formCategoryName = document.createElement("div");
        formCategoryName.className = "formCategoryName";
        formCategoryName.innerHTML = "All";
        formCategory.appendChild(formCategoryName);

        const formCategoryDesc = document.createElement("div");
        formCategoryDesc.className = "formCategoryDesc";
        formCategoryDesc.innerHTML = "Movies from all categories in one place.";
        formCategory.appendChild(formCategoryDesc);  

        this.drawFormMovie(form);
    }

    drawFormMovie(host){
        const formMovie = document.createElement("div");
        formMovie.className = "formMovie";
        host.appendChild(formMovie);

        this.drawformEdit(formMovie);

        this.drawFormButtons(formMovie);
    }

    drawformEdit(host){
        const movieEdit = document.createElement("div");
        movieEdit.className = "movieEdit";
        host.appendChild(movieEdit);

        const img = document.createElement("img");
        img.className = "img";
        img.src = "https://templatelab.com/wp-content/uploads/2019/06/movie-poster-template-02.jpg";
        movieEdit.appendChild(img);

        const movieData = document.createElement("div");
        movieData.className = "movieData";
        movieEdit.appendChild(movieData);

        const editName = document.createElement("input");
        editName.type = "text";
        editName.value = "Movie Name";
        editName.className = "editName";
        movieData.appendChild(editName);

        const editDesc = document.createElement("textarea");
        editDesc.className = "editDesc";
        editDesc.value = "Movie Description";
        movieData.appendChild(editDesc);

        const editOther = document.createElement("div");
        editOther.className = "editOther";
        movieData.appendChild(editOther);

        const editOtherOther = document.createElement("div");
        editOtherOther.className = "editOtherOther";
        editOther.appendChild(editOtherOther);

        const editLength = document.createElement("input");
        editLength.type = "text";
        editLength.value = "Duration of the movie";
        editLength.className = "editLength";
        editOtherOther.appendChild(editLength);

        const editScore = document.createElement("input");
        editScore.type = "text";
        editScore.value = "Movie Score";
        editScore.className = "editScore";
        editOtherOther.appendChild(editScore);
        
        const id = document.createElement("input");
        id.type = "number";
        id.className = "id";
        id.value = "ID";
        id.disabled = "true";
        editOtherOther.appendChild(id);
        
        const editImg = document.createElement("input");
        editImg.type = "text";
        editImg.value = "Image Link";
        editImg.className = "editImg";
        editOther.appendChild(editImg);
    }

    drawFormButtons(host){
        const movieButtons = document.createElement("div");
        movieButtons.className = "movieButtons";
        host.appendChild(movieButtons);
        
        const acceptButton = document.createElement("button");
        acceptButton.className = "movieButton";
        acceptButton.innerHTML = "Add";
        acceptButton.onclick = ev => {
            if(document.querySelector(".movieButton").innerHTML == "Update"){
                this.update();
            }else{
                this.addMovie();
            }
        }
        movieButtons.appendChild(acceptButton);

        const xButton = document.createElement("button");
        xButton.className = "movieButton";
        xButton.innerHTML = "X";
        const t = this;
        xButton.onclick = ev =>{
            this.defaultData();
        }
        movieButtons.appendChild(xButton);

        const comboBox = document.createElement("select")
        comboBox.className = "comboBox";
        movieButtons.appendChild(comboBox);

        this.categories.forEach(element => {
            const op = document.createElement("option");
            op.innerHTML = element.Name;
            op.value = element.Name;
            comboBox.appendChild(op);
        });
    }

    addMovie(){
        

        const name = document.querySelector(".editName").value;

        const desc = document.querySelector(".editDesc").value;

        const len = document.querySelector(".editLength").value;

        const score = document.querySelector(".editScore").value;

        const img = document.querySelector(".editImg").value;

        const id = 0;

        const a = document.querySelector(".comboBox").value;
        this.categories.forEach(element => {
            if(element.Name == a){
                fetch("https://localhost:5001/Server/CreateMovie/" + element.id, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        name: name,
                        id: id,
                        description: desc,
                        length: len,
                        score: score,
                        image: img
                    })
                }).then(p => {
                    if(p.ok){
                        p.json().then(q =>{
                            element.addMovie(new Movie(name, desc, img, len, score, q));
                        });
                    }
                    else if(p.status == 406){
                        alert("Input all informations.");
                    }
                }).catch(p=> {
                    alert("Error");
                });

                const categ = document.querySelector(".formCategoryName");
                if(categ.innerHTML == "All"){
                    this.showAll(this.botbot);
                }else{
                    for (const iterator of this.categories) {
                        if(iterator.Name == categ.innerHTML){
                            this.show(iterator, this.botbot);
                        }
                    }
                }
                this.defaultData();
            }
        });
    }

    findId(id){
        for (const iterator of this.categories) {
            let a = iterator.findId(id);
            if(a){
                return true;
            }
        }
    }

    update(){
        let movie = this.findMovie(document.querySelector(".id").value)
        if(movie != null){
            const name = document.querySelector(".editName").value;

            const desc = document.querySelector(".editDesc").value;

            const len = document.querySelector(".editLength").value;

            const id = document.querySelector(".id").value;

            const score = document.querySelector(".editScore").value;

            const img = document.querySelector(".editImg").value;

            fetch("https://localhost:5001/Server/UpdateMovie", {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    name: name,
                    id: id,
                    description: desc,
                    length: len,
                    score: score,
                    image: img
                })
            }).then(p => {
                if(p.ok){
                    movie.name = name;
                    movie.desc = desc;
                    movie.img = img;
                    movie.length = len;
                    movie.score = score;
                }
                else if(p.status == 406){
                    alert("Input all informations.");
                }
            }).catch(p=> {
                alert("Error");
            });

            const categ = document.querySelector(".formCategoryName");
            if(categ.innerHTML == "All"){
                this.showAll(this.botbot);
            }else{
                for (const iterator of this.categories) {
                    if(iterator.Name == categ.innerHTML){
                        this.show(iterator, this.botbot);
                    }
                }
            }
            this.defaultData();
        }
    }

    defaultData(){
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

    findMovie(id){
        for (const element of this.categories) {
            let movie = element.findMovie(id);
            if(movie != null){
                return movie;
            }
        }
    }
}