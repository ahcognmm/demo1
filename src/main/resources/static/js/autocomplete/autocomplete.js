 
class Search {
    constructor(query) {
        this.query = query;
    }

    // Hàm asysnc (hàm bất đồng bộ) : cho phép viết các thao tác bất đồng bộ phía trong
    async getResult() {
        
        try {

            // Get API bằng axios - trả về 1 promise 
            // await : dừng việc thực thi, chờ lấy kết quả promise object) từ sever xong mới xử lý tiếp 

            const res = await axios(`http://localhost:8080/shopping/search?query=${this.query}`);
            
            // Get recipes : return recipes array  
            this.result = res.data;         // Tạo 1 field result cho lớp Search 

            console.log(this.result);
        } catch (error) {
            // alert(error);
            this.result = "error";
        } 
    }
}


// Phải đặt trên hàm autocomplete
const getBooks = async (request, response) => {
    let query = request.term;
    let search = new Search(query);
    try {
        await search.getResult();

        let books = search.result;
        console.log(books);
        if (books != "error") {
            
           // let recipesName = recipes.map(rp => rp.name);
            // response(recipesName);      // return recipesName
            response(books);
        }
        
    } catch(error) {
        console.log(error);
    }
}

// Xử lý suggest tìm kiếm 
$(".search__field").autocomplete({
    source: getBooks,
    // focus: function (event, ui) {
    //     $(".search__field").val(ui.item.name);
    //     return false;
    // },
    select: function (event, ui) {
        $(".search__field").val(ui.item.name);
        return false;
    }
})
    .data("ui-autocomplete")._renderItem = function (ul, item) {
    return $("<li>")
        .data("item.autocomplete", item)
        .append(`
            <a class="results__link" style="max-width:350px" href="http://localhost:8080/shopping/book-detail?id=${item.id}">
                <figure class="results__fig">
                    <img src="${item.image}" alt="">
                </figure>
                <div class="results__data">
                    <h4 class="results__name">${item.name}</h4>
                </div>
            </a>`)
        .appendTo(ul);
    };

