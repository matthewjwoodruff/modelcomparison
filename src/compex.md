# Computational Experiment

## Models

* Polynomial response surface model
* GASP

## Decision Variable Formulations

+-------------------------------+-------------------------------------------+
| Formulation                   | Explanation                               |
+===============================+===========================================+
| 27 real                       | Baseline formulation                      |
+-------------------------------+-------------------------------------------+
| 27 real + 3 integer           | Integer variables are for specifying a    |
|                               | platform.  RB3L is one of the eight       |
|                               | possible platforms.                       |
+-------------------------------+-------------------------------------------+

## Objective Function Formulations

+-------------------------------+-------------------------------------------+
| Formulation                   | Explanation                               |
+===============================+===========================================+
| 9 minmax + PFPF               | Baseline many-objective formulation       |
+-------------------------------+-------------------------------------------+
| GP + PFPF                     | Baseline highly-aggregated formulation    |
+-------------------------------+-------------------------------------------+
| F1 + F2 + PFPF                | Baseline partly-aggregated formulation    |
+-------------------------------+-------------------------------------------+
| Utility functions             | GP, F1, F2 on their own plus samples from | 
|                               | the F1-F2 weighting space.  Plus samples  |
|                               | from the weighting space of each of the   |
|                               | above with PFPF.                          |
+-------------------------------+-------------------------------------------+

## Analysis

*   Optimize (x50 seeds) all combinations of DV and objective formulations.
    -   For the real DVs, use both models. 
    -   For RSM solutions, reevaluate with GASP.
    -   For all optimization runs, collect search operator dynamics.
        We may get the chance to make the secondary point that search operator dynamics are a good proxy for sensitivity analysis.
*   Something other than Borg for single-objective optimization?
    CMAES?
    Borg with recency turned on?
    Fake single-objective optimization with artificially tiny epsilons and after-the-fact sampling from the weighting spaces?
*   From all solutions, compute reference sets for each set of objectives.
    Make parallel coordinate plots and compare, both in decision space and objective space.
*   Perform Sobol' global sensitivity analysis for all of the objective functions plus the constraint violation function.
    -   Quasi-random sampling of 27 variables for RSM
    -   Quasi-random sampling of 27 variables for GASP
    -   Quasi-random sampling of 27 + 3 variables for GASP
    -   Can compute all objectives' sensitivities from there
    -   Will need spider plots plus more compact visualization.
        (To be developed?)

## Notes

*   This is a much bigger study than it would appear from a casual inspection of the tables above, since it's really the cartesian product of model choice, DV formulation, objective formulation, and analysis.
*   I know epsilons are a problem that goes unacknowledged.
    $\varepsilon_\textrm{DOC}$ in particular was set too large while $\varepsilon_\textrm{ROUGH}$ was set too small in my previous studies.
    One of the learnings I'm going to have to talk about is the epsilons, and I'm not sure how to avoid having the whole study get derailed.
*   This will need a graphical comparison of reference sets --- I can pick up the parallel coords from the forthcoming MOEA comparison paper.
*   [@woodruff_2013_DETC] covered some of this ground before, but in much less detail

<!--
vim:ts=4:sw=4:expandtab:wrap lbr
-->
