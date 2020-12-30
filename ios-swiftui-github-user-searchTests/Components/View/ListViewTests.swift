//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import XCTest
import ViewInspector
@testable import GithubSearch

class ListViewTests: BaseTestCase {

    func test_searchBar() throws {
        let viewModel = mockListViewModel(username: testLogin)
        let sut = ListView(viewModel: viewModel)
        let bar = try sut.inspect().navigationView().scrollView(0).group().hStack(0)

        /// Icon should be visible
        XCTAssertEqual(try bar.image(0).imageName(), "magnifyingglass")

        /// Textfield should be visible with correct entry
        XCTAssertEqual(try bar.textField(1).input(), testLogin)

        /// Clear button should be visible
        let button = try bar.button(2)
        XCTAssertEqual(try button.labelView().image(0).imageName(), "xmark.circle.fill")

        /// Button should clear selection
        try button.tap()
        XCTAssertEqual(viewModel.users, [])
        XCTAssertEqual(viewModel.username, "")
    }

    func test_emptyList_notLoading_noError() throws {
        let sut = ListView(viewModel: mockListViewModel())
        let content = try sut.inspect().navigationView().scrollView(0).group().vStack(2)

        /// Error message should not be displayed
        XCTAssertEqual(try content.view(ErrorView.self, 0).actualView().message, "")

        /// Empty message should be displayed
        XCTAssertEqual(try content.view(EmptyView.self, 1).actualView().message, "User list is empty. Try searching for users by using the search bar.")
    }

    func test_emptyList_notLoading_withError() throws {
        let sut = ListView(viewModel: mockListViewModel(errorMessage: testErrorMessage))
        let content = try sut.inspect().navigationView().scrollView(0).group().vStack(2)

        /// Error message should be displayed
        XCTAssertEqual(try content.view(ErrorView.self, 0).actualView().message, testErrorMessage)

        /// Empty message should be displayed
        XCTAssertEqual(try content.view(EmptyView.self, 1).actualView().message, "User list is empty. Try searching for users by using the search bar.")
    }

    func test_emptyList_loading() throws {
        let sut = ListView(viewModel: mockListViewModel(isLoading: true))
        let content = try sut.inspect().navigationView().scrollView(0).group().vStack(2)

        /// Loading view should be displayed
        XCTAssertNotNil(try content.view(LoadingView.self, 0))
    }

    func test_list() throws {
        let sut = ListView(viewModel: mockListViewModel(users: [testUser]))
        let content = try sut.inspect().navigationView().scrollView(0).group().vStack(2)

        let cardView = try content.lazyVStack(1).forEach(0).navigationLink(0).labelView().view(ListCardView.self, 0).actualView()

        /// Card with correct user should be displayed
        XCTAssertEqual(cardView.user, testUser)
    }
}
