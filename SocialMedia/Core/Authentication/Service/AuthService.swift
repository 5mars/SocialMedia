import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

// FIREBASE AUTH LOGIC
class AuthService {
    
    @Published var userSession: FirebaseAuth.User?  ///Tracks the currently logged-in user's FirebaseAuth.User object, if any.
    @Published var currentUser: User? ///Holds the currently logged-in user's data loaded from Firestore, if available.
    
    static let shared = AuthService() // Ensures only one instance exists
    
    // Attempts to load user data upon initialization using Task { ... }.
    init() {
        Task {
            try await loadUserData()
        }
    }
    
    
    // Signs in a user with email/password.
    // Sets userSession if successful.
    // Calls loadUserData() to fetch user data from Firestore.
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData() //load user data
        } catch {
            print("DEBUG: Failed to LOG IN user with error \(error.localizedDescription)")
        }
    }
    
    
    
    // Creates a new user with email/password.
    // Sets userSession if successful.
    // Calls uploadUserData() to store user data in Firestore.
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            await self.uploadUserData(uid: result.user.uid, username: username, email: email)
            
        } catch {
            print("DEBUG: Failed to REGISTER user with error \(error.localizedDescription)")
        }
    }
    
    
    /// Retrieves user data from Firestore if logged in.
    /// Decodes the data into a User object using snapshot.data(as: User.self).
    /// Sets currentUser if successful.
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()

        self.currentUser = try? snapshot.data(as: User.self) ///This is how you decode the user ?
    }
    
    
    /// Signs out the user from Firebase.
    /// Clears userSession and currentUser.
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil//wipe the current user data
    }
    
    
    /// Creates a new User object with the provided details.
    /// Encodes the User object into Firestore-compatible data using Firestore.Encoder().
    /// Saves the encoded data to Firestore using setData().
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return } /// This is how you encode the user in firebase ???
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }

}
