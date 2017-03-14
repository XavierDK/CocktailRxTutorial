//
//  Coordinator.swift
//  CocktailRxTutorial
//
//  Created by Xavier De Koninck on 02/03/2017.
//  Copyright © 2017 Xavier De Koninck. All rights reserved.
//

import UIKit
import Swinject

/// A callback function used by coordinators to signal events.
typealias CoordinatorCallback = (Coordinator) -> Void

/**
 A coordinator is an object that manages the flow and life cycle of view controllers in an application.
 See: http://khanlou.com/2015/10/coordinators-redux/ for more.
 */
protocol Coordinator: class {
  
  /// Some object holding information about the application context. Database references, user settings etc.
  var appContext: AppContext? { get }
  
  /// The navigation controller for a coordinator.
  var navigationController: UINavigationController { get }
  
  var parentCoordinator: Coordinator? { get set }
  
  // We identify each coordinator with a string, for debugging reasons and stuff.
  var childCoordinators: [Coordinator] { get set }
  
  /// Force a uniform initializer on our implementors.
  init(navigationController: UINavigationController, parentCoordinator: Coordinator?, appContext: AppContext?)
  
  /// Tells the coordinator to create its initial view controller and take over the user flow.
  func start(withCallback completion: CoordinatorCallback?)
  
  /// Tells the coordinator that it is done and that it should rewind the view controller state to where it was before `start` was called.
  func stop(withCallback completion: CoordinatorCallback?)
  
  /**
   Add a new child coordinator and start it.
   - Parameter coordinator: The coordinator implementation to start.
   - Parameter identifier: A string identifiying this particular coordinator.
   - Parameter callback: An optional `CoordinatorCallback` passed to the coordinator's `start()` method.
   - Returns: The started coordinator.
   */
  func startChild(forCoordinator coordinator: Coordinator, callback: CoordinatorCallback?)
  
  /**
   Stops the coordinator and removes our reference to it.
   - Parameter identifier: The string identifier of the coordinator to stop.
   - Parameter callback: An optional `CoordinatorCallback` passed to the coordinator's `stop()` method.
   */
  func stopChild(forCoordinator coordinator: Coordinator, callback: CoordinatorCallback?)
}

/**
 A default implmentation that provides a few convenience methods for starting and stopping coordinators.
 */
extension Coordinator {
  
  func startChild(forCoordinator coordinator: Coordinator, callback: CoordinatorCallback? = nil) {
    
    childCoordinators.append(coordinator)
    coordinator.start(withCallback: callback)
  }
  
  func stopChild(forCoordinator coordinator: Coordinator, callback: CoordinatorCallback? = nil) {
    
    let childCoordinator = self.childCoordinators.filter { $0 === coordinator }
      .first
    
    self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    
    if let childCoordinator = childCoordinator {
      childCoordinator.stop(withCallback: { coordinator in
        callback?(childCoordinator)
      })
    }
  }
}
