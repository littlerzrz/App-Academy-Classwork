function range(start,end) {
    if (end === start) return [start];
    return range(start, end - 1).push(end)
}

function sumRec(arr) {
    if (arr.length === 1) return arr[0];
    sumRec(arr.slice(0, arr.laength-1)) + arr[arr.length-1]
    }

function exponent(base,exp) {
    if (exp === 0) return 1;
    return exponent(base, exp-1) * base
}

// console.log(exponent(2,5))

function fibonacci(n) {
    if (n === 1) return [1]
    if (n === 2) return [1,1]

    prevCall = fibonacci(n-1)
    prevCall.push(prevCall[n-2] + prevCall[n-3])

    return prevCall
}

console.log(fibonacci(4))

function deepDup(arr) {
    if (!(arr instanceof Array)) {
        return arr;
    }
    return arr.map((el) => {
        return deepDup(el);
    });
}



// console.log(deepDup([1,2,[3,[4,5],6],7]))