import Foundation
import UIKit

class NetworkManager {
    
    // GET 요청
    func getData(from urlString: String, completion: @escaping ([Member]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, NSError(domain: "ResponseError", code: -1, userInfo: nil))
                return
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                let errorMessage = "Server returned status code: \(httpResponse.statusCode)"
                completion(nil, NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage]))
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "DataError", code: -1, userInfo: nil))
                return
            }
            
            do {
                let members = try JSONDecoder().decode([Member].self, from: data) // 배열로 디코딩
                completion(members, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }

    // POST 요청
    func postData(to urlString: String, data: SendMember, completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(data)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { _, response, error in
                if let error = error {
                    completion(error)
                    return
                }
                
                //서버로부터 200 응답이 왔을 경우
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    completion(NSError(domain: "HTTPError", code: -1, userInfo: nil))
                    return
                }
                
                completion(nil)
            }.resume()
        } catch {
            completion(error)
        }
    }

    // DELETE 요청
    func deleteData(from urlString: String, completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let error = error {
                completion(error)
                return
            }
            
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 204 else {
//                completion(NSError(domain: "HTTPError", code: -1, userInfo: nil))
//                return
//            }
            
            completion(nil)
        }.resume()
    }

    // PATCH 요청
    func patchData(to urlString: String, data: SendMember, completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(data)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { _, response, error in
                if let error = error {
                    completion(error)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    completion(NSError(domain: "HTTPError", code: -1, userInfo: nil))
                    return
                }
                
                completion(nil)
            }.resume()
        } catch {
            completion(error)
        }
    }
}
