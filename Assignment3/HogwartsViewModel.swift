//
//  HogwartsViewModel.swift
//  Assignment3
//
//  Created by Dave Regg on 3/22/23.
//

import Foundation

class HogwartsViewModel: ObservableObject {
    @Published private(set) var houseData = [HouseModel]()
    @Published var hasError = false
    @Published var error: HouseModelError?
    private let url = "https://wizard-world-api.herokuapp.com/Houses"
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: self.url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(HogwartsResults?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = HouseModelError.decodeError
                    return
                }
                // This line might be wrong
                self.houseData = results.hogwartsData
            } catch {
                self.hasError.toggle()
                self.error = HouseModelError.customError(error: error)
            }
        }
    }
}

extension HogwartsViewModel {
    enum HouseModelError: LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }
    }
}
