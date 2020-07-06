//
//  homescreentestApp.swift
//  homescreentest
//
//  Created by Leo Dion on 6/28/20.
//

import SwiftUI

@main
struct homescreentestApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreenView().environmentObject(MockAppRepository(gridCount: 23, dockCount: 3))
        }
    }
}
