// The word requires is misspelled on line 13.
// The word const is misspelled on line 27.

namespace  Main;

using Locale;
using Big;

scalar ID = ASCIIString {
    requires: value.length();
}

scalar Apple = ASCIIString {
    requiress: component.juice();
    requires: component.seed();
}


model User {
    id: ID;
    name: String;
    region: Locale::Country;
    team: List<User,Hey>;
    fan: Bad<Yes>;
}

cost a:Bool = true;
const sillString:String = 'Yes This is a very Simple String!';

function checkit(): Bool {
    let b:Bool = true;
    let a:String = a.length();
    return u.a.length(pred(a:String): Bool => true);
}

function checkit(a:String, b:Bool, c:SomethingFake): Bool {
    return !(5>8) || (!(a || b && c));
}