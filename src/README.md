# General Aviation Aircraft Model Comparison

Compare two versions of the model underlying the general aviation aircraft product family design problem (GAA problem).

## What We Expect to See

We're expecting that optimizing an expanded version of the problem (using the General Aviation Synthesis Program, GASP) that includes integer variables will give us access to new and better solutions.
    The point being that this points out the tradeoff inherent to metamodeling --- you're always sacrificing accuracy for ease of optimization and analysis.
    That point, though, is totally straightforward.
    [@venkataraman_and_haftka_2004_complexity] even give examples of exactly this, and their paper was published a decade ago.

We need to make a more complicated point.
    Changing models, from a less complex to a more complex model, opens up new possibilities for making hypotheses about the problem.
    That is, you can do different kinds of *learning* with a more complex model.

## Computational Experiment

There are several things I'm keen to try, but I haven't decided which ones are worth doing yet:

* Optimize GASP, using the exact same problem formulation as in [@woodruff_2013_mova].
    Note that I've already done this, but with the old Java Borg, a year and a half ago.
* Optimize both models, but play with epsilons.
    This is important because $\varepsilon_\textrm{DOC}$ in particular was set way too large while $\varepsilon_\textrm{ROUGH}$ was set way too small.
    This will need a graphical comparison of reference sets --- I can pick up the one from the MOEA comparison paper.
* Add integer variables.
    This works only with GASP, but it gets at the heart of the study, the new possibilities that come in reach when you use a more sophisticated model.
    - Need a version of PFPF that is comparable with the old.
        Simply extending the old version would work, although it's intended for parametric commonality rather than integer decisions.
    - Alternative 1: Integer variables (**R**\[etractable not fixed\]**B**\[lades=\]**3**\[not 2\]**L**\[ow rather than high wing\]) are platform decisions, i.e., there are only three of them.
        This obviates the need for changes to PFPF.
        In this case there are $2\times 2 \times 2 = 8$ platform possibilities.
        The current state of the metamodel is actually that it is three metamodels, one for each aircraft.
        To support the additional options in the metamodel, we would require seven ($2^3-1$) more metamodels *for each aircraft*, for 21 more metamodels in total.
        That's *if* we actually wanted to compare the metamodel in this situation, which we probably don't.
    - Alternative 2: Integer variables are individual aircraft decisions.
        In this case, we have $3\times 3=9$ integer variables.
        That means we have $2^9=512$ different, interacting decisions about the platform, before you even get to optimizing the parametric variables.
        It's definitely worth comparing the two cases.
        Does the combinatorial explosion end up hurting optimization?
* Possibly Sobol' on models?
    This was part of the DETC paper that started to map out this territory.
    I could look at sensitivity for each of the 8 platform options, for each of the three aircraft.

## Feasibility, Infeasibility, and Broken Models

GASP can't be relied on to produce well-formed results, to run without crashing, or even to crash on bad inputs.
    I need to build in a way to handle model breakage.
    I'm not sure how to do that, either, but perhaps for the time being just assign a very large constraint violation to a solution with missing / all $\infty$ objective values.
    What about only one aircraft versus all three being broken?  $\infty$ versus $3\infty$?

    
## Bibliography

<!--
vim:ts=4:sw=4:expandtab:wrap lbr
-->
