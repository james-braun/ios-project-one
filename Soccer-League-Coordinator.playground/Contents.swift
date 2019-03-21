let players = [
    ["Name": "Joe Smith", "Height": "42.0", "Experience": "true", "Parent": "Jim and Jan Smith"],
    ["Name": "Jill Tanner", "Height": "38.0", "Experience": "true", "Parent": "Clara Tanner"],
    ["Name": "Bill Bon", "Height": "43.0", "Experience": "true", "Parent": "Sara and Jenny Bon"],
    ["Name": "Eva Gordon", "Height": "45.0", "Experience": "false", "Parent": "Wendy and Mike Gordon"],
    ["Name": "Matt Gill", "Height": "40.0", "Experience": "false", "Parent": "Charles and Silvia Gill"],
    ["Name": "Kimmy Stein", "Height": "41.0", "Experience": "false", "Parent": "Bill and Hillary Stein"],
    ["Name": "Sammy Adams", "Height": "45.0", "Experience": "false", "Parent": "Jeff Adams"],
    ["Name": "Karl Saygan", "Height": "42.0", "Experience": "true", "Parent": "Heather Bledsoe"],
    ["Name": "Suzane Greenberg", "Height": "44.0", "Experience": "true", "Parent": "Henrietta Dumas"],
    ["Name": "Sal Dall", "Height": "41.0", "Experience": "false", "Parent": "Gala Dall"],
    ["Name": "Joe Kavalier", "Height": "39.0", "Experience": "false", "Parent": "Sam and Elaine Kavalier"],
    ["Name": "Ben Finkelstein", "Height": "44.0", "Experience": "false", "Parent": "Aaron and Jill Finkelstein"],
    ["Name": "Diego Solo", "Height": "41.0", "Experience": "true", "Parent": "Robin and SDarika Solo"],
    ["Name": "Chloe Alaska", "Height": "47.0", "Experience": "false", "Parent": "David and Jamie Alaska"],
    ["Name": "Arnold Willis", "Height": "43.0", "Experience": "false", "Parent": "Claire Willis"],
    ["Name": "Phillip Helm", "Height": "44.0", "Experience": "true", "Parent": "Thomas Helm and Eva Jones"],
    ["Name": "Les Clay", "Height": "42.0", "Experience": "true", "Parent": "Wyonna Brown"],
    ["Name": "Herschel Krostofski", "Height": "45.0", "Experience": "true", "Parent": "Hyman and Rachel Krostofski"]
]

// print(players[1])

var teamSharks: [[String: String]] = []
var teamDragons: [[String: String]] = []
var teamRaptor: [[String: String]] = []
var teamSharksNoExp: [[String: String]] = []
var teamDragonsNoExp: [[String: String]] = []
var teamRaptorNoExp: [[String: String]] = []
var sharkCount = 0
var dragonCount = 0
var raptorCount = 0
var sharkCountNoExp = 0
var dragonCountNoExp = 0
var raptorCountNoExp = 0
var totalCount = 0
let numberOfTeams = 3
for player in players {
    if player["Experience"]! == "true" && sharkCount <= totalCount {
        teamSharks.append(player)
        sharkCount += 1
    } else if player["Experience"]! == "true" && dragonCount <= totalCount {
        teamDragons.append(player)
        dragonCount += 1
    } else if player["Experience"]! == "true" && raptorCount <= totalCount {
        teamRaptor.append(player)
        raptorCount += 1
    } else if dragonCount >= totalCount && sharkCount >= totalCount && raptorCount >= totalCount {
        if player["Experience"]! == "true" {
            teamSharks.append(player)
            sharkCount += 1
        }
        totalCount += 1
        
    }
}

func createNoExperienceTeams(players: [[String: String]]) -> (sharks: [[String: String]], dragons: [[String: String]], raptors: [[String: String]]) {
    var count = 1
    for player in players {
        if player["Experience"]! == "false" {
            switch count % numberOfTeams {
                case 0: teamSharksNoExp.append(player)
                case 1: teamDragonsNoExp.append(player)
                case 2: teamRaptorNoExp.append(player)
                default: print("error")
            }
        }
        print(count % numberOfTeams)
        count += 1
    }
    return (teamSharksNoExp, teamDragonsNoExp, teamRaptorNoExp)
}
let NoExp = createNoExperienceTeams(players: players)
print("shark team")
for player in NoExp.sharks {
   print(player)
}
print("dragon team")
for player in teamDragonsNoExp {
    print(player)
}
print("raptor team")
for player in teamRaptorNoExp {
    print(player)
}
Int("43")
