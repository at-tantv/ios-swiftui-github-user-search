//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI

@main
struct MainApp: App {

    var body: some Scene {
        WindowGroup {
            Assembler()
                .listView
                .foregroundColor(.primary)
                .accentColor(.primary)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
