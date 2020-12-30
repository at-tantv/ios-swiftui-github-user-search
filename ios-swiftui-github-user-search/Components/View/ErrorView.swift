//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI

struct ErrorView: View {

    let message: String

    var body: some View {
        VStack {
            if !message.isEmpty {
                Text(message)
                    .font(.title3)
                    .padding(.top)
                    .foregroundColor(Color(.systemRed))
            }
        }
    }
}
