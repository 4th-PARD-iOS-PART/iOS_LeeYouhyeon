import Foundation

struct ComingModel {
    var date: String
    var title: String
    var image: String
    var contents: String
    var genre: String
}

#if DEBUG

extension ComingModel {
    
    static var ComingData = [
        ComingModel(date: "Season 1 Coming December 14",
                    title: "Castle & Castle",
                    image: "mov8",
                    contents: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa,id ut ipsum aliquam  enim non posuere pulvinar diam.",
                    genre: "Steamy · Soapy · Slow Burn · Suspenseful · Teen · Mystery"),
        ComingModel(date: "Season 1 Coming December 14",
                    title: "Tiny Pretty Things",
                    image: "mov9",
                    contents: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa,id ut ipsum aliquam  enim non posuere pulvinar diam.",
                    genre: "Steamy · Soapy · Slow Burn · Suspenseful · Teen · Mystery"),
        ComingModel(date: "Season 1 Coming December 14",
                    title: "Faster",
                    image: "mov10",
                    contents: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa,id ut ipsum aliquam  enim non posuere pulvinar diam.",
                    genre: "Steamy · Soapy · Slow Burn · Suspenseful · Teen · Mystery"),
    ]
}

#endif
