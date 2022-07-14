---
title: "Secret Santa"
description: "What can be the applied mathematics behind a secret santa?"
authors: ["glegoux"]
time_reading_minutes: 5
category: "Applied Mathematics"
---

Secret Santa is a traditional event in which each member of a group is randomly
paired to another member to whom they give a gift. Imagine that you want to 
organize it. You notify your guests to choose a gift without knowming for whom and without
saying what he/she chooses. And you want to attribute each gift to a person with a draw 
at the beginning of your event. But several problems are raised, that can be answered 
by applied mathematics. 

# Hat-check problem

Let's begin by a first problem. To whom each guest gives his/her gift. Let's suppose 
each guest has well his/her gift for an unique other guest. Of course, the draw could 
have been done before and kept secret. But you want to do the draw at the last moment 
and simultaneously. That is to say, you write the name of each guest on a different 
piece of paper for each one, you mix it in a Christmas hat. Then each one takes a piece 
of paper randomly. And finally all ones at the same time unfolds the piece of paper, and 
discover the name of the guest to whom he/she gives his/her gift.  

Does a guest draw at random his/her name? If it is the case, the surprise effect will be 
broken, and what would imply to redo the draw or to exchange gifts. What we want to avoid.

This concrete problem can be reformulated: Is there a least a fixed point in the permutation 
of a set with $n$ elements? It is the famous **hat-check problem**. You can use the 
probabilities to solve it.

The probability that at least one guest draws his/her name is the inverse of
the probability that no one drawns his/her name, that is to say:

$$p_n =  1 - \dfrac{\mathcal{D}_{n}}{n!} = 1 - u_n$$

where $n$ is the number of guests, $\mathcal{D}_{n}$ is the number of derangements, 
that is to say the number of permutations without fixed points, knowing that $n!$
is the number of permutation with $n$ elements. You can prove with the **inclusion–exclusion 
generalized principle** that:

$$\mathcal{D}_{n} = n! \sum_{k=0}^{n} \dfrac{(-1)^k}{k!}$$

According to the **Taylor-Maclaurin development**, we have: 

$$\displaystyle\lim_{n\mapsto +\infty}u_n = \displaystyle\lim_{n\mapsto +\infty}\sum_{k=0}^{n}\dfrac{(-1)^k}{k!} = \dfrac{1}{e}$$

with $e \approx 2.71828...$. In addition, 
this suite $(u_n)_{n\in \mathbb{N}}$ has a rate of convergence quick:

{% include article-image.html
title="Inverse of the probability that a guest draws randomly his/her name"
src="u_n-convergence.png"
%}

So if your number of guest is greater or equal than 4, you have around $0.63\%$ of chance, 
to have at least one guest who drawn its name, that is a bit less than 2 out of 3 chances:

$$p_{n\geq 4} \approx \dfrac{2}{3}$$

It is risky to choose this simultaneous strategy, and it breaks the surprise phenomena 
when everyone unfolds the paper, if a guest randomly draws his/her own name. An exchange
of papers or a new drawing of lots must be made. Another strategy this time sequential, 
is a guest takes turns drawing randomly a piece of paper and giving the Christmas hat to
the person whose name is on the paper. Only the first guest could be drawn his/her name, 
but all he has to do is redraw a paper then put the paper back with his/her name.

# Birthday problem

A second problem will to know if 2 invites brings the same type of gift. This one is 
equivalent to another famous problem the **birthday paradox**. The probability that 
2 people were born on the same day in a group of people increases quickly in function 
of the size of this group. It becomes almost certain, that is to say more than $99\%$ 
of chance to be true for a group of 60 people. 

More generally, the probability that a subset of size $n$ of a set $E$ of size $N$
contains at least 2 identical elements is:

$$g_n = 1 - \frac{N}{N}\,\frac{N-1}{N}\,\cdots\,\frac{N-n+1}{N} = 1 - \dfrac{N!}{(N-n)!}\,\dfrac{1}{N^n}$$

It is the inverse of the probability that no of $n$ elements be identical.

Here the element $E$ is the set of possible types of Christmas gifts, and $n$ the number of guests. 
Except some guests with a very original gift, suppose that your guest chose in a 
pre-defined list influenced by the constraints and the ads, with few hundreds types of items, 
let's say $N=300$:

{% include article-image.html
title="Probability to have 2 identical types of gifts among 300 possible types of Christmas gifts" 
src="g_n-convergence.png"
%}

With an approximation $e^{x} \approx 1 +x$ when $x$ is close to $0$, and the **sum of young Gauss** 
$\sum_{k=0}^{n}\,k = \frac{n(n+1)}{2}$, you can get:

$$g_n \approx 1 - e^{-\frac{n(n-1)}{2N}}$$

But in any case, you see:  

$$\displaystyle\lim_{n\mapsto +\infty}g_n = 1$$ 

And:

$$g_{n\geq 20} \geq \dfrac{1}{2} \qquad g_{n\geq 60} \approx 1$$

If you have more than 20 guests, we have more than 1 out of 2 chances, to have
at least 2 identical types of gifts.

So after explaininig these 2 problems, I wish you a good Secret Santa.
