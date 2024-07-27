//
//  movieDBViewModel.swift
//  Moview DB
//
//  Created by Amtex on 27/07/24.
//

import Foundation



class movieDBViewModel: ObservableObject {
    @Published var parsedData: [MovieDbModel?] = []
    @Published var yearCategorized: [String: [MovieDbModel]] = [:]
    @Published var genreCategorized: [String: [MovieDbModel]] = [:]
    @Published var directorCategorized: [String: [MovieDbModel]] = [:]
    @Published var actorCategorized: [String: [MovieDbModel]] = [:]
    @Published var searchedData : [MovieDbModel] = []
    var josnParser = JsonParser()
    
    init() {
        self.parsedData = josnParser.jsonParser()
        self.yearCategorizer()
        self.genreCategorizer()
        self.directorCategorizer()
        self.actorCategorizer()
    }
    
    func yearCategorizer() {
        for year in parsedData {
            if yearCategorized[year?.Year ?? ""] != nil {
                yearCategorized[year?.Year ?? ""]?.append(year!)
            } else {
                yearCategorized[year?.Year ?? ""] = [year!]
            }
        }
    }
    func genreCategorizer() {
        for genre in parsedData {
            let strToGenre = genre?.Genre?.components(separatedBy: ", ")
            for g in (strToGenre ?? []) {
                if genreCategorized[g] != nil {
                    genreCategorized[g]?.append(genre!)
                } else {
                    genreCategorized[g] = [genre!]
                }
            }
        }
    }
    func directorCategorizer() {
        for director in parsedData {
            let strToDir = director?.Director?.components(separatedBy: ", ")
            for d in (strToDir ?? []) {
                if directorCategorized[d] != nil {
                    directorCategorized[d]?.append(director!)
                } else {
                    directorCategorized[d] = [director!]
                }
            }
        }
    }
    func actorCategorizer() {
        for actor in parsedData {
            let strToAct = actor?.Actors?.components(separatedBy: ", ")
            for a in (strToAct ?? []) {
                if actorCategorized[a] != nil {
                    actorCategorized[a]?.append(actor!)
                } else {
                    actorCategorized[a] = [actor!]
                }
            }
        }
    }
    func search(searchString: String) -> [MovieDbModel?] {
        self.searchedData = []
        let _ = parsedData.filter{ i in
            if i!.Title!.lowercased().contains(searchString.lowercased()){
                searchedData.append(i!)
            }
            else if i!.Actors!.lowercased().contains(searchString.lowercased()) {
                searchedData.append(i!)
            }
            else if i!.Director!.lowercased().contains(searchString.lowercased()){
                searchedData.append(i!)
            }
            else if i!.Genre!.lowercased().contains(searchString.lowercased()) {
                searchedData.append(i!)
            }
            return true
        }
        return searchedData
    }
    
}
