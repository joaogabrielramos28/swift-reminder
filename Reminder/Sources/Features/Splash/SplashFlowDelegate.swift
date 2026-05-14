//
//  SplashFlowDelegate.swift
//  Reminder
//
//  Created by João Gabriel Ramos on 13/05/26.
//

import Foundation


public protocol SplashFlowDelegate: AnyObject {
    func openLoginBottomSheet()
    func navigateToHome()
}
