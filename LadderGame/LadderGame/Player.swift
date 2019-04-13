//
//  Player.swift
//  LadderGame
//
//  Created by 김성현 on 13/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

extension String {
    /// length 만큼 글자수를 늘리고 가운데정렬합니다.
    func alignedToCenter(length: Int) -> String {
        let space = " "
        let numberOfSpacesToAdd = length - self.count
        let leadingSpaces = String(repeating: space, count: numberOfSpacesToAdd / 2)
        let trailingSpaces = String(repeating: space, count:  numberOfSpacesToAdd - leadingSpaces.count)
        return "\(leadingSpaces)\(self)\(trailingSpaces)"
    }
}

struct Player {
    
    let name: String
    let alignedName: String
    
    init(name: String) {
        self.name = name
        alignedName = name.alignedToCenter(length: 5)
    }
    
}



