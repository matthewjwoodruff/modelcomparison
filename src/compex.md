# Computational Experiment


+-------------------------------+-----------------------+-----------------------------------+
| Decision Variables            | Objectives            | Learn from Reference Sets         |
+===============================+=======================+===================================+
| 27 real                       | 9 minmax and PFPF     | Baseline for comparing models.    |
|                               |                       | They're close, some infeasible.   |
+-------------------------------+-----------------------+-----------------------------------+
| 27 real                       | GP and PFPF           | ? Haven't done yet, expecting     |
|                               |                       | much more divergence.             |
+-------------------------------+-----------------------+-----------------------------------+
| 27 real                       | F1, F2, F3 (PFPF)     | ? Haven't done yet, expecting     |
|                               |                       | something in between GP and       |
|                               |                       | basic minmax behavior             |
+-------------------------------+-----------------------+-----------------------------------+
| 27 real + 9 int               | 9 minmax and PFPF     | What price do we pay for integer  |
|                               |                       | variables?  Can we do as well as  |
|                               |                       | the more restrictive formulation? |
|                               |                       | Do we make big gains anywhere?    |
|                               |                       | This is a new formulation and we  |
|                               |                       | don't know what we don't know, so |
|                               |                       | expect the results to raise new   |
|                               |                       | questions / suggest new           |
|                               |                       | formulations.                     |
+-------------------------------+-----------------------+-----------------------------------+
| 27 real + 9 int               | GP and PFPF           | Does it get harder to optimize in |
|                               |                       | this situation?  How does the     |
|                               |                       | mixed/aggregate formulation       |
|                               |                       | compare to the mixed/large        |
|                               |                       | formulation and to the real/      |
|                               |                       | aggregate formulation?            |
+-------------------------------+-----------------------+-----------------------------------+
| 27 real + 9 int               | F1, F2, F3 (PFPF)     | Another perspective on            |
|                               |                       | aggregation.                      |
+-------------------------------+-----------------------+-----------------------------------+
| ??? 27 real * $2^9$           | 9 minmax and PFPF     | This is kind of crazy --- 256     |
|                               |                       | separate real formulations, brute |
|                               |                       | forcing the integer part of the   |
|                               |                       | problem.  Easy to automate, but   |
|                               |                       | worth it?  We'd get to compare    |
|                               |                       | the integer formulation to its    |
|                               |                       | potential, but this would really  |
|                               |                       | be a question about Borg's        |
|                               |                       | ability to optimize mixed         |
|                               |                       | integer problems than it would    |
|                               |                       | be about the problem formulations |
|                               |                       | per se.                           |
+-------------------------------+-----------------------+-----------------------------------+
| 27 real + 3 int               | 9 minmax and PFPF     | This time we treat the three      |
|                               |                       | integer variables as a platform   |
|                               |                       | decision.  We can contrast with   |
|                               |                       | the 9 integer formulation.        |
|                               |                       | Is this easier?  Better           |
|                               |                       | solutions? Faster convergence?    |
|                               |                       | How about PFPF?                   |
+-------------------------------+-----------------------+-----------------------------------+
| 27 real + 9 int               | 9 minmax, PFPF,       | This breaks apart PFPF from       |
|                               | and a platform        | the commonality of the platform   |
|                               | commonality           | decisions.  Implicitly this       |
|                               | objective             | increases the importance of       |
|                               |                       | platform decisions.  Downside is  |
|                               |                       | that we now have two competing    |
|                               |                       | interpretations of PFPF, whether  |
|                               |                       | it's just parametric commonality  |
|                               |                       | or the whole deal.  Another       |
|                               |                       | drawback is that we're now at     |
|                               |                       | eleven objectives, which is       |
|                               |                       | dangerously close to being        |
|                               |                       | impossible to optimize.           |
+-------------------------------+-----------------------+-----------------------------------+
| 27 real                       | Single-objective      | Consequences of myopic            |
|                               | formulations.         | objective formulations.           |
|                               | GP, F1, F2,           |                                   |
|                               | a few weightings      |                                   |
|                               | from GP+PFPF,         |                                   |
|                               | F1+F2, F1+F2+PFPF     |                                   |
+-------------------------------+-----------------------+-----------------------------------+
| 27 real + 9 int               | Single-objective      | Consequences of myopic            |
|                               | formulations.         | objective formulations.           |
|                               | GP, F1, F2,           |                                   |
|                               | a few weightings      |                                   |
|                               | from GP+PFPF,         |                                   |
+-------------------------------+-----------------------+-----------------------------------+
| 27 real + 3 int               | Single-objective      | Consequences of myopic            |
|                               | formulations.         | objective formulations.           |
|                               | GP, F1, F2,           |                                   |
|                               | a few weightings      |                                   |
|                               | from GP+PFPF,         |                                   |
|                               | F1+F2, F1+F2+PFPF     |                                   |
+-------------------------------+-----------------------+-----------------------------------+

