//
//  FeedUploadDataManager.swift
//  iosstudy10-2
//
//
//

import Alamofire

class FeedUploadManager {
    func posts(_ viewController : HomeViewController, _ parameter : FeedUploadInput) {
        AF.request("/posts", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeedUploadModel.self) { response in
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("성공")
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
