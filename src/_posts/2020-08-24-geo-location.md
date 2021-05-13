---
title: "Geo-location"
description: "How to compute the distance between 2 points with given latitude and longitude?"
authors: ["glegoux"]
time_reading_minutes: 10
category: "Applied Mathematics"
tags: ["Geometry"]
---

We can model the surface of the earth as a sphere of radius $R$. Even if in reality, the earth is more a kind of ellipsoid with an irregular surface, where each point of its surface owns an altitude in relation to the sea level.

{% include article-google-drawing.html title="Coordinates on earth with latitude and longitude" src="https://docs.google.com/drawings/d/e/2PACX-1vRdm2uIt-uhISovgxlwTgP6w08Lq8LPqX-vpNz8RVt7cr_sHn8k1Fb5-3d8kVV5Z2K5-Ys8gwEYLfy9/pub?w=480&amp;h=360" %}

Let $p1 = (\text{lat1}, \text{long1})$, $p2 = (\text{lat2}, \text{long2})$ be 2 points on the surface of the earth with a latitude and a longitude given in radian respectively. The latitude has a value between $[-\frac{\pi}{2}, \frac{\pi}{2}]$, and the longitude between $]-\pi, \pi]$. So each point is identified by unique way with this tuple: latitude and longitude. There is at least a great circle of the sphere passing both through $p1$ and $p2$, either an infinity if $p1$, $p2$ and the center of the sphere are aligned in the ambient space, or an unique one. The smallest length of a path joining $p1$ and $p2$ on the earth surface is the size of the minor circular arc of a great circle. A such arc is called a geodesic, that we note $d(p1, p2)$ its size. We put $\alpha \in [0, \pi]$ is the smallest central angle, to avoid all ambiguities, because $p1$ and $p2$ belong to a circle, and define 2 circular arcs: the minor one and the major one, respectively with a size $d(p1, p2)$ and $2\pi R - d(p1, p2)$. If $\alpha = 0$, then $p1$ and $p2$ are confused, and if $\alpha = \pi$, then $p1$ is the antipode of $p2$ (diametrically opposite, and reciprocally).  

{% include article-google-drawing.html title="Smallest distance between 2 points on the earth surface" src="https://docs.google.com/drawings/d/e/2PACX-1vQptEFbx1SxwX-p1QFsK94CvkoJwbVAKXpiQ8FaL9-BJbZnEUw4PYZqce7UnUtD-Hcm01ZRV4vOornF/pub?w=480&amp;h=360" %} 

So:

$$
d(p1, p2) = R\;\alpha
$$

With the formula of scalar product, we can find $\alpha$, because:

$$
p1\,.\,p2 = ||p1||\,||p2||\,\cos(\alpha) = R^2 \cos(\alpha)
$$

But also, in the cartesian coordinates system, with $( 0, 0, 0 )$ the center of the earth, we have that a point $p = (\text{lat}, \text{long})$ on the surface of the earth has for cartesian coordinates:

$$
p = \begin{pmatrix} R\cos(\text{lat})\cos(\text{long}) \\\ R\cos(\text{lat})\sin(\text{long}) \\\ R\sin(\text{lat}) \end{pmatrix}
$$

Indeed, even if it means changing reference points, we can always by symmetry come back to this diagram:

{% include article-google-drawing.html title="Cartesian coordinates on earth" src="https://docs.google.com/drawings/d/e/2PACX-1vSo-qbr70ZR3v_49gXzE7HI6cv0jgPXLEANpuZaNszi0QAL3NLIzjAd34V-s-2nCAtSaiW3AXno0urI/pub?w=529&h=323" %} 

Then, we have also:

$$
\begin{align*}
p1\,.\,p2 &= R^2\left(\sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2})(\cos(\text{long1})\cos(\text{long2}) + \sin(\text{long1})\sin(\text{long2})\right) \\\
          &= R^2\left(\sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2})\cos(\text{long1} - \text{long2})\right)
\end{align*}
$$

So:

$$
\cos(\alpha) = \sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2})\cos(\text{long1} - \text{long2})
$$

