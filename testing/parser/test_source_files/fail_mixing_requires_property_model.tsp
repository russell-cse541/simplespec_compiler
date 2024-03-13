// Model User has requires and properties out of order.

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
    requires: true;
    region: Locale::Country;
    team: List<User,Hey>;
    fan: Bad<Yes>;
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

function checkit(a:String, b:Bool, c:SomethingFake): Bool {
    return !(5>8) || (!(a || b && c));
}