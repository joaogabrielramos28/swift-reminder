//
//  String+Ext.swift
//  Reminder
//
//  Created by João Gabriel Ramos on 05/05/26.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
