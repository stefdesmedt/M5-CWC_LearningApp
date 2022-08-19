//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Stephanie De Smedt on 19/08/2022.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