+-------------------------------+-----------------------+-------------------------------------------------------------------+
| Decision Variables            | Objectives            | Learn from Global Sensitivity Analysis                            |
+===============================+=======================+===================================================================+
| 27 real                       | 9 minmax and PFPF     | Here is where we start seeing aggregation yield weird results.    |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| 27 real                       | GP and PFPF           | Expecting another data point showing greater divergence between   |
|                               |                       | models with more aggregation.                                     |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| 27 real                       | F1, F2, F3 (PFPF)     | Again expecting greater divergence with more aggregation.         |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| 27 real + 9 int               | 9 minmax and PFPF     | No longer have the RSM as a baseline.                             |
|                               |                       | Do integer variables interact with real variables?                |
|                               |                       | Do integer variables interact with each other?                    |
|                               |                       | Does the presence of these integer variables change the           |
|                               |                       | dependency structure of the real variables?                       |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| 27 real + 9 int               | GP and PFPF           | How do integer variables affect highly aggregated                 |
|                               |                       | objectives?  More interactions?                                   |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| 27 real + 9 int               | F1, F2, F3 (PFPF)     | Another perspective on aggregation.                               |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| ??? 27 real * $2^9$           | 9 minmax and PFPF     | I'm not sure we'd even do sobol' on these.                        |
|                               |                       | What would we stand to gain?                                      |
|                               |                       | We could show different dependency structures based on            |
|                               |                       | the different integer decisions, which might be interesting.      |
|                               |                       | On the other hand, we could pick a few select integer decisions   |
|                               |                       | from the mixed integer results, just to illustrate the change     |
|                               |                       | in dependency structure.  That's probably more realistic than     |
|                               |                       | doing 256 Sobol' studies and then not even really looking at      |
|                               |                       | the results.                                                      |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| 27 real + 3 int               | 9 minmax and PFPF     | Do the integer variables affect real variable sensitivities       |
|                               |                       | the same when they're platform variables as when they're          |
|                               |                       | separate?                                                         |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| 27 real + 9 int               | 9 minmax, PFPF,       | Sobol' won't have anything new to tell us compared to the         |
|                               | and a platform        | other formulation, since there's no mystery about the             |
|                               | commonality           | dependency structure for PFPF and this other commonality          |
|                               | objective             | measure.                                                          |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| 27 real                       | Single-objective      | This one admits a comparison between GASP and RSM                 |
|                               | formulations.         | sensitivities.                                                    |
|                               | GP, F1, F2,           |                                                                   |
|                               | a few weightings      |                                                                   |
|                               | from GP+PFPF,         |                                                                   |
|                               | F1+F2, F1+F2+PFPF     |                                                                   |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| 27 real + 9 int               | Single-objective      | We get these for free if we run Sobol' sequences for              |
|                               | formulations.         | this DV formulation.                                              |
|                               | GP, F1, F2,           |                                                                   |
|                               | a few weightings      |                                                                   |
|                               | from GP+PFPF,         |                                                                   |
+-------------------------------+-----------------------+-------------------------------------------------------------------+
| 27 real + 3 int               | Single-objective      | We get these for free if we run Sobol' sequences for              |
|                               | formulations.         | this DV formulation.                                              |
|                               | GP, F1, F2,           |                                                                   |
|                               | a few weightings      |                                                                   |
|                               | from GP+PFPF,         |                                                                   |
|                               | F1+F2, F1+F2+PFPF     |                                                                   |
+-------------------------------+-----------------------+-------------------------------------------------------------------+

