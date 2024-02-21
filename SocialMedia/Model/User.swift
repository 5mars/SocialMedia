import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false}
        return currentUid == id
    }
}

extension User {
    static var MOCK_USER: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: "batman", fullName: nil, bio: "I'm vengance", email: "batman@gmail.com"),
            
        .init(id: NSUUID().uuidString, username: "_restartedboi", profileImageUrl: "restarted", fullName: "Jeremy", bio: "I'm acoustic", email: "acoustic@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "ironman", profileImageUrl: "ironman", fullName: "Tony Stark", bio: "Genius, billionaire, playboy, philanthropist", email: "ironman@gmail.com"),

        .init(id: NSUUID().uuidString, username: "captainamerica", profileImageUrl: "captainamerica", fullName: "Steve Rogers", bio: "Super soldier fighting for justice", email: "captain@gmail.com"),

        .init(id: NSUUID().uuidString, username: "thor", profileImageUrl: "thor", fullName: "Thor Odinson", bio: "God of Thunder and Asgardian prince", email: "thor@gmail.com"),

        .init(id: NSUUID().uuidString, username: "blackwidow", profileImageUrl: "blackwidow", fullName: "Natasha Romanoff", bio: "Skilled spy and deadly assassin", email: "natasha@gmail.com"),

        .init(id: NSUUID().uuidString, username: "hulk", profileImageUrl: "hulk", fullName: "Bruce Banner", bio: "The strongest Avenger with an anger issue", email: "bruce@gmail.com"),

        .init(id: NSUUID().uuidString, username: "wolverine", profileImageUrl: "wolverine", fullName: "Logan", bio: "Mutant with regenerative healing and adamantium claws", email: "logan@gmail.com"),

        .init(id: NSUUID().uuidString, username: "blackpanther", profileImageUrl: "blackpanther", fullName: "T'Challa", bio: "King of Wakanda and protector of the vibranium", email: "tchalla@gmail.com")
    ]
}
