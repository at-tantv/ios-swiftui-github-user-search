//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import Foundation

enum Endpoints {

    case searchUsers(filter: String, perPage: Int)

    var endpointPath: String {
        switch self {
        case .searchUsers(let filter, let perPage):

            /// TODO: Use URLComponents to make this prettier
            return Constants.Path.searchUsers + "?"
                + Constants.Param.q + "=" + filter + "&"
                + Constants.Param.perPage + "=\(perPage)"
        }
    }
}
