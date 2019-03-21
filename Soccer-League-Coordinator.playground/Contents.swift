let players = [
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

// print(players[1])

var noExpPlayers: [[String: String]] = []
var expPlayers: [[String: String]] = []
var teamSharks: [[String: String]] = []
var teamDragons: [[String: String]] = []
var teamRaptors: [[String: String]] = []
var sharkCount = 0
var dragonCount = 0
var raptorCount = 0
var totalCount = 0
let numberOfTeams = 3

func dividePlayersIntoExperiencedAndInexperienced(usingPlayers players: [[String: String]]) {
    for player in players {
        if player["Experience"]! == "true" {
            expPlayers.append(player)
        } else {
            noExpPlayers.append(player)
        }
    }
}

dividePlayersIntoExperiencedAndInexperienced(usingPlayers: players)

func createBalancedTeamFragment(teamFragment: [[String: String]]) -> [[String: String]] {
    var tempFragment: [[String: String]] = teamFragment
    for count in 0..<tempFragment.count {
        for count2 in (count)..<tempFragment.count {
            if Double(tempFragment[count]["Height"]!)! < Double(tempFragment[count2]["Height"]!)! {
                var temp = tempFragment[count2]
                tempFragment[count2] = tempFragment[count]
                tempFragment[count] = temp
            }
        }
    }
    for count in stride(from: 0, to: 8, by: 2) {
        print("hello")
        var temp = tempFragment[count + 1]
        tempFragment[count + 1] = tempFragment[tempFragment.count - count - 1]
        tempFragment[tempFragment.count] = temp
    }
    return tempFragment
}


print("No Experience")
for player in noExpPlayers {
   print(player)
}




print("No Experience")
for player in createBalancedTeamFragment(teamFragment: noExpPlayers) {
    print(player)
}
