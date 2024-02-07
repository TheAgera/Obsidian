
## Module 8 Normal Distribution

We’ll be looking at the following calculations:

- Probability of being less than a value in a normally distributed population.
- Probability of being more than a value in a normally distributed population.
- Probability of being between two values in a normally distributed population.
- Cut-off value such that a certain percentage of values would be below that value in a normally distributed population.
- Cut-off value such that a certain percentage of values would be above that value in a normally distributed population.

Normal Distribution is the backbone to many satistics work, and most large variables will take on this characteristics, especially the mean.

### Technology corner summary
- P(X<A): normalcdf (-10^99,a,u,q)  used for between two endpoints![[chrome_Cq2RuZlkGM.png]]
- P(X>A) :normalcdf (a,10^99,u,q) left point to infinity![[chrome_5hG8knrAAh.png]]
- The easiest is finding probability between two given values in a ND
- P(a<x<b):![[chrome_qHhF52a6IM.png]]
- Used when finding a data point, we used the inverse norm, input area left to the area of the data point. We just put the probability along with mean and standard dev
- ![[chrome_quBeHt5A89.png]]
- Lastly, we wanna look at that data point such that the data point to the right is the given value. This is done by using compliments and area to the left![[chrome_1lHs8RsJld.png]]
- These are the five situations in this module
- 
- This mean mean is 0 and SD is 1, this is indicated by letter Z
- ![[chrome_unJjBZy7mV.png]]![[chrome_HBxkoUW7O5.png]]
- Drawing pictures is helpful during these. This problems asks us to find right endright so that the area between zero and this endpoint is the answer. In this phrase, it cannot be in the calculator.![[chrome_qrUbWcwYHU.png]]
- This is the problem drawn out.  The next picture replaces the graphs with what they are saying![[chrome_IcxZJ8N6sU.png]]![[chrome_DLGug5I5nY.png]]
- ![[chrome_SGrdPvtVuw.png]]
- He was able to use normalcdf because Z means a mean of 0 and standard deviation of 1
- -10^99,value after  P(, mean, SD
- ![[chrome_M502F6pELs.png]]

When it comes to solving problems pertaining to the normal distribution, there are two functions in your calculator:

- **normalcdf** - This is used when we are trying to find a probability. We need to know the endpoints between which we'd like to find the probability.
- **invNorm** - This is used when we are trying to find a data point on the normal distribution. We need to know the probability of being to the left of the data point in order to find the data point.

In this problem we are being asked to find a data point. We will use invNorm.  
  
In this problem it's important to note that the area from -∞ to 0 is 0.5. After all, it's half of the normal distribution.  
  
Therefore, we know �(-∞<�<�)=0.475+0.5=0.975.  
  
This is telling us the area to the left of � is 0.975.  
  
In order to find � we can use invNorm(0.975,0,1) = 1.96.