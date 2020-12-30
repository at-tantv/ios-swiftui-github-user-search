//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
import Combine
import ViewInspector
import KingfisherSwiftUI
@testable import GithubSearch

class BaseTestCase: XCTestCase {

    var cancellables = Set<AnyCancellable>()

    // MARK: - Test data

    let testAvatarURL = "https://i.pravatar.cc/80"
    let testEmptyMessage = "Some empty message"
    let testErrorMessage = "Some error message"
    let testFilter = "filter"
    let testLogin = "testlogin"
    let testPerPage = 25
    let testTotalCount = 1
    let testUserID = 1

    var testUser: User {
        User(id: testUserID,
             login: testLogin,
             avatarURL: testAvatarURL)
    }

    // MARK: - Mocks

    let mockAPIClient = MockAPIClient()

    var mockUserRepository: UserRepository {
        UserRepositoryImpl(apiClient: mockAPIClient)
    }

    var mockInteractor: UserInteractor {
        UserInteractorImpl(userRepository: mockUserRepository)
    }
    
    func mockListViewModel(isLoading: Bool = false,
                           errorMessage: String = "",
                           users: [User] = [],
                           username: String = "") -> ListViewModel {

        let result = ListViewModel(interactor: mockInteractor, debounceInterval: 0)
        result.isLoading = isLoading
        result.errorMessage = errorMessage
        result.users = users
        result.username = username
        return result
    }

    // MARK: - Helpers

    func waitOrFail(timeout: TimeInterval) {
        let expectation = self.expectation(description: #function)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeout, execute: {
            expectation.fulfill()
        })

        wait(for: [expectation], timeout: timeout + 2)
    }
}

/// Making custom views Inspectable
extension DetailView: Inspectable {}
extension EmptyView: Inspectable {}
extension ErrorView: Inspectable {}
extension ListView: Inspectable {}
extension ListCardView: Inspectable {}
extension LoadingView: Inspectable {}

/// Making third-party views Inspectable
extension KFImage: Inspectable {}
