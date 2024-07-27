//
//  subView.swift
//  Moview DB
//
//  Created by Amtex on 27/07/24.
//

import SwiftUI

struct subView: View {
    @State var categorized : [String: [MovieDbModel]]
    @Binding var currentSelection : MovieDbModel?
    @Binding var showMoviewDEscriptionCard : Bool
    var body: some View {
        ForEach(categorized.keys.sorted(), id: \.self) { topCategory in
            DisclosureGroup(
                content: {
                    ForEach(0..<(categorized[topCategory]?.count ?? 0), id: \.self) { innerCategory in
                        MovieCard(movieCardModel: MovieCardModel(imageUrl: categorized[topCategory]?[innerCategory].Poster ?? "", title: categorized[topCategory]?[innerCategory].Title ?? "", language: categorized[topCategory]?[innerCategory].Language ?? "", year: categorized[topCategory]?[innerCategory].Year ?? ""))
                            .onTapGesture {
                                currentSelection = (categorized[topCategory]?[innerCategory])!
                                withAnimation {
                                    showMoviewDEscriptionCard.toggle()
                                }
                            }
                    }
                },
                label: { Text(topCategory) }
            )
        }
    }
}

//#Preview {
//    subView()
//}
