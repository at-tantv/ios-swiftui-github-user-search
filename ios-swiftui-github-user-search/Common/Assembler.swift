//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import Foundation
import EasyNetworking

struct Assembler {

    var listView: ListView {
        ListView(viewModel: listViewModel)
    }

    var listViewModel: ListViewModel {
        ListViewModel(interactor: userInteractor)
    }

    var apiClient: APIClient {
        APIClient(baseURL: URL(string: Constants.baseURL)!)
    }

    var userInteractor: UserInteractor {
        UserInteractorImpl(userRepository: userRepository)
    }

    var userRepository: UserRepository {
        UserRepositoryImpl(apiClient: apiClient)
    }
}
