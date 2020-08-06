function sum(...args){
    let total = 0;
    args.forEach((el) => {
        total += el;
    })

    return total;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);


class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

//function instance => myBind

Function.prototype.myBind = function (dog) {
    return () => {
        this.call(dog)
    }
}


// Function.prototype.myBind = function (ctx, ...args) {
//     return () => {
//         this.apply(ctx,args)
//     }
// };


Function.prototype.myBind = function (ctx, ...args) {
    return (...args) => {
        this.apply(ctx, args);
    };
};


// Function.prototype.myBind = function (ctx, arg1, ...args) {
//   return (args) => {
//     this.call(ctx, arg1, args);
//   };
// };

// Function.prototype.myBind1 = function (ctx) {
//     const fn = this;
//     const bindArgs = Array.from(arguments).slice(1);
//     return function _boundFn() {
//         const callArgs = Array.from(arguments);
//         return fn.apply(ctx, bindArgs.concat(callArgs));
//     };
// };

Function.prototype.myBind = function (ctx, ...bindArgs) {
    return (...callArgs) => this.apply(ctx, bindArgs.concat(callArgs));
};



markov.says("meow", "Ned");
markov.says.myBind(pavlov, "meow", "Kush")();
markov.says.myBind(pavlov)("meow", "a tree");
markov.says.myBind(pavlov, "meow")("Markov");



const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");























// Function.prototype.myBind = function (ctx) {
//     return () => {
//         this.apply(ctx);
//     };
// };