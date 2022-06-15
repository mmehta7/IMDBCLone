//
//  ContentView.swift
//  IMDBClone
//
//  Created by Mohit Mehta on 14/06/22.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentVM(noOfItemPerPage: 5)

    var body: some View {
        var prevBtn = Button("Prev", action: viewModel.prevBtnAction)
        var nextBtn = Button("Next", action: viewModel.nextBtnAction)
        
        
        ScrollViewReader{ proxyReader in
            
            if let movieList = viewModel.tempMovieItems {
                
                NavigationView {
                    VStack{
                        ScrollView {
                            ForEach(movieList) { movie in
                                NavigationLink(destination: MovieDetailView(movie: movie)) {
                                    MovieCard(movie: movie)
                                }
                                .buttonStyle(.plain)
                                
                            }
                            .padding()
                            HStack{
                                if(viewModel.prevBtnShow)
                                {
                                    prevBtn
//                                    withAnimation(.spring()){
//                                        proxyReader.scrollTo("scrollToTop", anchor: .top)
//                                    }
                                }
                                Spacer()
                                if(viewModel.nextBtnShow)
                                {
                                    nextBtn
                                }
                            }
                            .id("scrollToTop")
                        }
                        .navigationTitle(Text("IMDB Clone"))
                        
                       
                        .padding(.horizontal)
                    }
                }
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
