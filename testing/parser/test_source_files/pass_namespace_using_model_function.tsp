// This is a comment

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
    let success:Bool = true;
    if (a == b && c < d && !(a || b)) {
        if (5 > y) {
            return false;
        } elif ( 7 < (7 + 6)) {
            return true;
        } elif ( 8i < 1n ) {
            return true;
        } else {
            return a < b;
        }
    } else {
        if (true) {
            if (y == x) {
                return true;
            } elif ( y ==> t ) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }         
    }
    let b:Bool = true;
    let a:String = a.length();
    return u.a.length(pred(a:String): Bool => true);
}

function checkit(a:String, b:Bool, c:SomethingFake): Bool {
    return !(5>8) || (!(a || b && c));
}