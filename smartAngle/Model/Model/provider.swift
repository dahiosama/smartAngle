//
//  provider.swift
//  smartAngle
//
//  Created by osama abu dahi on 17/09/2021.
//

import Foundation

// MARK: - ProviderObject
struct ProviderObject: Codable {
    let provider: Provider?
    let reviews: [Review]?
}

// MARK: - Provider
struct Provider: Codable {
    let id: Int?
    let name, phone, accountStatus, userType: String?
    let image, email: String?
    let emailVerifiedAt: JSONNull?
    let password, lat, long, isDeleted: String?
    let talkingLang, documentNum, documentID, rate: String?
    let aboutService: JSONNull?
    let bio, birthday: String?
    let rememberToken: JSONNull?
    let createdAt, updatedAt: String?
    let deletedAt, city: JSONNull?
    let cityID, lang, blockDate, firebaseUUID: String?

    enum CodingKeys: String, CodingKey {
        case id, name, phone
        case accountStatus
        case userType
        case image, email
        case emailVerifiedAt
        case password, lat, long
        case isDeleted
        case talkingLang
        case documentNum
        case documentID
        case rate
        case aboutService
        case bio, birthday
        case rememberToken
        case createdAt
        case updatedAt
        case deletedAt
        case city
        case cityID
        case lang
        case blockDate
        case firebaseUUID
    }
}

// MARK: - Review
struct Review: Codable {
    let id: Int?
    let rate, feedback, userID, providerID: String?
    let createdAt, updatedAt: String?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id, rate, feedback
        case userID
        case providerID
        case createdAt
        case updatedAt
        case user
    }
}

// MARK: - User
struct User: Codable {
    let id: Int?
    let image, name: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
