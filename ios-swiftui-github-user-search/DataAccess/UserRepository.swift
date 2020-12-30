//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import EasyNetworking
import Combine

protocol UserRepository {

    func fetchUsers(filter: String, perPage: Int) -> AnyPublisher<SearchUsersResult, Error>
}

class UserRepositoryImpl: UserRepository {

    private let apiClient: API

    init(apiClient: API) {
        self.apiClient = apiClient
    }

    func fetchUsers(filter: String, perPage: Int) -> AnyPublisher<SearchUsersResult, Error> {
        let endpointPath = Endpoints.searchUsers(filter: filter, perPage: perPage).endpointPath
        let headers = [Constants.Header.Key.accept: Constants.Header.Value.json]

        return apiClient.request(configuration: RequestConfiguration(endpointPath: endpointPath,
                                                                     method: .get,
                                                                     headers: headers))
    }
}
