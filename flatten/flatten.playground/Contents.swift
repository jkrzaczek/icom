//: Playground - noun: a place where people can play

import Cocoa

var test1 = [[1,2,[3]],4] as [Any];
var test2 = [1,[2],3,[4],[5,[6,[7,8]]],9] as [Any];
var test3 = [1,2,3];
var test4 = [[1],[2,3],[4,5]];
var test5 = [] as [Any];
var test6 = [1,"a","b",2,3,[4,5],[6,"c","d",7],[[[[8],9]]],10] as [Any];

var tests = [test1, test2, test3, test4, test5, test6];

extension Array {
    func flatten() -> Array
    {
        var result = [] as Array;
        
        for item in self
        {
            if item is Array
            {
                result.append(contentsOf: self.flatten());
            }
            else
            {
                result.append(item);
            }
        }
        
        return result;
    }
}

func flattenToArrayOfInt(_ arr: [Any]) -> [Int]
{
    var result : [Int] = [];
    
    for item in arr
    {
        if item is Int
        {
            result.append(item as! Int);
        }
        else if item is [Any]
        {
            result.append(contentsOf: flattenToArrayOfInt(item as! [Any]));
        }
        else
        {
            print("Unexpected item: ", item);
        }
    }
    
    return result;
}

func flatten(_ arr: [Any]) -> [Any]
{
    var result : [Any] = [];
    
    for item in arr
    {
        if item is [Any]
        {
            result.append(contentsOf: flatten(item as! [Any]));
        }
        else
        {
            result.append(item);
        }
    }
    
    return result;
}

var i = 1;
print("Extension of array tests")
for arr in tests
{
    print("Test ", i, " of ", tests.count);
    i += 1;
    
    print("input: ", arr);
    print("result:", arr.flatten());
    print("----------------");
    
}

i = 1;
print("===================================================");
print("flattenToArrayOfInt tests")
for arr in tests
{
    print("Test ", i, " of ", tests.count);
    i += 1;
    
    print("input: ", arr);
    print("result:", flattenToArrayOfInt(arr));
    print("----------------");
    
}

i = 1;
print("===================================================");
print("flatten tests")

for arr in tests
{
    print("Test ", i, " of ", tests.count);
    i += 1;
    
    print("input: ", arr);
    print("result:", flatten(arr));
    print("----------------");
    
}