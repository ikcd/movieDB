//
//  MovieCard.swift
//  Moview DB
//
//  Created by Amtex on 27/07/24.
//

import SwiftUI

struct MovieCard: View {
    @State var movieCardModel : MovieCardModel
    var body: some View {
        HStack(alignment: .top) {
//                ZStack{
//                    RoundedRectangle(cornerRadius: 10)
                    AsyncImage(url: URL(string: movieCardModel.imageUrl)) { i in
                        i.resizable()
                    } placeholder: {
                        Image(systemName: "photo.stack")
                            .resizable()
//                            .background(.gray)
                    }.frame(width: 90, height: 120)
//                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(movieCardModel.title)
                        .font(.title3)
                    HStack(alignment: .top){
                        Text("Language: ")
                        Text(movieCardModel.language)
                    }
                    Text("Year: \(movieCardModel.year)")
                    
                }
//                .frame(maxWidth: .infinity ,alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ContentView()
//    MovieCard(movieCardModel: MovieCardModel(imageUrl: "", title: "Meet the Parents", language: "Tamil", year: "2023"))
}
