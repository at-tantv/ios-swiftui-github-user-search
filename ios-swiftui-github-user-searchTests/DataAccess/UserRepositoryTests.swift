//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
import Combine
@testable import GithubSearch

class UserRepositoryTests: BaseTestCase {

    func test_fetchUsers() {
        let sut = mockUserRepository

        sut.fetchUsers(filter: testFilter, perPage: testPerPage)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { result in
                XCTAssertEqual(result.totalCount, self.testTotalCount)
                XCTAssertEqual(result.items, [self.testUser])
            }
            .store(in: &cancellables)

        waitOrFail(timeout: 0.1)
    }
}
