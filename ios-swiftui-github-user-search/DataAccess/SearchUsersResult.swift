//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import Foundation

struct SearchUsersResult: Codable {

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }

    let totalCount: Int
    let items: [User]
}
