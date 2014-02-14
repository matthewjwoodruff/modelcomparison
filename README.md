General Aviation Aircraft Model Comparison
==========================================

Compare two versions of the model underlying the general aviation aircraft product family design problem (GAA problem).

What We Expect to See
---------------------

We're expecting that optimizing an expanded version of the problem (using the General Aviation Synthesis Program, GASP) that includes integer variables will give us access to new and better solutions. The point being that this points out the tradeoff inherent to metamodeling --- you're always sacrificing accuracy for ease of optimization and analysis. That point, though, is totally straightforward. (Venkataraman and Haftka 2004) even give examples of exactly this, and their paper was published a decade ago.

We need to make a more complicated point. Changing models, from a less complex to a more complex model, opens up new possibilities for making hypotheses about the problem. That is, you can do different kinds of *learning* with a more complex model.

Computational Experiment
------------------------

There are several things I'm keen to try, but I haven't decided which ones are worth doing yet:

-   Optimize GASP, using the exact same problem formulation as in (Woodruff, Reed, and Simpson 2013). Note that I've already done this, but with the old Java Borg, a year and a half ago.
-   Optimize both models, but play with epsilons. This is important because *ɛ*<sub>`DOC`</sub> in particular was set way too large while *ɛ*<sub>`ROUGH`</sub> was set way too small. This will need a graphical comparison of reference sets --- I can pick up the one from the MOEA comparison paper.
-   Add integer variables. This works only with GASP, but it gets at the heart of the study, the new possibilities that come in reach when you use a more sophisticated model.
    -   Need a version of PFPF that is comparable with the old. Simply extending the old version would work, although it's intended for parametric commonality rather than integer decisions.
    -   Alternative 1: Integer variables (**R**[etractable not fixed]**B**[lades=]**3**[not 2]**L**[ow rather than high wing]) are platform decisions, i.e., there are only three of them. This obviates the need for changes to PFPF. In this case there are 2 × 2 × 2 = 8 platform possibilities. The current state of the metamodel is actually that it is three metamodels, one for each aircraft. To support the additional options in the metamodel, we would require seven (2<sup>3</sup> − 1) more metamodels *for each aircraft*, for 21 more metamodels in total. That's *if* we actually wanted to compare the metamodel in this situation, which we probably don't.
    -   Alternative 2: Integer variables are individual aircraft decisions. In this case, we have 3 × 3 = 9 integer variables. That means we have 2<sup>9</sup> = 512 different, interacting decisions about the platform, before you even get to optimizing the parametric variables. It's definitely worth comparing the two cases. Does the combinatorial explosion end up hurting optimization?

Bibliography
------------

Venkataraman, Satchi, and Raphael T. Haftka. 2004. “Structural Optimization Complexity: What Has Moore’s Law Done for Us?” *Structural and Multidisciplinary Optimization* 28: 275–287.

Woodruff, Matthew, Patrick Reed, and Timothy Simpson. 2013. “Many Objective Visual Analytics: Rethinking the Design of Complex Engineered Systems.” *Structural and Multidisciplinary Optimization* 43 (1) (July): 201–219.
