import Foundation


struct Model{
    var title : String
    var image : String
}

#if DEBUG

extension Model{
    
    static var ModelData = [
        [
        Model(title: "movie2", image: "movie2"),
        Model(title: "movie3", image: "movie3"),
        Model(title: "movie4", image: "movie4"),
        Model(title: "movie5", image: "movie5"),
        ],
        [
        Model(title: "movie6", image: "movie6"),
        Model(title: "movie7", image: "movie7"),
        Model(title: "movie8", image: "movie8"),
        Model(title: "movie9", image: "movie9"),
        ],
        [
        Model(title: "movie10", image: "movie10"),
        Model(title: "movie11", image: "movie11"),
        Model(title: "movie12", image: "movie12"),
        Model(title: "movie13", image: "movie13"),
        ],
        [
        Model(title: "movie14", image: "movie14"),
        Model(title: "movie15", image: "movie15"),
        Model(title: "movie16", image: "movie16"),
        Model(title: "movie17", image: "movie17"),
        ],
        [
        Model(title: "movie18", image: "movie18"),
        Model(title: "movie19", image: "movie19"),
        Model(title: "movie20", image: "movie20"),
        Model(title: "movie21", image: "movie21"),
        ],
        [
        Model(title: "movie22", image: "movie22"),
        Model(title: "movie23", image: "movie23"),
        Model(title: "movie24", image: "movie24"),
        Model(title: "movie25", image: "movie25"),
        ],
    ]
}

#endif
