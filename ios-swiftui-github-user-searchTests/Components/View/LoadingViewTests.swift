//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
import ViewInspector
@testable import GithubSearch

class LoadingViewTests: BaseTestCase {

    func test_view() throws {
        let sut = LoadingView()

        /// Progress should be displayed
        XCTAssertNotNil(try sut.inspect().vStack().progressView(0))
    }
}
