//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI

struct ListView: View {

    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                Group {
                    renderSearchBar()
                        .padding(.horizontal)

                    Divider()
                        .padding(.vertical, 10)

                    renderContent()
                        .padding(.horizontal)
                }
            }
            .navigationBarTitle("Search user")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    // MARK: - Subviews

    func renderSearchBar() -> some View {
        HStack {
            Image(systemName: "magnifyingglass")

            TextField("username", text: $viewModel.username)
                .foregroundColor(.primary)
                .autocapitalization(.none)
                .disableAutocorrection(true)

            Button(action: {
                viewModel.clear()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .opacity(viewModel.username == "" ? 0 : 1)
            }
        }
        .padding()
        .background(Color(.systemFill))
        .cornerRadius(10)
    }

    func renderContent() -> some View {
        VStack {
            if viewModel.isLoading {
                LoadingView()
                    .padding(.top, 40)
            } else {
                ErrorView(message: viewModel.errorMessage)

                if viewModel.users.count > 0 {
                    renderList()
                } else {
                    EmptyView(message: "User list is empty. Try searching for users by using the search bar.")
                }
            }
        }
    }

    func renderList() -> some View {
        LazyVStack {
            ForEach(viewModel.users) { user in
                NavigationLink(
                    destination: DetailView(user: user),
                    label: {
                        ListCardView(user: user)
                            .padding(.top, 10)
                    })
            }
        }
    }
}
