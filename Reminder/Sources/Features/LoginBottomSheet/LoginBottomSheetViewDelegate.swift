//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by João Gabriel Ramos on 05/05/26.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(user:String,password:String)
}
