
var stockPrices = ["AAPL": 114.92, "GOOG": 768.88, "MSFT": 57.25]

var birthYears: [String: Int] = [:]

var raceResults = Dictionary<Int, String>()

let apple = stockPrices["AAPL"]

raceResults[1] = "Lewis Hamilton"

raceResults = [
    2: "Daniel Ricciardo",
    3: "Sergio Perez"
]

print(raceResults)

raceResults[3] = nil

let oldValue = raceResults.updateValue("Lewis Hamilton", forKey: 1)

let removedValue = raceResults.removeValue(forKey: 4)

print(raceResults)

raceResults.isEmpty

raceResults.count

let keys = raceResults.keys

let values = Array(raceResults.values)

var detailedRaceResults = [
    1: [
        "driver": "Lewis Hamilton",
        "country": "UK",
        "team": "Mercedes",
        "time": "1:59"
    ]
]

let firstPlaceDriver = detailedRaceResults[1]?["driver"]
