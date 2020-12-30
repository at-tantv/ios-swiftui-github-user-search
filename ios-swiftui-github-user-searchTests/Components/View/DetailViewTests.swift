//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
import ViewInspector
import KingfisherSwiftUI
@testable import GithubSearch

class DetailViewTests: BaseTestCase {

    func test_view() throws {
        let sut = DetailView(user: testUser)
        let content = try sut.inspect().scrollView().vStack()

        /// Image should be displayed
        XCTAssertNotNil(try content.view(KFImage.self, 0))

        /// Correct link should be displayed
        XCTAssertEqual(try content.link(1).url().absoluteString, "\(Constants.profileBaseURL)\(testLogin)")
    }
}
