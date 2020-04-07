import Cocoa

// Convert AM/PM time STRING to Military Time string
var s = "09:04:01PM"

func timeConversion(s: String) -> String {
    
    var hours: String = "66"
    
    // Seperate into 3 chunks with 3rd chunk being awkward
    let threeChunks = s.components(separatedBy: ":")
    let hoursString = threeChunks[0]
    let minutes = threeChunks[1]
    let lastAwkwardChunk = threeChunks[2]   // 01PM or 59AM for example
    
    // Extract the minutes from the awkward chunk
    let seconds = lastAwkwardChunk.prefix(2)

    // Get morning AM or afternoon PM
    let isAfternoon = (lastAwkwardChunk.suffix(2) == "PM")

    // convert hours to military if PM
    if isAfternoon {
        if let hoursInt = Int(hoursString) {
            // Only time you don't add 12 hours to afternoon, is if hours == 12PM
            if hoursInt == 12 {
                hours = hoursString
            } else {
                let hoursMilitaryInt = hoursInt + 12
                hours = String(hoursMilitaryInt)
            }
        } else {
            print("ERROR: input has improper format")
        }
    // MORNING/AM:
    } else {
        if hoursString == "12" {
            hours = "00"
        } else {
        hours = hoursString
        }
    }
    return "\(hours):\(minutes):\(seconds)"
    
//    for index in s.indices {
//        switch index {
//        case 0, 1:
//            hours.append(s[index])
//        case 2, 5, 9:
//            print("we don't care about your colon, or your M")
//        case 3, 4:
//            minutes.append(s[index])
//        case 6, 7:
//            seconds.append(s[index])
//        default:
//            print("unexpected visitor!")
//        }
//    }
}

print(timeConversion(s: s))
s = "12:12:12AM"
print(timeConversion(s: s))
s = "12:59:59PM"
print(timeConversion(s: s))
s = "09:45:45AM"
print(timeConversion(s: s))
s = "09:01:05PM"
print(timeConversion(s: s))

