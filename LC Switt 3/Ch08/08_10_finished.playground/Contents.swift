
import Foundation

var maybeAnInt: Optional<Int>

maybeAnInt = .some(2)

maybeAnInt = .none

let baseUrlString = "https://itunes.apple.com/search?"

enum Entity : String {
    case song = "song"
    case app = "software"
}

enum Endpoint {
    
    case term(String)
    case entity(Entity, term: String, limit: Int)
    
    var encoded: String {
        switch self {
        case .term(let term):
            return "entity=" + encode(term)
        case let .entity(entity, term, limit):
            return "entity=\(encode(entity.rawValue))&term=\(encode(term))&limit=\(limit)"
        }
    }
    
    func encode(_ string: String) -> String {
        return string.replacingOccurrences(of: " ", with: "+")
    }
}

let endpoint = Endpoint.entity(.song, term: "yyz", limit: 1).encoded

let urlString = baseUrlString + endpoint

print(urlString)
