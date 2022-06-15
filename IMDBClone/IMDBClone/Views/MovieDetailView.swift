//
//  MovieDetailView.swift
//  IMDBClone
//
//  Created by Mohit Mehta on 14/06/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    var movie: Movie
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        NavigationView{
            VStack() {
                //                List{
                Text(movie.title)
                    .font(.largeTitle)
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        .frame(height: 300)
                }
                else{
                    Image("loading")
                        .resizable()
                        .frame(height: 300)
                }
                Text("Release Year: \(movie.year)")
                    .font(.title3)
                    .padding(.horizontal)
                
                HStack(){
                    Text("Type:")
                        .font(.title2)
                        .padding(.horizontal)
                    Spacer()
                    Text("\(movie.type.rawValue)")
                        .font(.title2)
                        .padding(.horizontal)
                    
                }
                .padding(.bottom, 5)
                HStack(){
                    Text("IMDB_Id:")
                        .font(.title2)
                        .padding(.horizontal)
                    Spacer()
                    Text("\(movie.imdbID)")
                        .font(.title2)
                        .padding(.horizontal)
                }
                Rectangle().fill(Color.gray.opacity(0))
                    
            }
        }
        .onAppear {
            self.imageLoader.loadImage(with: URL(string: self.movie.poster)!)
        }
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(title: "Movie Title goes here", year: "2022", imdbID: "testIMDB", type: .movie, poster: "https://m.media-amazon.com/images/M/MV5BNmY4ZDZjY2UtOWFiYy00MjhjLThmMjctOTQ2NjYxZGRjYmNlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg")
        
        MovieDetailView(movie: movie)
        
    }
}
