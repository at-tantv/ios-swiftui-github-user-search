//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import Foundation

public func callOnMainThread(_ block: () -> ()) {
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.sync(execute: block)
    }
}
