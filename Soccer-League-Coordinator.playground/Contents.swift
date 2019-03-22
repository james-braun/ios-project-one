let players = [     // list of players and their info.
    ["Name": "Joe Smith", "Height": "42", "Experience": "true", "Parent": "Jim and Jan Smith"],
    ["Name": "Jill Tanner", "Height": "38", "Experience": "true", "Parent": "Clara Tanner"],
    ["Name": "Bill Bon", "Height": "43", "Experience": "true", "Parent": "Sara and Jenny Bon"],
    ["Name": "Eva Gordon", "Height": "45", "Experience": "false", "Parent": "Wendy and Mike Gordon"],
    ["Name": "Matt Gill", "Height": "40", "Experience": "false", "Parent": "Charles and Silvia Gill"],
    ["Name": "Kimmy Stein", "Height": "41", "Experience": "false", "Parent": "Bill and Hillary Stein"],
    ["Name": "Sammy Adams", "Height": "45", "Experience": "false", "Parent": "Jeff Adams"],
    ["Name": "Karl Saygan", "Height": "42", "Experience": "true", "Parent": "Heather Bledsoe"],
    ["Name": "Suzane Greenberg", "Height": "44", "Experience": "true", "Parent": "Henrietta Dumas"],
    ["Name": "Sal Dall", "Height": "41", "Experience": "false", "Parent": "Gala Dall"],
    ["Name": "Joe Kavalier", "Height": "39", "Experience": "false", "Parent": "Sam and Elaine Kavalier"],
    ["Name": "Ben Finkelstein", "Height": "44", "Experience": "false", "Parent": "Aaron and Jill Finkelstein"],
    ["Name": "Diego Solo", "Height": "41", "Experience": "true", "Parent": "Robin and SDarika Solo"],
    ["Name": "Chloe Alaska", "Height": "47", "Experience": "false", "Parent": "David and Jamie Alaska"],
    ["Name": "Arnold Willis", "Height": "43", "Experience": "false", "Parent": "Claire Willis"],
    ["Name": "Phillip Helm", "Height": "44", "Experience": "true", "Parent": "Thomas Helm and Eva Jones"],
    ["Name": "Les Clay", "Height": "42", "Experience": "true", "Parent": "Wyonna Brown"],
    ["Name": "Herschel Krostofski", "Height": "45", "Experience": "true", "Parent": "Hyman and Rachel Krostofski"]
]

let teamNames = ["Dragons", "Sharks", "Raptors"] // Holds Team Names
var noExpPlayers: [[String: String]] = []  // Holds list of players with out experience
var expPlayers: [[String: String]] = []    // Holds list of players with experience
let numberOfTeams = teamNames.count                      // Specifiies number of teams

func dividePlayersIntoExperiencedAndInexperienced(usingPlayers players: [[String: String]]) {
    for player in players {
        if player["Experience"]! == "true" {
            expPlayers.append(player)
        } else {
            noExpPlayers.append(player)
        }
    }
}

// function call
dividePlayersIntoExperiencedAndInexperienced(usingPlayers: players)

// Balance out the arrays of experience and no experience players so that their Hieghts will be within 1.5 inches of each other
func createBalancedHeightTeamFragment(teamFragment: [[String: String]]) -> [[String: String]] {
    var tempFragment: [[String: String]] = teamFragment // mutable temperaary varible
    
    // bubble sort the array
    for count in 0..<tempFragment.count {
        for count2 in (count)..<tempFragment.count {
            if Double(tempFragment[count]["Height"]!)! < Double(tempFragment[count2]["Height"]!)! {
                let temp = tempFragment[count2]
                tempFragment[count2] = tempFragment[count]
                tempFragment[count] = temp
            }
        }
    }

    // swap the first and last element in the array
    let temp = tempFragment[0]
    tempFragment[0] = tempFragment[tempFragment.count - 1]
    tempFragment[tempFragment.count - 1] = temp
    
    // return the array
    return tempFragment
}

// function calls
noExpPlayers = createBalancedHeightTeamFragment(teamFragment: noExpPlayers)
expPlayers = createBalancedHeightTeamFragment(teamFragment: expPlayers)

/***************************************
 Extension Array code curtisy:
 https://www.hackingwithswift.com/example-code/language/how-to-split-an-array-into-chunks
 ***************************************/
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

// divide arrays into an array of teams
var noExperience = noExpPlayers.chunked(into: numberOfTeams)
var experienced = expPlayers.chunked(into: numberOfTeams)

// combine no experienced players with experience
for group in 0..<noExperience.count {
    noExperience[group] += experienced[group]
}
let teams: [[[String: String]]] = noExperience

// compute and print each teams average Height
var teamCount = 0
for team in teams {
    var sum = 0.0
    var numberOfPlayers = 0.0
    for player in team {
        sum += Double(player["Height"]!)!
        numberOfPlayers += 1
    }
    print("the average height of team \(teamNames[teamCount]) is \(sum/numberOfPlayers)")
    teamCount += 1
}








