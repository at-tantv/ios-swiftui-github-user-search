//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
import ViewInspector
import KingfisherSwiftUI
@testable import GithubSearch

class ListCardViewTests: BaseTestCase {

    func test_view() throws {
        let sut = ListCardView(user: testUser)
        let content = try sut.inspect().hStack()

        /// Image should be displayed
        XCTAssertNotNil(try content.view(KFImage.self, 0))

        /// Username should be displayed
        XCTAssertEqual(try content.text(1).string(), testLogin)

        /// Spacer should be displayed
        XCTAssertNotNil(try content.spacer(2))

        /// Disclosure indicator should be displayed
        XCTAssertEqual(try content.image(3).imageName(), "chevron.right")
    }
}
