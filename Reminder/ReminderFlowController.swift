//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by João Gabriel Ramos on 07/05/26.
//

import Foundation
import UIKit


class ReminderFlowController {
    //MARK:  Properties
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactoryProtocol
    
    
    //MARK:  Init
    
    public init(){
        self.viewControllerFactory = ViewControllersFactory()
        
    }
    
    //MARK:  startFlow
    func start()->UINavigationController?{
        let startViewController = self.viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return self.navigationController
    }
    
}

//MARK:  Login
extension ReminderFlowController:LoginBottomSheetFlowDelegate{
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
//MARK:  Splash
extension ReminderFlowController:SplashFlowDelegate{
     func openLoginBottomSheet() {
        let loginBottomSheet = self.viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false){
            loginBottomSheet.animateShow()
        }
    }

}
