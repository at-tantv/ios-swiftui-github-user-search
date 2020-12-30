//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
@testable import GithubSearch

class UserInteractorTests: BaseTestCase {

    func test_fetchUsers() {
        let sut = mockInteractor

        sut.fetchUsers(filter: testFilter)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { users in
                XCTAssertEqual(users, [self.testUser])
            }
            .store(in: &cancellables)

        waitOrFail(timeout: 0.1)
    }
}
