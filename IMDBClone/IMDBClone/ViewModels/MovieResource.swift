//
//  MovieResource.swift
//  IMDBClone
//
//  Created by Mohit Mehta on 14/06/22.
//

import Foundation

protocol fetchData{
    //yha downloadItems dataDownload type return krega
    func getMovieItems(complitionHandler: @escaping([Movie]) -> Void)
}


struct MovieResource: fetchData{
    func getMovieItems(complitionHandler: @escaping ([Movie]) -> Void) {
        let url = URL(string: EndPoints.getApi)!
        NetworkingLayer().getApiData(requestUrl: url, resultType: IMDBData.self) { result in
            complitionHandler(result.Movies)
        }
    }

}
