Michael Quinn
Part 1: Do in lab (whoops)
1. Composition
a) Do this by hand: given the following code:
f(x) = 3 - (x * 5)
g(x) = (x -1) * 2
a.i) Let h be defined to be (f.g). What is the result of h(x)? (Reminder that (f.g)x is defined as f(g(x)))
	Well, then g(x) is executed first, which is (x-1)*2. So then f(g(x)) is executed, which resolves to f((x-1)*2), which becomes 3 - (((x-1)*2)*5), which is equivalent to h(x). 
	That can be expanded to h(x) = 10 * x - 7.
a.ii) Let h2 be defined as (g.f) What is h2(x)?
	Then f(x) is resolved first, into 3-(x*5). That expression is then substituted for x in g(x), which becomes ((3-(x*5))-1) * 2, which is equivalent to h2(x).
	This can be expanded to h2(x) = 4 - 10 * x.
a.iii) What is the value of h(2)?
	Using the previous definition, h(x) = 10 * x - 7. Substitute x for 2, and that leaves 10 * 2 - 7 = 20 - 7 = 13.
	h(2) = 13.
a.iv) What is the value of h2(2)?
	Using the previous definition, h2(x) = 4 - 10 * x. Substitute x for 2, and that leaves 4 - 10 * 2 = 4 - 20 = -16.
	h2(2) = -16.
b) Try programming h and h2 in Haskell, using f, g, h, and h2, as well as the composition operator of (.) for the definitions of h and h2. Because composition operators return functions, you don't need an argument for them.

> f x = 3 - (x * 5)
> g x = (x - 1) * 2
> h = f.g
> h2 = g.f

