import Foundation

class APIService {
    private let baseUrl: String = "http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080"
    
    // private init()으로 인스턴스 생성을 방지
    private init() {}
    
    // 싱글턴 인스턴스를 제공하는 정적 메서드 - APIService.shared로만 접근 가능
    static let shared = APIService()
    
    
    // 가져오기
    func getMembers(part: String?, completion: @escaping ([Member]?, Error?) -> Void) {
        guard let isPart = part else {
            print("optionalString is nil")
            return
        }
        let urlString = "\(baseUrl)/user?part=\(isPart)"
//        print("보낸 url: \(urlString) \n")
        let networkManager = NetworkManager()
        
        networkManager.getData(from: urlString, completion: completion)
    }
    
    // 추가
    func postMember(data: SendMember, completion: @escaping (Error?) -> Void) {
        let urlString = "\(baseUrl)/user"
        let networkManager = NetworkManager()
        
        networkManager.postData(to: urlString, data: data, completion: completion)
    }
    
    // 삭제
    func deleteMember(withId id: Int, completion: @escaping (Error?) -> Void) {
        let urlString = "\(baseUrl)/user/\(id)"
        let networkManager = NetworkManager()
        
        networkManager.deleteData(from: urlString, completion: completion)
    }
    
    // 업데이트
    func updateMember(withId id: Int, data: SendMember, completion: @escaping (Error?) -> Void) {
        let urlString = "\(baseUrl)/user/\(id)"
        let networkManager = NetworkManager()
        
        networkManager.patchData(to: urlString, data: data, completion: completion)
    }
}
