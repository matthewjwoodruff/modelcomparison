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
| 27 real + 9 integer           | Integer variables may converge to a       |
|                               | platform or sub-platforms, but they       |
|                               | don't have to.                            |
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
| 9 minmax + PFPF + IC          | Where IC is an appropriate integer        |
|                               | commonality measure.  Important for       |
|                               | the 27 + 9 mixed integer formulations.    |
+-------------------------------+-------------------------------------------+
| GP + PFPF + IC                | ditto                                     |
+-------------------------------+-------------------------------------------+
| F1 + F2 + PFPF + IC           | ditto                                     |
+-------------------------------+-------------------------------------------+
| objectives + (PFPF + IC)      | The three formulations above with the     |
|                               | commonality measures aggregated together. |
+-------------------------------+-------------------------------------------+
| Utility functions             | GP, F1, F2 on their own plus samples from | 
|                               | the F1-F2 weighting space.  Plus samples  |
|                               | from the weighting space of each of the   |
|                               | above with PFPF.                          |
+-------------------------------+-------------------------------------------+

# Notes

*   I know epsilons are a problem that goes unacknowledged in this table.
    $\varepsilon_\textrm{DOC}$ in particular was set way too large while $\varepsilon_\textrm{ROUGH}$ was set way too small in all of my previous studies.
*   This will need a graphical comparison of reference sets --- I can pick up the parallel coords from the forthcoming MOEA comparison paper.
*   [@woodruff_2013_DETC] covered some of this ground before, but in much less detail

<!--
vim:ts=4:sw=4:expandtab:wrap lbr
-->
