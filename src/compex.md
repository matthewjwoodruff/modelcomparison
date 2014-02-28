# Computational Experiment

This study is taking aim at the idea that you can use a utility function and get good results.
    There's this idea that for expensive models you have to use a utility function.
    My hypothesis is that expensive models practically demand more sophisticated problem formulations.
    The reason is that, the more sophisticated the model, the greater the distortions introduced by a utility function.
    Does that make any sense?
    Now that I see it in black and white, I think that's a bit wrong.
    But suppose that's the hypothesis.
    How would we test it?
    Well, it would suffice to show that a single objective formulation leads you farther astray with GASP than with the RSM.
    What would that mean exactly?
    That the solutions you get from those formulations blatantly ignore opportunities for good performance, but that they somehow do it more for GASP.
    This is starting to sound far too much like the MOVA argument.
    And also not particularly likely.
    Let's try again.

I think we need to distinguish between decision variable formulation and objective formulation.
    There's also constraints, but they're on the output side.
    Let's call it, "input formulation", and "output formulation".
    OK, so more sophisticated models open up a lot more input formulations, but the output formulations are somewhat less model dependent?
    Well, not really.
    Blanket statement, and not even true for the GAA problem.
    Maybe we don't need to focus on this distinction.

So what do we gain from using a more complex model?
    We can make more sophisticated problem formulations.
    But if you're stuck in single-objective land, you have to aggregate the outputs of you model to a high degree, and you lose the benefit of upgrading to a more accurate model.
    Ah ha!
    Let's chase this idea.

Single-objective optimization aggregates the outputs of the model into one function.
    So you're spending a lot of computer time and money on a more accurate model, but then when you optimize it you're taking all of that complexity and cramming it into a single number that has arbitrary units.
    That sounds like madness.
    How do we demonstrate this is a problem using GASP?
    (The link to the RSM being simply that upgrading to a more sophisticated model allows us to have this insight.)

Again, I don't think that there's anything different from the original MOVA paper in this argument.
    In fact, I think this whole line of thinking is a dead end for this paper --- It's just chasing the same argument I already presented in [@woodruff_2013_mova].

So that brings us to a different point.
    This paper has to be about something else.
    The abstract talks about the opportunities you gain.
    That's actually a really straightforward point to make.
    Optimize a more sophisticated model and take advantage of its integer variables, then get better solutions, at least in some respects.
    But we can also use this opportunity to reiterate the MOVA argument about myopia and hysteresis.

Incidentally it might be awesome if we found that at least some of the single objective formulations were harder to optimize.
    Show that the single objective problem formulations *create difficult interdependencies* that make the problems harder to optimize.
    That's nice, but the data might not support it.

Actually, we can use this study the other way round.
    Not that we're trying to justify MOVA any more, instead look at how well swapping out the model serves MOVA.
    Gives us more perspective on problem formulations and helps break out of cog hysteresis wrt our choice of formulations.

So this study comes down to two things:

1. Using a more sophisticated model lets us find new parts of the Pareto frontier, i.e. new design alternatives.
1. Using a more sophisticated model serves MOVA because it gives us a new perspective on the problem formulation.

This leads to the question of what my research question is.

 *Can using a higher-accuracy model improve how we use a low-accuracy model?*
:   This is a bit vague.

 *Does using a higher-accuracy model give us access to new problem formulations?*
:   This is gobsmackingly obvious and not worth writing a paper about.

 *Does using single-objective problem formulations for expensive models have any drawbacks?*
:   Vague, and I don't see what it would add to [@woodruff_2013_mova].

 *Using a more accurate model gives us *more* opportunities for expressive problem formulation, and we should take advantage of them rather than cramming everything into a single objective.*
:   Not a question, but I think it's a concise statement of my theme.  Although there's perhaps a small contradiction between the fact that we're expanding decision variables but talking about objectives.
    Maybe the point is that even with the *same objectives*, myopia bites you.
    Perhaps I'm looking for a point about the *computational expense of myopia*?

 *What opportunities for problem formulation arise when we use a more accurate model?*
:   This doesn't really get us there.

 *What can we learn about a problem using the new formulation options that become available when a more accurate model is used?*
:   OK, that's basically what this study is looking at.
    And it gets at the theme, because with single-objective formulations you won't learn anything much by swapping in a new model, you'll just get a different point in the design space.
    Now, can we connect this with the computational expense of myopia?
    It could be phrased more diplomatically, in terms of a tradeoff between information content and computational cost.
    Let's get specific, then.
    Do we want to have a Borg vs. EGO shootout?
    Both start by sampling the decision space, EGO with LHS and Borg with uniform random for serial or LHS for parallel.

Research question
:   *What is the nature of the tradeoff between information, solution quality, and computational expense?*
    But the problem with making this an EGO-Borg shootout is that it's *so* dependent on the problem.
    Also, we lose sight of the point about the design insights gained within MOVA.

Is EGO compatible with MOVA?
    This is an interesting question.
    I'm starting to feel a bit trolled by EGO, though.
    It's a powerful idea with a big following, but maybe it's not worth taking aim at in this paper.
    At least not so explicitly.

So maybe this is a question to lay before the bosses.
    *We could take a swipe at EGO with this study.  Is it worth doing?  We won't be able to focus on design insights for the GAA problem if we do.*

What about initializing algorithm runs with a reference set?

On the other hand, comparing with EGO means *implementing* EGO, and that's a big pile of work I don't want to do.



This is our research question.
    *What can we learn about a problem using the new formulation options that become available when a more accurate model is used?*

This is our hypothesis.
    *Single-objective problem formulations are less able to exploit the new design opportunities afforded by using a more accurate model.*
    I.e., we don't expect to see them produce much better results than with the metamodel.




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
