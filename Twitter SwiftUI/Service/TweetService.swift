//
//  TweetService.swift
//  Twitter SwiftUI
//
//  Created by loratech on 07/01/24.
//

import Firebase

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool)->Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let tweet = [
            "uid" : uid,
            "caption" : caption,
            "likes" : 0,
            "timestamp" : Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(tweet){ error in
                if let error {
                    print("DEBUG: Failed to create tweet: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
        
    }
    
    func fetchTweets(completion: @escaping([Tweet])->Void){
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let tweets = documents.compactMap({try? $0.data(as: Tweet.self)})
                
                completion(tweets)
            }
    }
    
    func fetchTweets(forUid uid: String, completion: @escaping([Tweet])->Void){
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let tweets = documents.compactMap({try? $0.data(as: Tweet.self)})
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()}))
            }
    }
    
    
}

// MARK: - Likes
extension TweetService {
    func likeTweet(_ tweet: Tweet, completion: @escaping()-> Void){
        print("DEBUG: Likes button is here...!")
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        
        let userLikesRef = Firestore.firestore().collection("users")
            .document(uid).collection("user-likes")
        
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes" : tweet.likes + 1]){ _ in
                userLikesRef.document(tweetId).setData([:]){ _ in
                    completion()
                }
                
            }
        
    }
    
    func checkIfUserLikedTweet(_ tweet: Tweet, completion: @escaping(Bool)->Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .document(tweetId).getDocument { snapshot, _ in
                guard let snapshot else {return}
                completion(snapshot.exists)
            }
    }
    
    func unlikeTweet(_ tweet:Tweet, completion: @escaping()->Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        guard tweet.likes > 0 else {return}
        
        let userLikesRef = Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
        
        Firestore.firestore().collection("tweets")
            .document(tweetId)
            .updateData(["likes": tweet.likes - 1]){ _ in
                userLikesRef.document(tweetId).delete{ _ in
                    completion()
                }
            }
    }
    
    func fetchLikedTweets(forUid uid: String, completion: @escaping([Tweet])->Void){
        var tweets = [Tweet]()
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                documents.forEach { doc in
                    let tweetId = doc.documentID
                    
                    Firestore.firestore().collection("tweets")
                        .document(tweetId)
                        .getDocument { snapshot, _ in
                            guard let tweet = try? snapshot?.data(as: Tweet.self) else {return}
                            
                            tweets.append(tweet)
                            completion(tweets)
                        }
                }
            }
        
    }
}
