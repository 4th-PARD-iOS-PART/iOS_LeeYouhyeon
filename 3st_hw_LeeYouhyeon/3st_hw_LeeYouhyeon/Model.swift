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
        ]
//        Model(title: "movie7", image: "movie7"),
    ]
}

#endif
