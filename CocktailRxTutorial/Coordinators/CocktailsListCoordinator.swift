//
//  CocktailsListCoordinator.swift
//  CocktailRxTutorial
//
//  Created by Xavier De Koninck on 02/03/2017.
//  Copyright © 2017 Xavier De Koninck. All rights reserved.
//

import UIKit
import Reusable

final class CocktailsListCoordinator: Coordinator {
  
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
    
    let controller = CocktailsListController.instantiate()
    navigationController.pushViewController(controller, animated: true)
  }
  
  func stop(withCallback completion: CoordinatorCallback? = nil) {
    
  }
}
