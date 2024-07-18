//
//  moneyXchangerApp.swift
//  moneyXchanger
//
//  Created by Roman Gurung on 1/7/24.
//

import SwiftUI

@main
struct MoneyXchangerApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            CurrencyConverterView()
        }
    }
}
