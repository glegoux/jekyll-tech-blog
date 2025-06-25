---
title: "Secret Santa"
description: "What can be the applied mathematics behind a Secret Santa?"
authors: ["glegoux"]
time_reading_minutes: 5
category: "Applied Mathematics"
---

Secret Santa is a traditional event in December with family, friends, or office colleagues, 
in which each guest gives a gift to another guest without knowing who will give him/her a gift.

Could you imagine that you want to organize it? As an independent, technical, and meticulous 
organizer, you could automate the drawing of pairs (donor, recipient) to work even for an odd 
number of guests. You could implement an algorithm (given later) that generates a directed cyclic 
graph where the vertices are guests and the edges represent the relationship (donor -> recipient).

But you want to increase the pleasure of secrecy, you choose to draw lots for the identity of the recipients 
at the last moment. In this case, the guests do not know neither for whom the gift they buy will be. 
In addition, it counters the effect of a no-show, in which a guest might not receive the pre-chosen 
gift during the event. 

So the identities of gifts (ideally all different), donors, and receivers remain secret until the last 
moment. However, several problems could reduce the surprise effect. Let us understand  it thanks to 
applied mathematics. 

# 🎅 Secret Santa: Hat-check problem

Let's begin with the first problem: to whom each guest gives his/her gift. Let's suppose 
each guest has well his/her gift for a unique other guest. Of course, the draw could 
have been done before and kept secret. But you want to do the draw at the last moment 
and by revealing simultaneously who gives his/her gift to whom. That is to say, you 
write the name of each guest on a different piece of paper for each, and mix it in 
a Christmas hat. Then, each one takes a piece of paper randomly. Finally, all of them, at
the same time, unfold the piece of paper and discover the name of the guest to whom 
he/she gives his/her gift.  

Will a guest draw his/her name at random? If this is the case, the surprise effect will be 
broken for him/her, and what would imply redoing the draw or exchanging gifts? What we 
want to avoid.

This concrete problem can be reformulated: Is there at least a fixed point in the permutation 
of a set with $n$ elements? Where $n$ is the number of guests. It is the famous **hat-check problem**. 
You can use the probabilities to solve it.

The probability that at least one guest draws his/her name is the inverse of
the probability that no one drew his/her name, that is to say:

$$p_n =  1 - \dfrac{\mathcal{D}_{n}}{n!} = 1 - u_n$$

$\mathcal{D}_{n}$ is the number of derangements, that is to say, the number of permutations 
without fixed points, knowing that $n!$ is the number of permutation with $n$ elements. 
You can prove with the **inclusion-exclusion generalized principle** that:

$$\mathcal{D}_{n} = n! \sum_{k=0}^{n} \dfrac{(-1)^k}{k!}$$

According to the **Taylor-Maclaurin development**, we have: 

$$\displaystyle\lim_{n\mapsto +\infty}u_n = \displaystyle\lim_{n\mapsto +\infty}\sum_{k=0}^{n}\dfrac{(-1)^k}{k!} = \dfrac{1}{e}$$

with $e \approx 2.71828...$. In addition, 
this suite $(u_n)_{n\in \mathbb{N}}$ has a rate of convergence quick:

{% include content/image.html
title="Inverse of the probability that a guest draws randomly his/her name"
src="u_n-convergence.png"
%}

So if your number of guests is greater or equal to 4, you have around $0.63\%$ of chance, 
to have at least one guest who drew its name, that is a bit less than 2 out of 3 chances:

$$p_{n\geq 4} \approx \dfrac{2}{3}$$

This simultaneous strategy risks limiting the surprise effect, like the probability that a guest randomly draws his/her name becomes high quickly as a function of the number of guests. An exchange
of pieces of paper or a new drawing must be made. 

However, another sequential strategy could be considered, the same as presented in the introduction, 
to generate a cyclic-oriented graph (donor -> recipient). The algorithm will be:
A guest randomly draws a piece of paper, keeps it, and gives the Christmas hat to
The person whose name is on it. Only the first guest could draw her/his name.
In this case, the person redraws a piece of paper and then puts the paper back with his/her name. 
But here, the surprise effect becomes split into two moments, first discovering the identity of donors progressively,
and then all the gifts simultaneously, instead of one moment previously.

# 🎁 Gift types: Birthday problem

A second problem will be to know if two guests could bring the same type of gift. This is 
equivalent to another famous problem, the **birthday problem**. The probability that 
two people were born on the same day increases quickly depending
on the number of people. It becomes almost certain, that is to say, more than $99\%$ 
of a chance to be valid for a group of 60 people. 

More generally, the probability that a subset of size $n$ of a set $E$ of size $N$
contains at least two identical elements:

$$g_n = 1 - \frac{N}{N}\,\frac{N-1}{N}\,\cdots\,\frac{N-n+1}{N} = 1 - \dfrac{N!}{(N-n)!}\,\dfrac{1}{N^n}$$

It is the inverse of the probability that no $n$ element is the same.

The element $E$ is the set of possible types of Christmas gifts, and $n$ is the number of guests. 
Except for some guests with a very original gift, suppose that your guest chose a 
pre-defined list influenced by the constraints and the ads, with a few hundred types of items, 
let's say $N=300$:

{% include content/image.html
title="Probability to have two identical types of gifts among 300 possible types of Christmas gifts" 
src="g_n-convergence.png"
%}

With an approximation $e^{x} \approx 1 +x$ when $x$ is close to $0$, and the **sum of young Gauss** 
$\sum_{k=0}^{n}\,k = \frac{n(n+1)}{2}$, you can get:

$$g_n \approx 1 - e^{-\frac{n(n-1)}{2N}}$$

But in any case, you see:  

$$\displaystyle\lim_{n\mapsto +\infty}g_n = 1$$ 

And:

$$g_{n\geq 20} \geq \dfrac{1}{2} \qquad g_{n\geq 60} \approx 1$$

If you have more than 20 guests, we have more than 1 out of 2 chances to have
at least two identical types of gifts.

So, I wish you a good Secret Santa 🎄.
