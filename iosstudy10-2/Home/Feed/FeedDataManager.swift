//
//  FeedDataManager.swift
//  iosstudy10-2
//
//  
//

import Alamofire

class FeedDataManager {
    func feedDataManager(_ parameters : FeedAPIInput, viewController : HomeViewController) {
        AF.request("", method: .get, parameters: parameters).validate()
            .responseDecodable(of: [FeedModel].self) { response in
                switch response.result {
                case .success(let result):
                    viewController.successAPI(result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }    }
}

