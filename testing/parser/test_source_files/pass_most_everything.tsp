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

const a:UniCodeString = "Thanks 😊" ;  //smiley face 

const a:EscapedString = "Here is a quote \"4 score and 7 years...\" by someone famous";

const a:ASCIIString = 'Tina said "How\'s the kids? when she got home';
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

function mess(a:String, b:Bool, c:SomethingFake): User {
    let a:Mess =  
        [
            [ 
                a => b , 
                true => 7 
            ],
            [
                true,
                false,
                true
            ],
            [
                fakeVariable,
                anotherOne
            ]
        ];
    return [a, true];
}

function firm(a:String, b:Bool, c:SomethingFake): User {
    return [ a => b , true => 7 ];
}

function tally(a:String, b:Bool, c:SomethingFake): User {
    return [ true , false ];
}

function person(a:String, b:Bool, c:SomethingFake): User {
    return User::checkout.length();
}

function sally(a:String, b:Bool, c:SomethingFake): Bool {
    return !(5>8) || (!(a || b && c));
}

function checkit(a:Bad): Bool {
    return OtherOne::u.a.length(fn(a:String): Bool => true);
}