//
//  MovieDescriptionCard.swift
//  Moview DB
//
//  Created by Amtex on 27/07/24.
//

import SwiftUI

struct MovieDescriptionCard: View {
    @State var movieModel : MovieDbModel?
    @State var selectedRating = ""
    @State var ratingData : Rating?
    @Binding var showCard: Bool
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Image(systemName: "xmark")
                    .bold()
                    .padding([.top, .horizontal], 10)
                    .onTapGesture {
                        showCard.toggle()
                    }
            }
            ScrollView(.vertical) {
                VStack{
                    
                    HStack(alignment: .top) {
                        AsyncImage(url: URL(string: movieModel?.Poster ?? "")) { i in
                            i.resizable()
                            //                        i.frame(width: 150, height: 200)
                        } placeholder: {
                            Image(systemName: "photo.stack")
                                .resizable()
                        }
                        .frame(width: 200, height: 200).aspectRatio(contentMode: .fill)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Spacer()
                            Text(movieModel?.Title ?? "")
                                .font(.title)
                                .bold()
                            Spacer()
                        }
                        CustomHStack(heading: "Plot: ", description: movieModel?.Plot ?? "")
                        CustomHStack(heading: "Cast & Crew: ", description: movieModel?.Actors ?? "")
                        CustomHStack(heading: "Release Date: ", description: movieModel?.Released ?? "")
                        CustomHStack(heading: "Genre: ", description: movieModel?.Genre ?? "")
                        
                        HStack{
                            Spacer()
                            Text("Rating")
                                .font(.title)
                                .bold()
                            Spacer()
                        }
                            ForEach(0..<(movieModel?.Ratings.count ?? 0), id: \.self) { rating in
                                let ratingData = movieModel?.Ratings[rating]
                                HStack {
                                    Spacer()
                                    Text("\(ratingData?.Source ?? ""): ")
                                    Text(ratingData?.Value ?? "-----")
                                    Spacer()
                                }
                            }
                    }
                }
                .padding()
            }
        }.background(.gray)
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


struct CustomHStack: View {
    @State var heading: String
    @State var description: String
    var body: some View {
        HStack(alignment: .top){
            Text(heading)
                .bold()
            Text(description)
        }
    }
}

#Preview {
    ContentView()
    
    //    MovieDescriptionCard(movieModel: <#MovieDbModel#>, body: <#some View#>)
}
