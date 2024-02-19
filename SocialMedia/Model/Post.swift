import Foundation
import SwiftUI

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    //fake data just to show what posts would look like within the app 
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is a caption test", likes: 69, imageUrl: "dean", timestamp: Date(), user: User.MOCK_USER[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Banana", likes: 43, imageUrl: "banana", timestamp: Date(), user: User.MOCK_USER[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Next Tattoo 😎", likes: 2, imageUrl: "tattoo", timestamp: Date(), user: User.MOCK_USER[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "What the fuck @Target", likes: 32, imageUrl: "tshirt", timestamp: Date(), user: User.MOCK_USER[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "😏", likes: 8993, imageUrl: "jiggle", timestamp: Date(), user: User.MOCK_USER[5]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "lolll", likes: 0, imageUrl: "ratmeme", timestamp: Date(), user: User.MOCK_USER[4]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Look at my food", likes: 2003, imageUrl: "food", timestamp: Date(), user: User.MOCK_USER[6]),
    ]
}
