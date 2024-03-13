// There is a stray character on line 22, line 13, and line 31 

namespace  Main;

using Locale;
using Big;

scalar ID = ASCIIString {
    requires: value.length();
}

scalar Apple = ASCIIString {
    requires: component.juice(*);
    requires: component.seed();
}


model User {
    id: ID;
    name: String;
    region: Locale::Country;
    team: #List<User,Hey>;
    fan: Bad<Yes>;
}

const a:Bool = true;
const sillString:String = 'Yes This is a very Simple String!';

function checkit(): Bool {
    let b:Bool = true;
    let a:String = a.$length();
    return u.a.length(pred(a:String): Bool => true);
}

function checkit(a:String, b:Bool, c:SomethingFake): Bool {
    return !(5>8) || (!(a || b && c));
}