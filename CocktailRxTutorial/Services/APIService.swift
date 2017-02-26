//
//  APIService.swift
//  CocktailRxTutorial
//
//  Created by Xavier De Koninck on 27/02/2017.
//  Copyright © 2017 Xavier De Koninck. All rights reserved.
//

import Foundation
import Apollo
import RxSwift

typealias AllCocktails = GetAllCocktailsQuery.Data.Viewer.AllCocktail

struct APIService {
  
  static var apollo: ApolloClient = {
    let graphlQLEndpointURL = "https://us-west-2.api.scaphold.io/graphql/pjrxtutorial"
    return ApolloClient(url: URL(string: graphlQLEndpointURL)!)
  }()
  
  func loadCocktails() -> Observable<AllCocktails> {
    
    return Observable.create { observer in
      
      let allCocktailsQuery = GetAllCocktailsQuery()
      APIService.apollo.fetch(query: allCocktailsQuery) { (result: GraphQLResult?, error: Error?) in
        if let error = error {
          print(#function, "ERROR | An error occured: \(error)")
          observer.on(.error(error))
        }
        if let error = result?.errors?.first {
          print(#function, "ERROR | An error occured: \(error)")
          observer.on(.error(error))
        }
        guard let allCocktails = result?.data?.viewer?.allCocktails else {
          print(#function, "ERROR | Could not retrieve cocktails")
          observer.on(.error(CocktailError.badRetrieving))
          return
        }
        observer.on(.next(allCocktails))
      }
      return Disposables.create()
    }
  }
}
