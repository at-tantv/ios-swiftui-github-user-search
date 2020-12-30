//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
@testable import GithubSearch

class UserTests: BaseTestCase {

    func test_model() {
        XCTAssertEqual(testUser.id, testUserID)
        XCTAssertEqual(testUser.login, testLogin)
        XCTAssertEqual(testUser.avatarURL, testAvatarURL)
    }
}
