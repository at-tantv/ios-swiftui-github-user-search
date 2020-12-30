//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import Combine

protocol UserInteractor {

    func fetchUsers(filter: String) -> AnyPublisher<[User], Error>
}

class UserInteractorImpl: UserInteractor {

    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func fetchUsers(filter: String) -> AnyPublisher<[User], Error> {
        userRepository
            .fetchUsers(filter: filter, perPage: 25)
            .flatMap {
                Just($0.items)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
