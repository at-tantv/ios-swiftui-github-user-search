//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ListCardView: View {

    let user: User

    var body: some View {
        HStack {
            KFImage(URL(string: user.avatarURL))
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(10)
                .padding(.trailing, 10)

            Text(user.login)
                .font(.callout)

            Spacer()

            Image(systemName: "chevron.right")
                .font(.body)
                .padding(.trailing, 5)
        }
        .padding(10)
        .background(Color(.systemFill))
        .cornerRadius(10)
    }
}
