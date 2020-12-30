//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURL = "avatar_url"
    }

    let id: Int
    let login: String
    let avatarURL: String
}
