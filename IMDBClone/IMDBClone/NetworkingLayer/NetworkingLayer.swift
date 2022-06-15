//
//  NetworkingLayer.swift
//  IMDBClone
//
//  Created by Mohit Mehta on 14/06/22.
//

import Foundation

protocol HttpUtility{

    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void) -> Void
//    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type) async -> T

}


struct NetworkingLayer: HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in

            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                //parse the responseData here
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }

        }.resume()
    }
    
//    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type) async -> T {
//        return await withCheckedContinuation { continuation in
//            URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
//                
//                if(error == nil && responseData != nil && responseData?.count != 0)
//                {
//                    //parse the responseData here
//                    let decoder = JSONDecoder()
//                    do {
//                        let result = try decoder.decode(T.self, from: responseData!)
//                        _=continuation.resume(returning: result)
//                    }
//                    catch let error{
//                        debugPrint("error occured while decoding = \(error.localizedDescription)")
//                    }
//                }
//                
//            }.resume()
//        }
//    }

}
