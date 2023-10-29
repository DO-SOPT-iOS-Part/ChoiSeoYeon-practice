//
//  ImageCollectionData.swift
//  sopt33-third-seminar
//
//  Created by 최서연 on 10/29/23.
//

import Foundation

struct ImageCollectionData {
    let image: String
    var isLiked: Bool
    
    init(image: String, isLiked: Bool) {
        self.image = image
        self.isLiked = isLiked
    }
}

var imageCollectionList: [ImageCollectionData] = [.init(image: "image1", isLiked: true),
                                                  .init(image: "image2", isLiked: true),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: true),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: true),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image9", isLiked: false),
                                                  .init(image: "image10", isLiked: false),
                                                  .init(image: "image11", isLiked: true),
                                                  .init(image: "image12", isLiked: false),
                                                  .init(image: "image1", isLiked: true),
                                                  .init(image: "image2", isLiked: true),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image9", isLiked: false),
                                                  .init(image: "image10", isLiked: false),
                                                  .init(image: "image11", isLiked: false),
                                                  .init(image: "image12", isLiked: false),
                                                  .init(image: "image1", isLiked: true),
                                                  .init(image: "image2", isLiked: true),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image9", isLiked: true),
                                                  .init(image: "image10", isLiked: false),
                                                  .init(image: "image11", isLiked: false),
                                                  .init(image: "image12", isLiked: true),
                                                  .init(image: "image1", isLiked: false),
                                                  .init(image: "image2", isLiked: false),
                                                  .init(image: "image3", isLiked: true),
                                                  .init(image: "image4", isLiked: true)]
