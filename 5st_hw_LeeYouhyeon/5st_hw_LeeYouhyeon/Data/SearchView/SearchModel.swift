import Foundation


struct SearchModel{
    var title : String
    var image : String
    var date: String
    
    var img : String
    var name : String
    var time : String
    var explain : String
}

#if DEBUG

extension SearchModel{
    
    static var SearchData = [
        SearchModel(title: "Citation", image: "mov1", date: "2024", img: "img1", name: "1. Game Changer" ,time: "37m" , explain: "Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return."),
        SearchModel(title: "Oloture", image: "mov2", date: "2023", img: "img1", name: "1. Game Changer" ,time: "37m" , explain: "Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return."),
        SearchModel(title: "The Setup", image: "mov3", date: "2022", img: "img1", name: "1. Game Changer" ,time: "37m" , explain: "Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return."),
        SearchModel(title: "Breaking Bad", image: "mov4", date: "2021", img: "img1", name: "1. Game Changer" ,time: "37m" , explain: "Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return."),
        SearchModel(title: "Ozark", image: "mov5", date: "2020", img: "img1", name: "1. Game Changer" ,time: "37m" , explain: "Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return."),
        SearchModel(title: "The Governor", image: "mov6", date: "2019", img: "img1", name: "1. Game Changer" ,time: "37m" , explain: "Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return."),
        SearchModel(title: "Your Excellency", image: "mov7", date: "2018", img: "img1", name: "1. Game Changer" ,time: "37m" , explain: "Flying high: Chrishell reveals her latest love - Jason. In LA, the agents get real about the relationship while Christine readies her return."),
    ]
}

#endif
