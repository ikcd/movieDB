//
//  ContentView.swift
//  Moview DB
//
//  Created by Amtex on 27/07/24.
//

import SwiftUI

struct ContentView: View {
    var group = ["Year", "Genre", "Directors", "Actors", "All Movies"]
    @State var showMoviewDEscriptionCard : Bool = false
    @State var currentSelection: MovieDbModel?
    @State var searchText: String = ""
    @StateObject var movieVm = movieDBViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    NavigationStack {
                        if !movieVm.searchedData.isEmpty {
                            //MARK: Search Result
                            ScrollView(.vertical, content: {
                                VStack {
                                    ForEach(0..<movieVm.searchedData.count, id: \.self) {i in
                                        let data = movieVm.searchedData[i]
                                        MovieCard(movieCardModel: MovieCardModel(imageUrl: data.Poster ?? "", title: data.Title ?? "", language: data.Language ?? "", year: data.Year ?? ""))
                                            .onTapGesture {
                                                currentSelection = data
                                                withAnimation {
                                                    showMoviewDEscriptionCard.toggle()
                                                }
                                            }
                                        
                                    }
                                }.padding()
                            })
                        } else {
                            //MARK: Main Category Based on the Task Doc
                            List (group, id: \.self) { group in
                                DisclosureGroup {
                                    switch group {
                                    case "Year":
                                        subView(categorized: movieVm.yearCategorized, currentSelection: $currentSelection, showMoviewDEscriptionCard: $showMoviewDEscriptionCard)
                                    case "Genre":
                                        subView(categorized: movieVm.genreCategorized, currentSelection: $currentSelection, showMoviewDEscriptionCard: $showMoviewDEscriptionCard)
                                    case "Directors":
                                        subView(categorized: movieVm.directorCategorized, currentSelection: $currentSelection, showMoviewDEscriptionCard: $showMoviewDEscriptionCard)
                                    case "Actors":
                                        subView(categorized: movieVm.actorCategorized, currentSelection: $currentSelection, showMoviewDEscriptionCard: $showMoviewDEscriptionCard)
                                    case "All Movies":
                                        ForEach(0..<movieVm.parsedData.count, id: \.self) { i in
                                            let data = movieVm.parsedData[i]
                                            MovieCard(movieCardModel: MovieCardModel(imageUrl: data?.Poster ?? "", title: data?.Title ?? "", language: data?.Language ?? "", year: data?.Year ?? ""))
                                                .onTapGesture {
                                                    currentSelection = data
                                                    withAnimation {
                                                        showMoviewDEscriptionCard.toggle()
                                                    }
                                                }
                                        }
                                    default:
                                        Text("")
                                    }
                                } label: {
                                    Text("\(group)")
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: Text("Artist, Genere, Movie, Director"))
                        .onChange(of: searchText) { i in
                            movieVm.search(searchString: searchText)
                        }
                    //MARK: Show Full Movie Description Popup
                    if showMoviewDEscriptionCard {
                        MovieDescriptionCard(movieModel: currentSelection, showCard: $showMoviewDEscriptionCard)
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
