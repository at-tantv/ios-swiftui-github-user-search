//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
import ViewInspector
@testable import GithubSearch

class EmptyViewTests: BaseTestCase {

    func test_view() throws {
        let sut = EmptyView(message: testEmptyMessage)

        /// Message should be displayed
        XCTAssertEqual(try sut.inspect().text().string(), testEmptyMessage)
    }
}
