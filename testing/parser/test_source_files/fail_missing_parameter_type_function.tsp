//Parameter b in the section function is missing a type.

namespace  Main;

using Locale;
using Big;

scalar ID = ASCIIString {
    requires: value.length();
}

scalar Apple = ASCIIString {
    requires: component.juice();
    requires: component.seed();
}

model User {
    id: ID;
    name: String;
    region: Locale::Country;
    team: List<User,Hey>;
    fan: Bad<Yes>;
    requires: true;
    requires: a.torch();    
}

scalar Apple = ID;

model Test {}

const a:Bool = true;
const sillString:String = 'Yes This is a very Simple String!';

function checkit(): Bool {
    let b:Bool = true;
    let a:String = a.length();
    return u.a.length(pred(a:String): Bool => true);
}

function checkit(a:String, b, c:SomethingFake): Bool {
    return !(5>8) || (!(a || b && c));
}