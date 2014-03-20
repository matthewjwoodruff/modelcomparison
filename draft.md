Abstract
========

Steady increases in computer power have made it possible to use more computationally expensive models in conceptual design optimization studies. These more complex models present new opportunities for problem formulations that exploit features not present in lower-fidelity models. In the past, many studies have explored the benchmark general aviation aircraft product family design problem using a simple polynomial regression model based on the behavior of the more computationally expensive General Aviation Synthesis Program (GASP). This study, in contrast, explores the problem formulation opportunities presented by the GASP model itself. These include not only single- and multi-objective optimization results from the same problem formulations used with the regression model, but also an exploration of several mixed-integer problem formulations that become available when the full GASP model is used. In addition to multi-objective optimization, these mixed-integer problem formulations are subjected to global sensitivity analysis to characterize their interaction with the GASP model. The results of this study emphasize the importance of exploring multiple competing hypotheses about a design optimization problem, highlighting the sensitivity of design optimality to problem formulation.

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

There are a lot of surrogate modeling approaches out there with the same basic structure: do an initial sample, make a metamodel, optimize that to choose a new place to sample, update the metamodel, repeat until out of computer time. (Forrester and Keane 2009) calls this the two-phase approach. (This citation is a review paper by one of the few people who seem to be doing very good work on surrogate based optimization.) Most of these assume a single objective, although (Forrester and Keane 2009) are ahead of the game and discuss multiobjective optimization too.

Computational Experiment
========================

Models
------

-   Polynomial response surface model
-   GASP

Decision Variable Formulations
------------------------------

<table>
<col width="42%" />
<col width="56%" />
<thead>
<tr class="header">
<th align="left">Formulation</th>
<th align="left">Explanation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>27 real</p></td>
<td align="left"><p>Baseline formulation, RB3L (retractable gear, three blades, low wing)</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 3 integer</p></td>
<td align="left"><p>Integer variables are for specifying a platform. RB3L is one of the eight possible platforms.</p></td>
</tr>
</tbody>
</table>

### Integer Variables

-   GEAR: fixed or retractable
-   BLADES: two or three
-   WING: high or low

Objective Function Formulations
-------------------------------

<table>
<col width="42%" />
<col width="56%" />
<thead>
<tr class="header">
<th align="left">Formulation</th>
<th align="left">Explanation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>9 minmax + PFPF</p></td>
<td align="left"><p>Baseline many-objective formulation</p></td>
</tr>
<tr class="even">
<td align="left"><p>GP + PFPF</p></td>
<td align="left"><p>Baseline highly-aggregated formulation</p></td>
</tr>
<tr class="odd">
<td align="left"><p>F1 + F2 + PFPF</p></td>
<td align="left"><p>Baseline partly-aggregated formulation</p></td>
</tr>
<tr class="even">
<td align="left"><p>Utility functions</p></td>
<td align="left"><p>GP, F1, F2 on their own plus samples from the F1-F2 weighting space. Plus samples from the weighting space of each of the above with PFPF.</p></td>
</tr>
</tbody>
</table>

Analysis
--------

-   Optimize (x50 seeds) all combinations of DV and objective formulations.
    -   For the real DVs, use both models.
    -   For RSM solutions, reevaluate with GASP.
    -   For all optimization runs, collect search operator dynamics. We may get the chance to make the secondary point that search operator dynamics are a good proxy for sensitivity analysis.
-   Something other than Borg for single-objective optimization? CMAES? Borg with recency turned on? Fake single-objective optimization with artificially tiny epsilons and after-the-fact sampling from the weighting spaces?
-   From all solutions, compute reference sets for each set of objectives. Make parallel coordinate plots and compare, both in decision space and objective space.
-   Perform Sobol' global sensitivity analysis for all of the objective functions plus the constraint violation function.
    -   Quasi-random sampling of 27 variables for RSM
    -   Quasi-random sampling of 27 variables for GASP
    -   Quasi-random sampling of 27 + 3 variables for GASP
    -   Can compute all objectives' sensitivities from there
    -   Will need spider plots plus more compact visualization. (To be developed?)

Notes
-----

-   This is a much bigger study than it would appear from a casual inspection of the tables above, since it's really the cartesian product of model choice, DV formulation, objective formulation, and analysis.
-   I know epsilons are a problem that goes unacknowledged. *ɛ*<sub>DOC</sub> in particular was set too large while *ɛ*<sub>ROUGH</sub> was set too small in my previous studies. One of the learnings I'm going to have to talk about is the epsilons, and I'm not sure how to avoid having the whole study get derailed.
-   This will need a graphical comparison of reference sets --- I can pick up the parallel coords from the forthcoming MOEA comparison paper.
-   (Woodruff, Simpson, and Reed 2013) covered some of this ground before, but in much less detail

Bibliography
============

Forrester, Alexander IJ, and Andy J Keane. 2009. “Recent Advances in Surrogate-Based Optimization.” *Progress in Aerospace Sciences* 45 (1): 50–79.

Woodruff, Matthew, Timothy Simpson, and Patrick Reed. 2013. “Diagnostic Analysis of Metamodels’ Multivariate Dependencies and Their Impacts in Many-Objective Design Optimization.” In *Proceedings of the ASME 2013 IDETC/CIE Conference*. ASME.

License
-------

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US).
