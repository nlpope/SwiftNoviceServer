import Vapor

struct Prerequisite: Content {
    let courseName: String?
    let courseLink: String?
    let instructor: String?
    let price: Double?
    let avatarUrl: String?
}





func routes(_ app: Application) throws {
    /**
    run then enter below url:
     http://127.0.0.1:8080/getPrerequisites
     */

    app.get("getPrerequisites") { req async -> [Prerequisite] in
        var prerequisites = [Prerequisite]()
        
        let gitCourse = Prerequisite(
            courseName: "Git beginner course",
            courseLink: "https://learngitbranching.js.org/",
            instructor: "Will Smythe",
            price: 0.00, 
            avatarUrl: "")
        
        let seanAllenBeginnerCourse = Prerequisite(
            courseName: "Swift beginner course",
            courseLink: "https://www.youtube.com/watch?v=CwA1VWP0Ldw&t=9859s&ab_channel=SeanAllen",
            instructor: "Sean Allen",
            price: 0.00, 
            avatarUrl: "")
        
        let seanAllenTakeHomeProject = Prerequisite(
            courseName: "Dev Interview Prep - Take Home Project",
            courseLink: "https://www.youtube.com/watch?v=JzngncpZLuw&ab_channel=SeanAllen",
            instructor: "Sean Allen",
            price: 0.00, 
            avatarUrl: "")
        
        // mark w book & dollar sign icon
        let hackingWithIosBook = Prerequisite(
            courseName: "Hacking with iOS book",
            courseLink: "https://www.hackingwithswift.com/career-guide",
            instructor: "Paul Hudson",
            price: 45.00,
            avatarUrl: "")
        
        let stanfordXcodeTips = Prerequisite(
            courseName: "Stanford CS193P iOS course - Debugging and Xcode tips & tricks",
            courseLink: "https://www.youtube.com/watch?v=CRxHhx_pubY&list=PL3d_SFOiG7_8ofjyKzX6Nl1wZehbdiZC_&index=3&ab_channel=CS193P",
            instructor: "Jason Riggs",
            price: 0.00,
            avatarUrl: "")
        
        let stewartLynchMasteringXcode = Prerequisite(
            courseName: "Mastering Xcode",
            courseLink: "https://www.youtube.com/watch?v=ia-X9-wsne8&list=PLBn01m5Vbs4CUCcA3fqvsRtx153akAJU1&index=2",
            instructor: "Stewart Lynch",
            price: 0.00, 
            avatarUrl: "")
        
        // rename this server to SwiftNoviceServer so you can clearly include the proects as well then ...
        // add getting started with github (search on YT), learn to code 1, learn to code 2, & blu's adventure (swift playgrounds)
        
        var mutatedArray = prerequisites.multiAppend(toArray: &prerequisites, courses: gitCourse, seanAllenBeginnerCourse, hackingWithIosBook, stanfordXcodeTips, stewartLynchMasteringXcode, seanAllenTakeHomeProject)
        
        return mutatedArray
    }
}


extension Array {
    
    func multiAppend<T: Content>(toArray array: inout [T], courses: T...) -> [T] {
        var array = array
        for course in courses {
            array.append(course)
        }
        return array
    }
}
