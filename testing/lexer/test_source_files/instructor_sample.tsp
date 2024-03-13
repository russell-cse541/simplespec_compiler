// This is a comment

namespace  Main;

using Locale;

scalar ID = ASCIIString {
    requires: value.length();
}

model User {
    id: ID;
    name: String;
    region: Locale::Country;
    team: List<User>;
}

function checkit(u: User): Bool {
    let a:String = a<Yes<Bool>>();
    return true;
}

