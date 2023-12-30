//
//  UserFeedDataManager.swift
//  iosstudy10-2
//
//  
//

import Alamofire

class UserFeedDataManager {
    
    func getUserFeed(_ viewController : ProfileViewController, _ userID : Int = 2) {
        AF.request("/users/\(userID)", method: .get, parameters: nil).validate()
            .responseDecodable(of: UserFeedModel.self) { response in
                switch response.result {
                case .success(let result):
                    viewController.successFeedAPI(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func deleteUserFeed(_ viewController : ProfileViewController, _ postIdx : Int) {
        AF.request("/posts/\(postIdx)", method: .patch, parameters: nil).validate()
            .responseDecodable(of: DeleteUserFeed.self) { response in
                switch response.result {
                case .success(let result):
                    viewController.successDeletePostAPI(result.isSuccess ?? false)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}

