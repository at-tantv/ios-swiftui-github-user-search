//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct DetailView: View {

    let user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                KFImage(URL(string: user.avatarURL))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)

                if let profileURL = URL(string: "\(Constants.profileBaseURL)\(user.login)") {
                    Link("Open profile on Github 🔗", destination: profileURL)
                        .font(.headline)
                        .padding(.top)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .padding()
        .navigationBarTitle(user.login)
    }
}