By applying the function $\text{arccos}: [-1, 1] \rightarrow [0, \pi]$ the reciprocal bijection of $\cos$ on $[0, \pi]$, we get the smallest center angle $\alpha$, and:

$$
\boxed{ 
  d(p1, p2) = R\,\text{arccos}\big(\sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2})\cos(\text{long1} - \text{long2})\big) 
}
$$

For a historical reason and numerical computation often the haversine fonction $\text{hav}: \mathbb{R} \rightarrow [0, 1]\quad x \mapsto \sin^2\left(\frac{x}{2}\right)$.

We have $\cos(\alpha) = 1 - 2\text{hav}(\alpha)$, so:

$$
1 - 2\text{hav}(\alpha) = \sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2}) - 2\text{hav}(\text{long1} - \text{long2})\cos(\text{lat1})\cos(\text{lat2})
$$

That is to say:

$$
\begin{align*}
\text{hav}(\alpha) &= \dfrac{1 - (\sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2}))}{2} + \text{hav}(\text{long1} - \text{long2})\cos(\text{lat1})\cos(\text{lat2}) \\\
                   &= \dfrac{1 - \cos(\text{lat1 - lat2})}{2} + \text{hav}(\text{long1} - \text{long2})\cos(\text{lat1})\cos(\text{lat2}) 
\end{align*}
$$

Thus, we get the harvesine relation:

$$
\boxed{ 
  hav(p1, p2) = \text{hav}(\text{lat1} - \text{lat2}) + \text{hav}(\text{long1} - \text{long2})\cos(\text{lat1})\cos(\text{lat2}) 
}
$$

Where $hav: \left(\left[-\frac{\pi}{2}, \frac{\pi}{2}\right] \times ]-\pi, \pi]\right)^2 \rightarrow [0, 1]$ is defined by overloading of 
$hav$ on $[0, \pi]$ by a change of variables $hav(p1, p2) = hav(\alpha)$, because the couple $(p1, p2)$ defines a unique $\alpha$ (it is not reciprocal).

By using $\text{archav}: [0, 1] \rightarrow [0, \pi]$ the reciprocal bijection of $\text{hav}$ on $[0, \pi]$, we have for $\alpha \in [0, \pi]$:

$$
d(p1, p2) = R\,\text{archav}(\text{hav}(\alpha))
$$ 

In addition $\forall x \in [0, 1]$:
 
$$
\text{archav}(x) = 2\,\text{arcsin}(\sqrt{x})
$$
  
And by putting $y = \text{arcsin}(x)$ and $x = \sin(y)$ with $\tan(y) = \sqrt{\dfrac{\sin^2(y)}{1 - \sin^2(y)}}$ we have for $x \neq 1$:

$$
\text{arcsin}(x) = \text{arctan}\left(\sqrt{\dfrac{x^2}{1 - x^2}}\right)
$$

So:

$$
d(p1, p2) = 2\,R\,\text{arctan}\left(\sqrt{\dfrac{\text{hav}(p1, p2)}{1 - \text{hav}(p1, p2)}}\right)
$$

In order to have a valid formula for the case where $\text{hav}(p1, p2) = \text{hav}(\alpha) = 1$, that is to say for $\alpha = \pi$, we introduce the function: 

$$
\text{atan2}: \mathbb{R}^+ \times \mathbb{R}^+ \backslash \left\{0, 0\right\} \quad (x,y) \mapsto \left\{
    \begin{array}{ll}
        \text{arctan}\left(\frac{x}{y}\right) & \text{if } y > 0 \\\
        \frac{\pi}{2} & \text{if } y = 0
    \end{array}
\right.
$$

So:

$$
\boxed{ 
  d(p1,p2) = 2\,R\,\text{atan2}\left( \sqrt{\text{hav}(p1, p2)}, \sqrt{1 - \text{hav}(p1, p2)} \right) 
}
$$

We can check that the coherence of the formula where $d$ is well a metric distance, it is a positive function, symetric $d(p1, p2) = d(p2, p1)$, and homogeneous $d(p, p) = 0$ 
respecting the triangle inegality. 

In practice, the radius of the earth is  $R = 6371\,km$, and the latitude and longitude are given often in decimal degree and not in radian.
