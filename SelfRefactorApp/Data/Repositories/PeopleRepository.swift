//
//  PeopleRepository.swift
//  SelfRefactorApp
//
//  Created by Renata Garlicka on 17/04/2025.
//

import Foundation

enum PeopleRepositoryError: Error {
    case fileNotFound
    case failedToDecode
}

protocol PeopleRepositoryProtocol {
    func getPeople() throws -> [Person]
}

final class PeopleRepository: PeopleRepositoryProtocol {
    func getPeople() throws -> [Person] {
        guard let url = Bundle.main.url(forResource: "people", withExtension: "json") else {
            throw PeopleRepositoryError.fileNotFound
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedPeople = try JSONDecoder().decode([Person].self, from: data)
            return decodedPeople
        } catch {
            throw PeopleRepositoryError.failedToDecode
        }
    }
}
