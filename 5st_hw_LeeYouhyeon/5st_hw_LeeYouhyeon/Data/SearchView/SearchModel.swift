import Foundation


struct SearchModel{
    var title : String
    var image : String
}

#if DEBUG

extension SearchModel{
    
    static var SearchData = [
        SearchModel(title: "Citation", image: "mov1"),
        SearchModel(title: "Oloture", image: "mov2"),
        SearchModel(title: "The Setup", image: "mov3"),
        SearchModel(title: "Breaking Bad", image: "mov4"),
        SearchModel(title: "Ozark", image: "mov5"),
        SearchModel(title: "The Governor", image: "mov6"),
        SearchModel(title: "Your Excellency", image: "mov7"),
    ]
}

#endif
