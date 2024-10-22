import Foundation


struct SearchModel{
    var title : String
    var image : String
    var date: String
}

#if DEBUG

extension SearchModel{
    
    static var SearchData = [
        SearchModel(title: "Citation", image: "mov1", date: "2024"),
        SearchModel(title: "Oloture", image: "mov2", date: "2023"),
        SearchModel(title: "The Setup", image: "mov3", date: "2022"),
        SearchModel(title: "Breaking Bad", image: "mov4", date: "2021"),
        SearchModel(title: "Ozark", image: "mov5", date: "2020"),
        SearchModel(title: "The Governor", image: "mov6", date: "2019"),
        SearchModel(title: "Your Excellency", image: "mov7", date: "2018"),
    ]
}

#endif
