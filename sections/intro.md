Introduction
============

Research Question
-----------------

*What kinds of knowledge about a problem can we gain using the formulations that become available when a more accurate model is used?*

Primary Hypothesis
------------------

*Compared to using many, less-aggregated objective functions, highly aggregated objectives make it more difficult to exploit the design opportunities afforded by using a more accurate model.*

Motivation
----------

Once you start talking about more expensive objective functions, it's hard to ignore the influence of EGO. EGO's major selling point is the idea that it requires very few expensive function evaluations to optimize. But its major drawback is that it optimizes a single utility function. What I want to point out is that using a single utility function can make your optimization results less useful even as they become more accurate. Whether the utility function benefits from the extra variables depends on what it is, and on how complicated its dependency structure with respect to the variables is. I'll optimize mixed-integer formulations of the GAA problem using GASP, both single-objective and many-objective, and compare the results to the RSM results for the same objectives.

License
-------

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US).
