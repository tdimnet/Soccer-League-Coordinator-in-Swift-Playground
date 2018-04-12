//: Playground - noun: a place where people can play

import UIKit

let joeSmith: [String: Any] = [
    "name": "Joe Smith",
    "height": 42,
    "soccerExperience": true,
    "guardian": "Jim and Jan Smith"
]

let jillTanner: [String: Any] = [
    "name": "Jill Tanner",
    "height": 36,
    "soccerExperience": true,
    "guardian": "Clara Tanner"
]

let billBon: [String: Any] = [
    "name": "Bill Bon",
    "height": 43,
    "soccerExperience": true,
    "guardian": "Sara and Jenny Bon"
]

let evaGordon: [String: Any] = [
    "name": "Eva Gordon",
    "height": 45,
    "soccerExperience": false,
    "guardian": "Wendy and Mike Gordon"
]

let mattGill: [String: Any] = [
    "name": "Matt Gill",
    "height": 40,
    "soccerExperience": false,
    "guardian": "Charles and Sylvia Gill"
]

let kimmyStein: [String: Any] = [
    "name": "Kimmy Stein",
    "height": 41,
    "soccerExperience": false,
    "guardian": "Bill and Hillary Stein"
]

let sammyAdams: [String: Any] = [
    "name": "Sammy Adams",
    "height": 45,
    "soccerExperience": false,
    "guardian": "Jeff Adams"
]

let karlSaygan: [String: Any] = [
    "name": "Karl Saygan",
    "height": 42,
    "soccerExperience": true,
    "guardian": "Heather Bledsoe"
]


let suzaneGreenberg: [String: Any] = [
    "name": "Suzane Greenberg",
    "height": 44,
    "soccerExperience": true,
    "guardian": "Henrietta Dumas"
]


let salDali: [String: Any] = [
    "name": "Sal Dali",
    "height": 41,
    "soccerExperience": false,
    "guardian": "Gala Dali"
]


let joeKavalier: [String: Any] = [
    "name": "Joe Kavalier",
    "height": 39,
    "soccerExperience": false,
    "guardian": "Sam and Elaine Kavalier"
]


let benFinkelstein: [String: Any] = [
    "name": "Ben Finkelstein",
    "height": 44,
    "soccerExperience": false,
    "guardian": "Aaron and Jill Finkelstein"
]


let diegoSoto: [String: Any] = [
    "name": "Diego Soto",
    "height": 41,
    "soccerExperience": true,
    "guardian": "Robin and Sarika Soto"
]


let chloeAlaska: [String: Any] = [
    "name": "Chloe Alaska",
    "height": 47,
    "soccerExperience": false,
    "guardian": "David and Jamie Alaska"
]


let arnoldWillis: [String: Any] = [
    "name": "Arnold Willis",
    "height": 43,
    "soccerExperience": false,
    "guardian": "Claire Willis"
]


let phillipHelm: [String: Any] = [
    "name": "Phillip Helm",
    "height": 44,
    "soccerExperience": true,
    "guardian": "Thomas Helm and Eva Jones"
]


let lesClay: [String: Any] = [
    "name": "Les Clay",
    "height": 42,
    "soccerExperience": true,
    "guardian": "Wynonna Brown"
]


let herschelKrustofski: [String: Any] = [
    "name": "Herschel Krustofski",
    "height": 45,
    "soccerExperience": true,
    "guardian": "Hyman and Rachel Krustofski"
]

let players: [[String: Any]] = [
    joeSmith,
    jillTanner,
    billBon,
    evaGordon,
    mattGill,
    kimmyStein,
    sammyAdams,
    karlSaygan,
    suzaneGreenberg,
    salDali,
    joeKavalier,
    benFinkelstein,
    diegoSoto,
    chloeAlaska,
    arnoldWillis,
    phillipHelm,
    lesClay,
    herschelKrustofski
]

// The three arrays of players

var teamDragons: [[String: Any]] = []
var teamSharks: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []
let numberOfTeams: Int = [teamDragons, teamSharks, teamRaptors].count

/*
 Create well balanced teams of players
 */

