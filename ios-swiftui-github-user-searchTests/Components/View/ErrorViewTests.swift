//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
import ViewInspector
@testable import GithubSearch

class ErrorViewTests: BaseTestCase {

    func test_viewWithErrorMessage() throws {
        let sut = ErrorView(message: testErrorMessage)

        /// Message should be displayed
        XCTAssertEqual(try sut.inspect().vStack().text(0).string(), testErrorMessage)
    }

    func test_viewWithoutErrorMessage() throws {
        let sut = ErrorView(message: "")

        /// Message should notbe displayed
        XCTAssertNil(try? sut.inspect().vStack().text(0))
    }
}