+-------------------------------+-----------------------+--------------------------------------------------------------------+
| Decision Variables            | Objectives            | Learn from Search Dynamics                                         |
+===============================+=======================+====================================================================+
| 27 real                       | 9 minmax and PFPF     | Same search operators?                                             |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| 27 real                       | GP and PFPF           | Same search operators?                                             |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| 27 real                       | F1, F2, F3 (PFPF)     | Same search operators?                                             |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| 27 real + 9 int               | 9 minmax and PFPF     | Do different search operators work better when you have            |
|                               |                       | a mixed-integer problem?                                           |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| 27 real + 9 int               | GP and PFPF           | We can learn about changes to search operator dynamics             |
|                               |                       | resulting both from the presence of integer variables              |
|                               |                       | and highly aggregated objectives, and how those factors            |
|                               |                       | interact.                                                          |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| 27 real + 9 int               | F1, F2, F3 (PFPF)     | Another perspective on aggregation.                                |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| ??? 27 real * $2^9$           | 9 minmax and PFPF     | I don't think examining search operator dynamics across            |
|                               |                       | 256 formulations would be valuable in the least.                   |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| 27 real + 3 int               | 9 minmax and PFPF     | Does having fewer / more influential integer variables             |
|                               |                       | change the choice of search operators?                             |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| 27 real + 9 int               | 9 minmax, PFPF,       | Does the search struggle with this many objectives?                |
|                               | and a platform        |                                                                    |
|                               | commonality           |                                                                    |
|                               | objective             |                                                                    |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| 27 real                       | Single-objective      | Not hard to collect, not sure if they have anything                |
|                               | formulations.         | important to say.                                                  |
|                               | GP, F1, F2,           |                                                                    |
|                               | a few weightings      |                                                                    |
|                               | from GP+PFPF,         |                                                                    |
|                               | F1+F2, F1+F2+PFPF     |                                                                    |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| 27 real + 9 int               | Single-objective      | Ditto                                                              |
|                               | formulations.         |                                                                    |
|                               | GP, F1, F2,           |                                                                    |
|                               | a few weightings      |                                                                    |
|                               | from GP+PFPF,         |                                                                    |
+-------------------------------+-----------------------+--------------------------------------------------------------------+
| 27 real + 3 int               | Single-objective      | Ditto                                                              |
|                               | formulations.         |                                                                    |
|                               | GP, F1, F2,           |                                                                    |
|                               | a few weightings      |                                                                    |
|                               | from GP+PFPF,         |                                                                    |
|                               | F1+F2, F1+F2+PFPF     |                                                                    |
+-------------------------------+-----------------------+--------------------------------------------------------------------+



I'm not sure I'm going to do everything in this massive table.
    And I'm sure I'll do things that aren't in the table.
    Some of the experiments don't do much to support arguments in favor of reformulation or to show what new opportunities we have with a more complex model.
    I did the top row last year with the Java versions of everything.
    That will be a good double-check for this study, because this one's going to use CBorg.

# Notes

*   I know epsilons are a problem that goes unacknowledged in this table.
    That's because I'm not really ready to bring in the preliminary results that show just how crucial the epsilon resolution is.
    $\varepsilon_\textrm{DOC}$ in particular was set way too large while $\varepsilon_\textrm{ROUGH}$ was set way too small in all of my previous studies.
*   This will need a graphical comparison of reference sets --- I can pick up the one from the MOEA comparison paper.
*   PFPF is an issue.  It won't be the same PFPF anymore if it includes integer variables for the 9-int formulations.
*   [@woodruff_2013_DETC] covered some of this ground before, but in much less detail

<!--
vim:ts=4:sw=4:expandtab:wrap lbr
-->
