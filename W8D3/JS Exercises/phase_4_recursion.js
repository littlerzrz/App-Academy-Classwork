function range(start,end) {
    if (end === start) return [start];
    return range(start, end - 1).push(end)
}

function sumRec(arr) {
    if (arr.length === 1) return arr[0];
    return sumRec(arr.slice(0, arr.length-1)) + arr[arr.length-1]
}


// console.log(sumRec([1,2,3,5]))

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

// console.log(fibonacci(4))

function deepDup(arr) {
    if (!(arr instanceof Array)) {
        return arr;
    }
    return arr.map((el) => {
        return deepDup(el);
    });
}

// console.log(deepDup([1,2,[3,[4,5],6],7]))

function bsearch(arr,target) {
    if (arr.length < 1) return -1;
    let midIdx = arr.length / 2;
    if (arr[midIdx === target]) {
        return midIdx
    }
    else if (arr[midIdx] < target) {
         let right = arr.slice(midIdx + 1);
         const subProblem =  bsearch(right, target);
         return  subProblem === -1 ? -1 : subProblem + (midIdx + 1);
    } else {
        let left = arr.slice(0,midIdx);
        return  bsearch(left, target)
    }

}

// console.log(bsearch([1, 2, 3, 4, 5, 6, 7, 8], 6));

function mergesort(arr) {
    if (arr.length <= 1) {return arr;}
    else{
    let midIdx = arr.length/2;
    let left = mergesort(arr.slice(0,midIdx));
    let right = mergesort(arr.slice(midIdx));

    return mergeHelper(left,right)
    }
}

function mergeHelper(arr1, arr2) {
    const result = []
    while (arr1.length > 0 && arr2.length > 0) {
        let nextItem = (arr1[0] < arr2[0]) ? arr1.shift() : arr2.shift();
        result.push(nextItem);
    }
   
    return result.concat(arr1,arr2)
}

// console.log(mergesort([5, 2, 3, 4, 1]))
// console.log(mergesort([6,5,91,30,88]))


// function subsets(array) {
//     if (array.length === 0) {
//         return [arr];
//     }

//     const first = array[0];
//     const withoutFirst = subsets(array.slice(1));
//     // remember, we don't want to mutate the subsets without the first element
//     // hence, the 'concat'
//     const withFirst = withoutFirst.map(sub => [first].concat(sub));

//     return withoutFirst.concat(withFirst);
// }   







function subsets(array) {
    if (array.length === 0) return [[]];
    let preArr = subsets(array.slice(1));
    let length = preArr.length

    for (i = 0; i < length; i ++ ) {
        let dup = preArr[i].slice(0);
        dup.push(array[0]);
        preArr.push(dup);
    }
    return preArr
}

// console.log(subsets([1, 2, 3]))







// # p subsets([]) # => [[]]
// # p subsets([1]) # => [[], [1]]
// # p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
// # p subsets([1, 2, 3])
// # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]



// def subsets(arr)
// return [arr] if arr.empty ?
//     pre_arr = subsets(arr[0...- 1])

//      (0...pre_arr.length).each do | i |
//         dup = pre_arr[i].dup 
//         dup << arr[-1]
//         pre_arr << dup
//      end
//      pre_arr
// end


function subset(arr) {
    if (arr.length === 0) return [[]]
    const last = arr.length
    let prevArr = subset(arr.slice(0, last-1))
    let length = prevArr.length
    
    for (i = 0; i < length; i ++ ) {
        let dup = prevArr[i].slice(0)
        dup.push(arr[last-1])
        prevArr.push(dup)
    }
    return prevArr
}

console.log(subset([1,2,3]))
