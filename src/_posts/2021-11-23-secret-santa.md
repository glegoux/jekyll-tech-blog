---
title: "Secret Santa"
description: "What can be the applied mathematics behind a secret santa?"
authors: ["glegoux"]
time_reading_minutes: 5
category: "Applied Mathematics"
---

Secret Santa is a traditional event in December with family, friends, or office colleagues, 
in which each guest gives a gift to another guest without knowing who will give him/her a gift. 
Could you imagine that you want to organize it? You notify your guests to choose a gift by keeping it secret. 
For maximum surprise, you would like to give each gift to a guest with a draw at the last 
minute. So your guests don't know for whom the gift that he/she chose will be. However, several problems
are raised that can be answered by applied mathematics. 

# Hat-check problem

Let's begin with the first problem: to whom each guest gives his/her gift. Let's suppose 
each guest has well his/her gift for a unique other guest. Of course, the draw could 
have been done before and kept secret. But you want to do the draw at the last moment 
and by revealing simultaneously who gives his/her gift to whom. That is to say, you 
write the name of each guest on a different piece of paper for each and mix it in 
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

It is risky to choose this simultaneous strategy, and it breaks the surprise phenomenon 
when everyone unfolds the paper if a guest randomly draws his/her name. An exchange
of papers or a new drawing of lots must be made. Another sequential strategy could be considered, 
a guest draws randomly a piece of paper, keeps it, and gives the Christmas hat to
the person whose name is on the paper. Only the first guest could draw her/his name, 
but all she/he has to do is redraw a piece of paper and then put the paper back with his/her name.

# Birthday problem

A second problem will be to know if 2 guests could bring the same type of gift. This one is 
equivalent to another famous problem, the **birthday problem**. The probability that 
two people were born on the same day increases quickly depending
on the number of people. It becomes almost certain, that is to say, more than $99\%$ 
of a chance to be true for a group of 60 people. 

More generally, the probability that a subset of size $n$ of a set $E$ of size $N$
contains at least 2 identical elements:

$$g_n = 1 - \frac{N}{N}\,\frac{N-1}{N}\,\cdots\,\frac{N-n+1}{N} = 1 - \dfrac{N!}{(N-n)!}\,\dfrac{1}{N^n}$$

It is the inverse of the probability that no $n$ element is the same.

The element $E$ is the set of possible types of Christmas gifts, and $n$ is the number of guests. 
Except for some guests with a very original gift, suppose that your guest chose a 
pre-defined list influenced by the constraints and the ads, with a few hundred types of items, 
let's say $N=300$:

{% include content/image.html
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

If you have more than 20 guests, we have more than 1 out of 2 chances to have
at least 2 identical types of gifts.

So after explaining these 2 problems, I wish you a good Secret Santa.
