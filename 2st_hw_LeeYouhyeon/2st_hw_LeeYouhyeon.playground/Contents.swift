import UIKit
import Foundation


// ---------- Mark : if문  ----------------
//문제 1: if 문
//문자열 변수 fruit이 "apple", "banana", "cherry" 중 하나일 때, 해당하는 과일을 출력하세요.
//var fruit = "apple" // 이 값을 "banana"나 "cherry"로 바꿔보세요.

// ---------- Mark : if문 답안 작성란  ----------------

var fruit :String = "banana"

if  (fruit == "apple" ){
    print(fruit)
}
else if (fruit == "banana"){
    print(fruit)
}
else if (fruit == "cherry"){
    print(fruit)
}

// ---------- Mark : guard문  ----------------
//문제 2: guard 문
//함수 printPositiveNumber를 작성하세요. 이 함수는 하나의 정수 인자를 받아, 그 값이 양수일 경우에만 그 값을 출력합니다. 만약 값이 양수가 아니라면, "The number is not positive."를 출력합니다.
//
//func printPositiveNumber(_ number: Int) {
//}
//
//printPositiveNumber(5)  // 5를 출력해야 함
//printPositiveNumber(-3) // "The number is not positive." 출력해야 함


// ---------- Mark : guard문 답안 작성란 ----------------

func printPositiveNumber(_ number: Int) {
    guard number > 0 else{
        print("The number is not positive.")
        return
    }
    print(number)
}

printPositiveNumber(5)
//printPositiveNumber(-3)

// ---------- Mark : enum 연관값  ----------------

//문제 1: 연관값 사용하기
//"책(Book)", "비디오(Video)", "음악(Music)" 등의 미디어 아이템을 나타내는 열거형을 작성하세요. 각 아이템에는 타이틀(title)이라는 연관값을 부여합니다.

// ---------- Mark : enum 연관값 답안 작성란 ----------------

enum media {
    case Book(title: String)
    case Video(title: String)
    case Music(title: String)
}


// ---------- Mark : enum 원시값 ----------------

//문제 2: 원시값 사용하기
//열거형을 사용해 주중(sunday to saturday)을 나타내세요. 각 요일에는 1부터 7까지의 원시값을 부여합니다.

// ---------- Mark : enum 원시값 답안 작성란 ----------------

enum week : Int{
    case Sunday = 1
    case Monday = 2
    case TuesDay = 3
    case Wednesday = 4
    case Thursday = 5
    case Friday = 6
    case Saturday = 7
}


// ---------- Mark : function overloading  ----------------

//문제 1: 함수 오버로딩 (Overloading)
//printArea라는 함수를 작성해보세요. 이 함수는 사각형의 가로와 세로 길이를 받아 면적을 출력하고, 또 다른 버전의 함수는 원의 반지름을 받아 면적을 출력합니다.


// ---------- Mark : function overloading 답안 작성란 ----------------
//

func printArea(_ width: Double, _ height: Double) -> Double{
    return width * height
}

func printArea(_ radius: Double) -> Double{
    return 2 * 3.14 * radius
}

printArea(5,5)
printArea(5)

// ---------- Mark : function If문사용 / guard문 사용  ----------------

//문제: 로그인 상태 확인
//함수 checkLoginStatus를 작성해보세요. 이 함수는 로그인 상태를 나타내는 Bool 변수와 사용자 이름을 나타내는 String? 변수를 받습니다. 만약 로그인 상태가 true이면 사용자 이름을 출력하고, false이면 "로그인이 필요합니다."를 출력하세요. 사용자 이름이 nil이라면 "알 수 없는 사용자"를 출력하세요.

// ---------- Mark : function If문사용 답안 작성란  ----------------

func checkLoginStatus(_ login: Bool, _ name: String?){
    if nil != name {
        if login{
            print(name!)
        }
        else{
            print("로그인이 필요합니다.")
        }
    }
    else{
        print("알 수 없는 사용자")
    }
}

let name : String? = "nil"
checkLoginStatus(false, name)

// ---------- Mark : function guard문 사용 답안 작성란 ----------------

func checkLoginStatus2(_ login: Bool, _ name: String?){
    guard nil != name else{
        print("알 수 없는 사용자")
        return
    }
    guard login else{
        print("로그인이 필요합니다.")
        return
    }
    print(name!)
}

let name2 : String? = "nil"
checkLoginStatus2(true, name2)



// ---------- Mark : Optional Nil-coalescing 사용  ----------------

//문제 1: Nil-coalescing 연산자 ?? 사용하기
//문자열 배열 names에 이름이 몇 개 들어있습니다. 배열의 첫 번째 요소를 출력하세요. 만약 배열이 비어 있다면 "No name found"를 출력하세요.
//var names: [String] = ["Alice", "Bob", "Charlie"]

// ---------- Mark : Optional Nil-coalescing 사용 답안 작성란  ----------------
var names: [String] = ["Alice", "Bob", "Charlie"]
//var names: [String] = []

let check : String? = names.isEmpty ? nil : names[0]
print(check ?? "No name found")


// ---------- Mark : Optional if-let 사용  ----------------

//문제 2: if-let을 사용한 옵셔널 바인딩
//문자열 옵셔널 optionalString에 값이 있을 수도, 없을 수도 있습니다. 값이 있으면 "The string is:"와 함께 값을 출력하세요. 값이 없으면 "The string is nil."을 출력하세요.
//var optionalString: String? = "Hello"


// ---------- Mark : Optional if-let 사용 답안 작성란 ----------------

var optionalString : String? = "nil"

if let ok = optionalString {
    print("The string is:" + "\(ok)")
}
else{
    print("The string is nil.")
}

// ---------- Mark : Optional guard-let 사용 답안 작성란  ----------------

func guardlet (_ string: String?){
    guard let ok = string else{
        print("The string is nil.")
        return
    }
    print("The string is:" + "\(ok)")
}

guardlet(optionalString)

