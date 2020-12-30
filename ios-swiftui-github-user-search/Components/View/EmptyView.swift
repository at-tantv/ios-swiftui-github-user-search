//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI

struct EmptyView: View {

    let message: String

    var body: some View {
        Text(message)
            .font(.callout)
            .multilineTextAlignment(.center)
            .padding()
    }
}
