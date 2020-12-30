//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
@testable import GithubSearch

class SearchUsersResultTests: BaseTestCase {

    func test_model() {
        let sut = SearchUsersResult(totalCount: testTotalCount,
                                    items: [testUser])

        XCTAssertEqual(sut.totalCount, testTotalCount)
        XCTAssertEqual(sut.items.count, 1)
        XCTAssertEqual(sut.items[0], testUser)
    }
}
