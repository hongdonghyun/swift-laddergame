import Foundation

extension Array where Element == LadderComponent {
    
    /// 사다리 배열에 가로대를 무작위로 삽입합니다. 단, 바로 전에 가로대를 넣은 경우 넣지 않습니다.
    func rungsInsertedRandomly() -> [LadderComponent]{
        var wasPlacedJustBefore = false
        var rowWithRungs = self
        for index in self.indices {
            if !wasPlacedJustBefore && Bool.random() {
                rowWithRungs[index] = LadderComponent.rung
                wasPlacedJustBefore = true
            } else {
                wasPlacedJustBefore = false
            }
        }
        return rowWithRungs
    }
    
}


enum LadderComponent: String {
    case rung = "-"
    case empty = " "
}


func createLadder(numberOfParticipants: Int, height: Int) -> [[LadderComponent]] {
    let row = [LadderComponent](repeating: LadderComponent.empty, count: numberOfParticipants - 1)
    let ladder = [[LadderComponent]](repeating: row, count: height)
    var ladderWithRung: [[LadderComponent]] = []
    for index in ladder.indices {
        ladderWithRung.append(ladder[index].rungsInsertedRandomly())
        ladderWithRung[index].insert(LadderComponent.empty, at: 0)
        ladderWithRung[index].append(LadderComponent.empty)
    }
    return ladderWithRung
}

/// 한 열을 사다리를 표현하는 문자열로 변환합니다.
func stringize(row: [LadderComponent]) -> String {
    let stringizedInfo = row.map { $0.rawValue }
    return stringizedInfo.joined(separator: "|")
}

/// 사다리를 사다리를 표현하는 문자열로 변환합니다.
func print(ladder: [[LadderComponent]]) {
    var stringizedLadder = ""
    for row in ladder {
        stringizedLadder.append("\(stringize(row: row))\n")
    }
    print(stringizedLadder)
}


enum InputError: Error {
    case notACountableNumber
}

func getNumberOfParticipants() throws -> Int {
    print("참여할 사람은 몇 명 인가요?")
    return try getCountableNumberFromUser()
}

func getLadderHeight() throws -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    return try getCountableNumberFromUser()
}


func getCountableNumberFromUser() throws -> Int {
    guard let countableNumber = Int(readLine()!) else {
        throw InputError.notACountableNumber
    }
    return countableNumber
}


func run() {
    do {
        let numberOfParticipants = try getNumberOfParticipants()
        let ladderHeight = try getLadderHeight()
        let ladder = createLadder(numberOfParticipants: numberOfParticipants, height: ladderHeight)
        print(ladder: ladder)
    } catch InputError.notACountableNumber {
        print("셀 수 있는 숫자가 아닙니다.")
    } catch {
        print("알 수 없는 오류 입니다.")
    }
}

run()
