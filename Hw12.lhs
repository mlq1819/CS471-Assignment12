Michael Quinn
Part 1: Do in lab (whoops)
1. Composition
a) Do this by hand: given the following code:
f(x) = 3 - (x * 5)
g(x) = (x -1) * 2
a.i) Let h be defined to be (f.g). What is the result of h(x)? (Reminder that (f.g)x is defined as f(g(x)))
	Well, then g(x) is executed first, which is (x-1)*2. So then f(g(x)) is executed, which resolves to f((x-1)*2), which becomes 3 - (((x-1)*2)*5), which is equivalent to h(x). 
	That can be expanded to h(x) = 13 - 10 * x.
a.ii) Let h2 be defined as (g.f) What is h2(x)?
	Then f(x) is resolved first, into 3-(x*5). That expression is then substituted for x in g(x), which becomes ((3-(x*5))-1) * 2, which is equivalent to h2(x).
	This can be expanded to h2(x) = 4 - 10 * x.
a.iii) What is the value of h(2)?
	Using the previous definition, h(x) = 13 - 10 * x. Substitute x for 2, and that leaves 13 - 10 * 2 = 13 - 20 = -7.
	h(2) = -7.
	Gonna be honest, got this wrong and redid it after checking after doing (b).
a.iv) What is the value of h2(2)?
	Using the previous definition, h2(x) = 4 - 10 * x. Substitute x for 2, and that leaves 4 - 10 * 2 = 4 - 20 = -16.
	h2(2) = -16.
b) Try programming h and h2 in Haskell, using f, g, h, and h2, as well as the composition operator of (.) for the definitions of h and h2. Because composition operators return functions, you don't need an argument for them.

> f x = 3 - (x * 5)
> g x = (x - 1) * 2
> h = f.g
> h2 = g.f

2. Practice with data types:
a) Given the following, state in one sentence what each describes:
a.i) Num a => a -> a -> a
	A function that accepts two numbers; and returns a number.
a.ii) Num a => a -> (a -> a)
	A function that accepts a number; and returns (a function that accepts a number; and returns a number).
a.iii) Eq a => a -> a -> Bool
	A function that accepts two objects with the same comparable type and returns a Bool.
a.iv) (a -> b) -> [a] -> [b]
	A function that takes (a function that takes an object of any type a; and returns an object of any type b), and a list of objects of type a; and returns a list of objects of type b.
	Not part of my answer, but it likely takes a function that transforms a into b and applies it to a given list, returning the output list.
a.v) (a -> b -> a) -> a -> [b] -> a
	A function that takes (a function that takes an object of type a and an object of type b and returns an object of type a), an object of type a, and a list of objects of type b; and returns an object of type a.
a.vi) (a -> a) -> a -> a
	A function that takes (a function that takes an object of type a; and returns an object of type b), and an object of type a; and returns an object of type a.
	Not part of my answer, but this looks like it takes a function and applies it to a passed value, perhaps tweaking its outputs or inputs or applying it multiple times.
a.vii) (b -> c) -> (a -> b) -> a -> c
	A function that takes (a function that takes an object of type b; and returns an object of type c), (a function that takes an object of type a; and returns an object of type b), and an object of type a; and returns an object of type c.
	Not part of my answer, but there's a particularl mathmatical property this describes that I can't remember the name of; this function likely takes two functions who's where one output match's the other's input, as well as the input of the one with a matched output, and chains together the two functions by taking the output of one and connecting it to the input of the other; effectively, this is the same as composition.
a.viii) (a -> Bool) -> [a] -> [a]
	A function that takes (a function that takes an object of type a; and returns a bool), and a list of objects of type a; and returns a list of object of type a.
	Not part of my answer, but this looks like a function that filters a list using an external function; the output list likely only contains elements of the input list that either pass or fail the input function.
