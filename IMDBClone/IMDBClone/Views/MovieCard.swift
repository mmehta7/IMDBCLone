//
//  MovieCard.swift
//  IMDBClone
//
//  Created by Mohit Mehta on 14/06/22.
//

import SwiftUI

struct MovieCard: View {
    var viewModel: dateCovertor!
    var movie: Movie!
    @StateObject var imageLoader = ImageLoader()
    
    init(movie: Movie){
        viewModel = MovieVM()
        self.movie = movie
    }
    var body: some View {
        
        
        
        ZStack(alignment: .bottomLeading) {
            
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity)
//                    .frame(height: 300)
                    .scaledToFit()
            }
            else{
                Image("loading")
                    .resizable()
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity)
//                    .frame(height: 300)
                    .scaledToFit()
            }
            
            VStack() {
                Text(movie.title)
                    .bold()
                

                Text(viewModel.dateConvertor(movie))
                    .font(.caption)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .padding()
        .shadow(radius: 3)
        .onAppear {
            self.imageLoader.loadImage(with: URL(string: self.movie.poster)!)
        }
    }
}

struct MovieCard_Previews: PreviewProvider {

    static var previews: some View {
        let movie = Movie(title: "Test of this yrear nabdjhbhsd", year: "2022", imdbID: "testIMDB", type: .movie, poster: "https://m.media-amazon.com/images/M/MV5BNmY4ZDZjY2UtOWFiYy00MjhjLThmMjctOTQ2NjYxZGRjYmNlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg")
        
        
        MovieCard(movie: movie)
    }
}
