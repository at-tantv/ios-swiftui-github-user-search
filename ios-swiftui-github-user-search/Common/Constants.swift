//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import Foundation

struct Constants {

    static let baseURL = "https://api.github.com"
    static let profileBaseURL = "https://github.com/"

    struct Path {
        static let searchUsers = "search/users"
    }

    struct Param {
        static let q = "q"
        static let perPage = "per_page"
    }

    struct Header {
        struct Key {
            static let accept = "Accept"
        }

        struct Value {
            static let json = "application/vnd.github.v3+json"
        }
    }
}
