//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import Foundation
import Combine
import EasyNetworking
@testable import GithubSearch

class MockAPIClient: API {

    // MARK: - Test data

    private var mockSearchUsersResult: SearchUsersResult {
        let user = User(id: 1,
                        login: "testlogin",
                        avatarURL: "https://i.pravatar.cc/80")

        return SearchUsersResult(totalCount: 1, items: [user])
    }

    // MARK: Confirming to API

    func request<T>(configuration: RequestConfiguration) -> AnyPublisher<T, Error> where T : Decodable {

        /// TODO: Add more proper endpoint mocking if needed
        if T.self == SearchUsersResult.self {
            return Just(mockSearchUsersResult as! T)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }

        return Fail(error: NSError()).eraseToAnyPublisher()
    }

    func request(configuration: RequestConfiguration) -> AnyPublisher<Void, Error> {
        return Fail(error: NSError()).eraseToAnyPublisher()
    }

    func requestData(configuration: RequestConfiguration) -> AnyPublisher<Data, Error> {
        return Fail(error: NSError()).eraseToAnyPublisher()
    }

    func upload(configuration: RequestConfiguration, data: Data) -> AnyPublisher<Void, Error> {
        return Fail(error: NSError()).eraseToAnyPublisher()
    }
}
