//
//  ContentVM.swift
//  IMDBClone
//
//  Created by Mohit Mehta on 14/06/22.
//

import Foundation
import SwiftUI

protocol btnDelgate{
    
}
class ContentVM: ObservableObject{
    
    var noOfItemPerPage: Int!
    var startItem = -1
    var endItem = 0
    @Published var tempMovieItems: [Movie]!
    @Published var prevBtnShow = false
    @Published var nextBtnShow = true
    @Published var movieList: [Movie]!
    
    
    init(noOfItemPerPage: Int){
        self.noOfItemPerPage = noOfItemPerPage
        getMoviesData()
        
    }
    

    func getMovie(){
        endItem = startItem + noOfItemPerPage
        startItem += 1

        
        if(movieList.count >= endItem-1){
            tempMovieItems = Array(movieList[startItem...endItem])
        }
        else if (startItem-1 >= movieList.count){
            tempMovieItems = Array(movieList[startItem...])
        }
        
        
    }
    
    func prevBtnAction(){
        endItem  = startItem-1
        startItem = startItem - noOfItemPerPage
        tempMovieItems.removeAll()

        if(movieList.count >= endItem-1){
            tempMovieItems = Array(movieList[startItem...endItem])
        }
        else if (startItem-1 >= movieList.count){
            tempMovieItems = Array(movieList[startItem...])
        }

        if(startItem == 0){
            prevBtnShow = false
            print("prev Item disabled")
        }
        else{
            prevBtnShow = true
        }
        nextBtnShow = true

        print("prev Tapped")
    }

    func nextBtnAction(){
        startItem = endItem + 1
        endItem = endItem + noOfItemPerPage
        tempMovieItems.removeAll()

        if(movieList.count > endItem){
            tempMovieItems = Array(movieList[startItem...endItem])
        }
        else if (startItem < movieList.count){
            tempMovieItems = Array(movieList[startItem...])
        }

        if(endItem >= movieList.count-1){
            nextBtnShow = false
            print("next Item disabled")
        }
        else{
            nextBtnShow = true
        }
        prevBtnShow = true
        print("next Tapped")
    }
    
    func getMoviesData() -> Void{
        MovieResource().getMovieItems {[weak self]  MovieItems in
            guard let strongSelf = self else{return}
            DispatchQueue.main.async {
                strongSelf.movieList = MovieItems
                print(strongSelf.movieList)
                strongSelf.getMovie()

            }
        }
    }
    
    
}
