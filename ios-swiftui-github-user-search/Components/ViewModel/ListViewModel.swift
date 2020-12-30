//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import Combine
import Foundation

class ListViewModel: ObservableObject {

    @Published var username = ""
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage = ""

    private let debounceInterval: DispatchQueue.SchedulerTimeType.Stride
    private let interactor: UserInteractor
    private var subscriptions: Set<AnyCancellable> = []
    private var fetchUserSubscription: AnyCancellable? = nil

    init(interactor: UserInteractor,
         debounceInterval: DispatchQueue.SchedulerTimeType.Stride = .seconds(1)) {

        self.interactor = interactor
        self.debounceInterval = debounceInterval

        setupSubscriptions()
    }

    // MARK: - Public API

    func clear() {
        username = ""
        updateState()
    }

    func fetchUsers() {
        guard username.count > 2 else {
            updateState()
            return
        }

        updateState(isLoading: true)

        fetchUserSubscription = interactor
            .fetchUsers(filter: username)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure:
                    self?.updateState(errorMessage: "Loading failed")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] filtered in
                self?.updateState(users: filtered)
            })
    }

    // MARK: - Helpers

    private func setupSubscriptions() {
        $username
            .removeDuplicates()
            .debounce(for: debounceInterval, scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.fetchUsers()
            }
            .store(in: &subscriptions)
    }

    private func updateState(isLoading: Bool = false,
                     errorMessage: String = "",
                     users: [User] = []) {
        callOnMainThread {
            self.isLoading = isLoading
            self.errorMessage = errorMessage
            self.users = users
        }
    }
}