func sortPlayers(fromTeam team: [[String: Any]]) -> (xpTeam: [[String: Any]], noviceTeam: [[String: Any]]) {
    var xpTeam: [[String: Any]] = []
    var noviceTeam: [[String: Any]] = []
    
    // Sort players into two teams: experimented and novice
    for player in team {
        guard let isExperimented = player["soccerExperience"] as? Bool else { break }
        if isExperimented {
            xpTeam.append(player)
        } else {
            noviceTeam.append(player)
        }
    }
    
    // Once both arrays has been created, sort them
    // DESC Order
    xpTeam = xpTeam.sorted(by: {
        guard let playerHeight0 = $0["height"] as? Int else { return false }
        guard let playerHeight1 = $1["height"] as? Int else { return false }
        return playerHeight0 > playerHeight1 }
    )
    // ASC Order
    noviceTeam = noviceTeam.sorted(by: {
        guard let playerHeight0 = $0["height"] as? Int else { return false }
        guard let playerHeight1 = $1["height"] as? Int else { return false }
        return playerHeight0 < playerHeight1 }
    )
    
    return (xpTeam, noviceTeam)
}


// Generating the array of players
var experimentedPlayers: [[String: Any]] = sortPlayers(fromTeam: players).xpTeam
var novicePlayers: [[String: Any]] = sortPlayers(fromTeam: players).noviceTeam
// And the number of players for each team
let numberOfExperimentedPlayerPerTeam: Int = experimentedPlayers.count / numberOfTeams
let numberOfNovicePlayerPerTeam: Int = novicePlayers.count / numberOfTeams


func addPlayers() -> [[String: Any]] {
    // The empty local team array we are going to work in
    var team: [[String: Any]] = []
    
    // Fill in the team array with experimented players
    for _ in 0..<numberOfExperimentedPlayerPerTeam {
        team.append(experimentedPlayers[experimentedPlayers.count - 1])
        experimentedPlayers.remove(at: experimentedPlayers.count - 1)
    }
    
    // Fill in the team array with novice players
    for _ in 0..<numberOfNovicePlayerPerTeam {
        team.append(novicePlayers[novicePlayers.count - 1])
        novicePlayers.remove(at: novicePlayers.count - 1)
    }
    
    return team
}

// We build the three teams
teamRaptors = addPlayers()
teamSharks = addPlayers()
teamDragons = addPlayers()


// Return the average height for the desired team
func calculAverageHeight(team: [[String: Any]]) -> Int {
    var averageHeight: Int = 0
    
    for player in team {
        guard let playerHeight = player["height"] as? Int else { break }
        averageHeight += playerHeight
    }
    
    return averageHeight / team.count
}

print("The global average height is: \(calculAverageHeight(team: players)) \n")
print("The average height for team Raptors is: \(calculAverageHeight(team: teamRaptors)) \n")
print("The average height for team Sharks is: \(calculAverageHeight(team: teamSharks)) \n")
print("The average height for team Dragons is: \(calculAverageHeight(team: teamDragons)) \n")
print("---------\n")


/*
 Create the letters for the guardian
 */

// We create a global array variable for the letters and use it within the createLetters function
var letters: [String] = []
func createLetters(toTeam team: [[String: Any]], teamName name: String, dateOfTeamPractice date: String) -> Void {
    // Loop through the desired team array and fill in the letter according to the player's info
    for index in 0..<team.count {
        guard let guardianName = team[index]["guardian"] as? String else { break }
        guard let playerName = team[index]["name"] as? String else { break }
        
        let letter: String = "Dear \(guardianName), \(playerName) has been selected for the team \(name) this year. Its first trainning will be at \(date)."
        
        // Then add the letter into the letters array
        letters.append(letter)
    }
}

createLetters(toTeam: teamRaptors, teamName: "Raptors", dateOfTeamPractice: "Raptors - March 18, 1pm")
createLetters(toTeam: teamDragons, teamName: "Dragons", dateOfTeamPractice: "Dragons - March 17, 1pm")
createLetters(toTeam: teamSharks, teamName: "Sharks", dateOfTeamPractice: "Sharks - March 17, 3pm")

// At least display of the letters.
func displayLetters(letters: [String]) -> Void {
    for letter in letters {
        print("\(letter) \n")
    }
}

displayLetters(letters: letters)
