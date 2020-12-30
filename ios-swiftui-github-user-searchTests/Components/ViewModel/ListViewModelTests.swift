//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
@testable import GithubSearch

class ListViewModelTests: BaseTestCase {

    func test_clear() {
        let sut = mockListViewModel(isLoading: true,
                                    errorMessage: testErrorMessage,
                                    users: [testUser])

        sut.clear()

        XCTAssertEqual(sut.users, [])
        XCTAssertEqual(sut.errorMessage, "")
        XCTAssertFalse(sut.isLoading)
    }

    func test_fetchUsers_isNotStartedWithTwoCharacters() {
        let sut = mockListViewModel(username: "ab")

        sut.fetchUsers()
        waitOrFail(timeout: 0.1)

        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.users, [])
    }

    func test_fetchUsers_isStartedWithThreeCharacters() {
        let sut = mockListViewModel(username: "abc")

        sut.fetchUsers()
        waitOrFail(timeout: 0.1)

        XCTAssertFalse(sut.isLoading)
        XCTAssertEqual(sut.users, [testUser])
    }
}