b) Given the following functions, predict their types: check the type without arguments and the type of the arguments before usiing :t. Then, try to figure out what the partially applied function must accept following its applied arguments.
b.i) (+) 1
	The type of the function will be Num a => a -> a -> a. The arguments are of type Num, as well as it's return.
	After checking, I realize that I meant the type of the function without arguments. With arguments the type is Num a => a -> a, which is very close to what I had put down.
b.ii) (+) 1 2
	The type of arguments are Num. The type of the function without arguments is Num a => a -> a -> a; its type with arguments is Num a => a.
	After checking, it seems I was correct.
b.iii) (.) (\x -> x * 2)
	The type of the argument is (Num x => x -> x); I will change this to (Num b -> b) for ease. The type of the function without arguments will be (b -> c) -> (a -> b) -> a -> c; its type with its arguments should be Num b ==> (b -> b) -> (a -> b) -> a -> b.
	After checking, I was effectively correct, though I forgot to remove the (b -> b) argument representing the provided argument, and I used b instead of c (which doesn't necessarily matter, since they just represent the same argument).
b.iv) (.) (\x -> x * 2) abs
	The type of the arguments are both (Num a => a -> a). The type of the function without arguments is the same as the previous question; with arguments, its type is Num a => a -> a, though it may also be Num c => c -> c.
	After checking, the answer is Num c => c -> c, which seems to indicate that it maintains it's highest character for the variables in the function, for some reason. Since the original function without parameters is (b -> c) -> (a -> b) -> a -> c, but then both parameters have the same variable available to them, it seems to unify a, b, and c together, as I expected, but it continues using the last assigned name, which is c in this case.
b.v) (.) (+)
	The type of the argument is (Num a => a -> a -> a); however, based on the unification is will likely unify to a=c. The type of the function without parameters has already been discussed at length; so it's actual typing here will be Num c => (a -> c) -> a -> c.
	After checking, I seem to have neglected the fact that (+) requires two parameters; it opts to disregard the fact that it has been using different character to represent different variables and has started numbering them, with the typing Num a1 => (a2 -> a1) -> a2 -> a1 -> a1. This typing indicates that it still expects the second function, but that the user needs to input two parameters for it to add with; what I was defining previously as c is instead a2, and what I was calling a is called a1 here. Effectively, it looks like this: Num c => (a -> c) -> a -> c -> c, which is fairly similar to what I put.
b.vi) (.) (+) (\m -> 10 * m)
	Based on the previous one, we know what the function's typing without arguments should look like: (+) has typing (c -> c -> c), and the other argument has typing (c -> c). Filling in the gaps, the function should have the following typing with its arguments in place: Num c => c -> c -> c. Keep in mind that it may replace c with a1, a2, or a3 if it feels like it without telling me, but I don't know what happens if unifying to a1 will cause it to replace a1 with a.
	After checking, it seems it does all variables unifying to a1 causes it to replace a1 with a, as the outcome was Num a => a -> a -> a. Functionally, this is the same as my answer, so I feel that it is correct.
b.vii) (.) (+) (\m -> 10 * m) 3
	This should be pretty much the same as the last one: (+) has typing (a -> a -> a), the m function has typing (a -> a), and 3 is of type a. The function with its arguments should resolve its typing to Num a => a -> a, given that it is identical to the last one but with one more argument supplied.
	After checking, my answer was accurate.

3. Custom data types
a) Custom types are allowed. There is some text to read and understand. 

> data Point a = Pt a a  deriving (Show, Eq)

The question itself: what is the data type name? What is the constructor name? What happens if you do not use deriving in the type declaration when trying to find if two points are equal?
	The data type name is Point, and the constructor name is Pt. If "deriving" is not used in the type declaration when trying to determine equality between two points, there is a reasonable chance that the equality will fail even when it shouldn't due to type mismatching.
	
b) Write a function "inside r point" which returns true if the point lies inside the circle centered on the origin with radius r.

 inside :: (Num a, Point b) => a -> b -> Bool
 inside r p = ((p !! 1) * (p !! 1)) + ((p !! 2) * (p !! 2)) <= (r * r)

