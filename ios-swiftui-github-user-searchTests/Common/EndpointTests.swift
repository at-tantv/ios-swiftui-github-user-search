//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
@testable import GithubSearch

class EndpointTests: BaseTestCase {

    func test_endpointPath() {
        let sut = Endpoints.searchUsers(filter: testFilter, perPage: testPerPage)

        XCTAssertEqual(sut.endpointPath, "search/users?q=\(testFilter)&per_page=\(testPerPage)")
    }
}
