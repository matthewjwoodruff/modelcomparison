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
<td align="left"><p>Baseline formulation</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 3 integer</p></td>
<td align="left"><p>Integer variables are for specifying a platform. RB3L is one of the eight possible platforms.</p></td>
</tr>
</tbody>
</table>

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

Woodruff, Matthew, Timothy Simpson, and Patrick Reed. 2013. “Diagnostic Analysis of Metamodels’ Multivariate Dependencies and Their Impacts in Many-Objective Design Optimization.” In *Proceedings of the ASME 2013 IDETC/CIE Conference*. ASME.

License
-------

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US).
