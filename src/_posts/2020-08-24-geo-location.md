---
title: "Geo-location"
description: "How to compute the distance between 2 points with given latitude and longitude?"
authors: ["glegoux"]
time_reading_minutes: 10
category: "Maths"
---

We can model the surface of the earth as a sphere of radius $R$. Even if in reality, the earth is more a kind of ellipsoid with a irregular surface, where each point of its surface owns an altitude in relation to the sea level.

{% include image.html title="Coordinates on Earth" src="https://docs.google.com/drawings/d/e/2PACX-1vRdm2uIt-uhISovgxlwTgP6w08Lq8LPqX-vpNz8RVt7cr_sHn8k1Fb5-3d8kVV5Z2K5-Ys8gwEYLfy9/pub?w=480&amp;h=360" %}

Let $p1 = (\text{lat1}, \text{long1})$, $p2 = (\text{lat2}, \text{long2})$ be 2 points on the surface of the earth with a latitude and a longitude given in radian respectively. The latitude has a value between $[-\frac{\pi}{2}, \frac{\pi}{2}]$, and the longitude between $]-\pi, \pi]$. 
So each point is identified by unique way with this tuple: $(\text{latitude}, \text{longitude})$.

{% include image.html title="Distance between 2 points" src="https://docs.google.com/drawings/d/e/2PACX-1vQptEFbx1SxwX-p1QFsK94CvkoJwbVAKXpiQ8FaL9-BJbZnEUw4PYZqce7UnUtD-Hcm01ZRV4vOornF/pub?w=480&amp;h=360" %} 

The distance between $p1$ and $p2$ is the length of an arc circle such as:

$$d(p1, p2) = R\;\alpha$$ 

{% include image.html title="Center angle" src="https://docs.google.com/drawings/d/e/2PACX-1vQtJdsudI5oZcp-eYZ0sRQDvDrSfFfH9uWMG1eTKKkBSLd402xwbJXg3lrVluZ3rn_R6w9OLEJQ8Hzw/pub?w=480&amp;h=360" %} 

where $\alpha \in [0, \pi[$ is the smallest center angle, to avoid an ambiguity because $p1$ and $p2$ belongs to a circle. 
With the formula of scalar product, we can find $\alpha$, because:

$$p1\,.\,p2 = ||p1||\,||p2||\,\cos(\alpha) = R^2 \cos(\alpha)$$

But also, in the cartesian coordinate system, with $\begin{pmatrix} 0 \\\ 0 \\\ 0 \end{pmatrix}$ the center of the earth, we have that a point $p$ on the surface of the earth has for cartesian coordinate:

$$p = \begin{pmatrix} R\cos(\text{lat})\cos(\text{long}) \\\ R\cos(\text{lat})\sin(\text{long}) \\\ R\sin(\text{lat}) \end{pmatrix}$$

Then, we have also:

$$\begin{align*}
p1\,.\,p2 &= R^2\left(\sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2})(\cos(\text{long1})\cos(\text{long2}) + \sin(\text{long1})\sin(\text{long2})\right) \\\
          &= R^2\left(\sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2})\cos(\text{long1} - \text{long2})\right)
\end{align*}$$

So:

$$\cos(\alpha) = \sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2})\cos(\text{long1} - \text{long2})$$

for a historical reason and numerical computation often the haversine fonction $\text{hav}$ is used instead of cosinus:

$$\text{hav}(\alpha) = \sin^2\left(\frac{\alpha}{2}\right)$$

We have $\cos(\alpha) = 1 - 2\text{hav}(\alpha)$, so:

$$1 - 2\text{hav}(\alpha) = \sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2}) - 2\text{hav}(\text{long1} - \text{long2})\cos(\text{lat1})\cos(\text{lat2})$$

That is to say:

$$\begin{align*}
\text{hav}(\alpha) &= \dfrac{1 - (\sin(\text{lat1})\sin(\text{lat2}) + \cos(\text{lat1})\cos(\text{lat2}))}{2} + \text{hav}(\text{long1} - \text{long2})\cos(\text{lat1})\cos(\text{lat2}) \\\
                   &= \dfrac{1 - \cos(\text{lat1 - lat2})}{2} + \text{hav}(\text{long1} - \text{long2})\cos(\text{lat1})\cos(\text{lat2}) \\\
                   &= \text{hav}(\text{lat1} - \text{lat2}) + \text{hav}(\text{long1} - \text{long2})\cos(\text{lat1})\cos(\text{lat2})
\end{align*}$$

We have for $\alpha \in [0, \pi[$:

$$d(p1, p2) = R\,\text{archav}(\text{hav}(\alpha))$$ 

In addition:
 
$$\text{archav}(x) = 2\,\text{arcsin}(\sqrt{x})$$
  
And by putting $y = \text{arcsin}(x)$ and $x = \sin(y)$ with $\tan(y) = \sqrt{\dfrac{\sin^2(y)}{1 - \sin^2(y)}}$ we have:

$$\text{arcsin}(x) = \text{arctan}\left(\sqrt{\dfrac{x^2}{1 - x^2}}\right)$$

So:

$$d(p1, p2) = 2\,R\,\text{arctan}\left(\sqrt{\dfrac{\text{hav}(p1, p2)}{1 - \text{hav}(p1, p2)}}\right)$$

where $\text{hav}(p1, p2) = \text{hav}(\text{lat1} - \text{lat2}) + \text{hav}(\text{long1} - \text{long2})\cos(\text{lat1})\cos(\text{lat2})$
is the harvesine formula.

We can check that the coherence of the formula where $d$ is well a metric distance, it is a positive function, symetric $d(p1, p2) = d(p2, p1)$, and homogeneous $d(p, p) = 0$ 
respecting the triangle inegality. 

In practice, the radius of the earth is  $R = 6371\,km$, and the latitude and longitude are given often in decimal degree and not in radian.
