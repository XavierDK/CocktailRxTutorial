//
//  AppCoordinator.swift
//  CocktailRxTutorial
//
//  Created by Xavier De Koninck on 02/03/2017.
//  Copyright © 2017 Xavier De Koninck. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
  
  let appContext: AppContext?
  let navigationController: UINavigationController
  var parentCoordinator: Coordinator?
  var childCoordinators: [Coordinator] = []
  
  required init(navigationController: UINavigationController, parentCoordinator: Coordinator?, appContext: AppContext?) {
    
    self.appContext = appContext
    self.parentCoordinator = parentCoordinator
    self.navigationController = navigationController
  }
  
  func start(withCallback completion: CoordinatorCallback? = nil) {
    
    startChild(forCoordinator: CocktailsListCoordinator(navigationController: navigationController, parentCoordinator: self, appContext: nil))
  }
  
  func stop(withCallback completion: CoordinatorCallback? = nil) {
    
  }
}
