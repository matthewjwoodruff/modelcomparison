# Computational Experiment

+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| Decision Variables            | Objectives            | Learn from Reference Sets         | Learn from Global Sensitivity Analysis                            | Learn from Search Dynamics                                         |
+===============================+=======================+===================================+===================================================================+====================================================================+
| 27 real                       | 9 minmax and PFPF     | Baseline for comparing models.    | Here is where we start seeing aggregation yield weird results.    | Same search operators?                                             |
|                               |                       | They're close, some infeasible.   |                                                                   |                                                                    |
|                               |                       | <br/>                             |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| 27 real                       | GP and PFPF           | ? Haven't done yet, expecting     | Expecting another data point showing greater divergence between   | Same search operators?                                             |
|                               |                       | much more divergence.             | models with more aggregation.                                     |                                                                    |
|                               |                       |                                   |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| 27 real                       | F1, F2, F3 (PFPF)     | ? Haven't done yet, expecting     | Again expecting greater divergence with more aggregation.         | Same search operators?                                             |
|                               |                       | something in between GP and       |                                                                   |                                                                    |
|                               |                       | basic minmax behavior             |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| 27 real + 9 int               | 9 minmax and PFPF     | What price do we pay for integer  | No longer have the RSM as a baseline.                             | Do different search operators work better when you have            |
|                               |                       | variables?  Can we do as well as  | Do integer variables interact with real variables?                | a mixed-integer problem?                                           |
|                               |                       | the more restrictive formulation? | Do integer variables interact with each other?                    |                                                                    |
|                               |                       | Do we make big gains anywhere?    | Does the presence of these integer variables change the           |                                                                    |
|                               |                       | This is a new formulation and we  | dependency structure of the real variables?                       |                                                                    |
|                               |                       | don't know what we don't know, so |                                                                   |                                                                    |
|                               |                       | expect the results to raise new   |                                                                   |                                                                    |
|                               |                       | questions / suggest new           |                                                                   |                                                                    |
|                               |                       | formulations.                     |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| 27 real + 9 int               | GP and PFPF           | Does it get harder to optimize in | How do integer variables affect highly aggregated                 | We can learn about changes to search operator dynamics             |
|                               |                       | this situation?  How does the     | objectives?  More interactions?                                   | resulting both from the presence of integer variables              |
|                               |                       | mixed/aggregate formulation       |                                                                   | and highly aggregated objectives, and how those factors            |
|                               |                       | compare to the mixed/large        |                                                                   | interact.                                                          |
|                               |                       | formulation and to the real/      |                                                                   |                                                                    |
|                               |                       | aggregate formulation?            |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| 27 real + 9 int               | F1, F2, F3 (PFPF)     | Another perspective on            | Another perspective on aggregation.                               | Another perspective on aggregation.                                |
|                               |                       | aggregation.                      |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| ??? 27 real * $2^9$           | 9 minmax and PFPF     | This is kind of crazy --- 256     | I'm not sure we'd even do sobol' on these.                        | I don't think examining search operator dynamics across            |
|                               |                       | separate real formulations, brute | What would we stand to gain?                                      | 256 formulations would be valuable in the least.                   |
|                               |                       | forcing the integer part of the   | We could show different dependency structures based on            |                                                                    |
|                               |                       | problem.  Easy to automate, but   | the different integer decisions, which might be interesting.      |                                                                    |
|                               |                       | worth it?  We'd get to compare    | On the other hand, we could pick a few select integer decisions   |                                                                    |
|                               |                       | the integer formulation to its    | from the mixed integer results, just to illustrate the change     |                                                                    |
|                               |                       | potential, but this would really  | in dependency structure.  That's probably more realistic than     |                                                                    |
|                               |                       | be a question about Borg's        | doing 256 Sobol' studies and then not even really looking at      |                                                                    |
|                               |                       | ability to optimize mixed         | the results.                                                      |                                                                    |
|                               |                       | integer problems than it would    |                                                                   |                                                                    |
|                               |                       | be about the problem formulations |                                                                   |                                                                    |
|                               |                       | per se.                           |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| 27 real + 3 int               | 9 minmax and PFPF     | This time we treat the three      | Do the integer variables affect real variable sensitivities       | Does having fewer / more influential integer variables             |
|                               |                       | integer variables as a platform   | the same when they're platform variables as when they're          | change the choice of search operators?                             |
|                               |                       | decision.  We can contrast with   | separate?                                                         |                                                                    |
|                               |                       | the 9 integer formulation.        |                                                                   |                                                                    |
|                               |                       | Is this easier?  Better           |                                                                   |                                                                    |
|                               |                       | solutions? Faster convergence?    |                                                                   |                                                                    |
|                               |                       | How about PFPF?                   |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| 27 real + 9 int               | 9 minmax, PFPF,       | This breaks apart PFPF from       | Sobol' won't have anything new to tell us compared to the         | Does the search struggle with this many objectives?                |
|                               | and a platform        | the commonality of the platform   | other formulation, since there's no mystery about the             |                                                                    |
|                               | commonality           | decisions.  Implicitly this       | dependency structure for PFPF and this other commonality          |                                                                    |
|                               | objective             | increases the importance of       | measure.                                                          |                                                                    |
|                               |                       | platform decisions.  Downside is  |                                                                   |                                                                    |
|                               |                       | that we now have two competing    |                                                                   |                                                                    |
|                               |                       | interpretations of PFPF, whether  |                                                                   |                                                                    |
|                               |                       | it's just parametric commonality  |                                                                   |                                                                    |
|                               |                       | or the whole deal.  Another       |                                                                   |                                                                    |
|                               |                       | drawback is that we're now at     |                                                                   |                                                                    |
|                               |                       | eleven objectives, which is       |                                                                   |                                                                    |
|                               |                       | dangerously close to being        |                                                                   |                                                                    |
|                               |                       | impossible to optimize.           |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| 27 real                       | Single-objective      | Consequences of myopic            | This one admits a comparison between GASP and RSM                 | Not hard to collect, not sure if they have anything                |
|                               | formulations.         | objective formulations.           | sensitivities.                                                    | important to say.                                                  |
|                               | GP, F1, F2,           |                                   |                                                                   |                                                                    |
|                               | a few weightings      |                                   |                                                                   |                                                                    |
|                               | from GP+PFPF,         |                                   |                                                                   |                                                                    |
|                               | F1+F2, F1+F2+PFPF     |                                   |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| 27 real + 9 int               | Single-objective      | Consequences of myopic            | We get these for free if we run Sobol' sequences for              | Ditto                                                              |
|                               | formulations.         | objective formulations.           | this DV formulation.                                              |                                                                    |
|                               | GP, F1, F2,           |                                   |                                                                   |                                                                    |
|                               | a few weightings      |                                   |                                                                   |                                                                    |
|                               | from GP+PFPF,         |                                   |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+
| 27 real + 3 int               | Single-objective      | Consequences of myopic            | We get these for free if we run Sobol' sequences for              | Ditto                                                              |
|                               | formulations.         | objective formulations.           | this DV formulation.                                              |                                                                    |
|                               | GP, F1, F2,           |                                   |                                                                   |                                                                    |
|                               | a few weightings      |                                   |                                                                   |                                                                    |
|                               | from GP+PFPF,         |                                   |                                                                   |                                                                    |
|                               | F1+F2, F1+F2+PFPF     |                                   |                                                                   |                                                                    |
+-------------------------------+-----------------------+-----------------------------------+-------------------------------------------------------------------+--------------------------------------------------------------------+



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

<!--
vim:ts=4:sw=4:expandtab:wrap lbr
-->
