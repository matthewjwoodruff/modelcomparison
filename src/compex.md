# Computational Experiment

## Decision Variable Formulations

+-------------------------------+-------------------------------------------+
| Formulation                   | Explanation                               |
+===============================+===========================================+
| 27 real                       | Baseline formulation                      |
+-------------------------------+-------------------------------------------+
| 27 real + 3 integer           | Integer variables are for specifying a    |
|                               | platform.                                 |
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


## Notes

*   I know epsilons are a problem that goes unacknowledged in this table.
    $\varepsilon_\textrm{DOC}$ in particular was set way too large while $\varepsilon_\textrm{ROUGH}$ was set way too small in all of my previous studies.
*   This will need a graphical comparison of reference sets --- I can pick up the parallel coords from the forthcoming MOEA comparison paper.
*   [@woodruff_2013_DETC] covered some of this ground before, but in much less detail

<!--
vim:ts=4:sw=4:expandtab:wrap lbr
-->
