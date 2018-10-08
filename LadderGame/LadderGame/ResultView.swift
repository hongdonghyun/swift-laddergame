//
//  ResultView.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    func showResult(_ ladder:LadderGameDTO) {
        for i in ladder.ladder {
            showLayer(i)
        }
        for i in ladder.names {
            fitName(i)
        }
    }
    
    private func showLayer(_ layer:[LadderStep]) {
        let stepInfo = LadderStep.stepInfo
        for i in layer {
            print("|", terminator: "")
            print(stepInfo[i.hasStep] ?? "     ", terminator: "")
        }
        print("|")
    }

    private func fitName(_ name:String) {
        print(name, terminator: "")
        for _ in 0...5 - name.count {
            print(" ", terminator: "")
        }
    }
}
