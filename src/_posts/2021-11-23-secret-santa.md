---
title: "Secret Santa"
description: "What can be the applied mathematics behind a secret santa?"
authors: ["glegoux"]
time_reading_minutes: 5
category: "Applied Mathematics"
---

Secret Santa is a traditional event in which each member of a group is randomly
assigned a person to whom they give a gift. Imagine that you want to organize a 
lunch with your family, friends or your work teammates before the end of year 
celebrations: Christmas and New year. Why not do a Secret Santa? You notify your
guests to choose a gift, and to keep it secret. And you want to attribute the gift 
with a draw at the beginning of the lunch. But several questions are raised. 
How to organize this draw ? Are there identical type of gifts ?

# Hat-check problem

Let's begin by the first question. Hopefully, each guest has well his/her gift. 
Of course, the draw could have been done before, and moreover each guest could have 
known for which guest was its gift. But you decided that it is funnier to do the draw 
at the last moment without a mobile app, with a traditional way, a piece of 
paper for each guest where its name is written, you mix it in a Christmas hat.
Then each one chooses a piece of paper randomly without looking. And all ones 
at the same time unfolds the piece of paper, and discover the name of the guest
to whom he/she is offering his/her gift. Does a guest draw at random his/her name?

You see that this concrete problem can be reformulate: Is there a least a fixed point
in the permutation of a set with $n$ elements? It is the famous **hat-check problem**.
You can use the probabilities to solve it.

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

# Birthday paradox

Knowing if 2 invites brings the same type of gift is equivalent to another famous problem
the **birthday paradox**. The probability that 2 people were born on the same day
in a group of people increases quickly in function of the size of this group. It
becomes almost certain, that is to say more than $99\%$ of chance to be true for 
a group of 60 people. 

More generally, the probability that a subset of size $n$ of a set $E$ of size $N$
contains at least 2 identical elements is:

$$g_n = 1 - \frac{N}{N}\,\frac{N-1}{N}\,\frac{N-n+1}{N} = 1 - \dfrac{N!}{(N-n)!}\,\dfrac{1}{N^n}$$

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
