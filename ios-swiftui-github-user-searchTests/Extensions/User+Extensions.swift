//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

@testable import GithubSearch

extension User: Equatable {

    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id &&
            lhs.login == rhs.login &&
            lhs.avatarURL == rhs.avatarURL
    }
}
