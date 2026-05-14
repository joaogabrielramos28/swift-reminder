//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by João Gabriel Ramos on 13/05/26.
//

import Foundation


protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate:SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate)-> LoginBottomSheetViewController
}
