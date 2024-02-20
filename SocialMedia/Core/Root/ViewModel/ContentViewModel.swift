import Foundation
import Firebase
import Combine

@MainActor ///Ensures UI updates and interactions happen on the main thread.
class ContentViewModel: ObservableObject { ///ObservableObject so the @Published can be used
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>() /// Stores Combine subscriptions for memory management.
    
    @Published var userSession: FirebaseAuth.User? /// Holds the current FirebaseAuth.User object, reflecting authentication state.
    @Published var currentUser: User? /// Holds a custom User model (not provided in the code), likely with additional user data.
    
    init() {
        setupSubscribers() ///Calls setupSubscribers() to establish data subscriptions.
    }
    
    func setupSubscribers() {
        /// Subscribes to the service.$userSession publisher from FirebaseAuth.
        /// Updates the view model's userSession whenever a new value is emitted.
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        ///Subscribes to the service.$currentUser publisher (likely from a custom data source)
        ///Updates the view model's currentUser whenever a new value is emitted.
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
