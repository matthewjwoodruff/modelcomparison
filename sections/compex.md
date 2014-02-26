Computational Experiment
------------------------

There are several things I'm keen to try, but I haven't decided which ones are worth doing yet:

-   Optimize GASP, using the exact same problem formulation as in (Woodruff, Reed, and Simpson 2013). Note that I've already done this, but with the old Java Borg, a year and a half ago.
-   Optimize both models, but play with epsilons. This is important because *ɛ*<sub>DOC</sub> in particular was set way too large while *ɛ*<sub>ROUGH</sub> was set way too small. This will need a graphical comparison of reference sets --- I can pick up the one from the MOEA comparison paper.
-   Add integer variables. This works only with GASP, but it gets at the heart of the study, the new possibilities that come in reach when you use a more sophisticated model.
    -   Need a version of PFPF that is comparable with the old. Simply extending the old version would work, although it's intended for parametric commonality rather than integer decisions.
    -   Alternative 1: Integer variables (**R**[etractable not fixed]**B**[lades=]**3**[not 2]**L**[ow rather than high wing]) are platform decisions, i.e., there are only three of them. This obviates the need for changes to PFPF. In this case there are 2 × 2 × 2 = 8 platform possibilities. The current state of the metamodel is actually that it is three metamodels, one for each aircraft. To support the additional options in the metamodel, we would require seven (2<sup>3</sup> − 1) more metamodels *for each aircraft*, for 21 more metamodels in total. That's *if* we actually wanted to compare the metamodel in this situation, which we probably don't.
    -   Alternative 2: Integer variables are individual aircraft decisions. In this case, we have 3 × 3 = 9 integer variables. That means we have 2<sup>9</sup> = 512 different, interacting decisions about the platform, before you even get to optimizing the parametric variables. It's definitely worth comparing the two cases. Does the combinatorial explosion end up hurting optimization?
-   Sobol' on models This was part of the DETC paper that started to map out this territory. I could look at sensitivity for each of the 8 platform options, for each of the three aircraft. Also, single-objective problem formulations. I want to take a bite out of approaches that use utility functions. It's a case that's a lot more compelling when I use a model that actually used to be prohibitively expensive. And it lets me revisit the original MOVA argument about cognitive myopia from the point of view of many competing formulations, instead of just one. We can take the original goal programming formulation, cost, performance, as well as a few cost-performance weightings and formulations that include PFPF, again at several weightings.

Bibliography
------------

Woodruff, Matthew, Patrick Reed, and Timothy Simpson. 2013. “Many Objective Visual Analytics: Rethinking the Design of Complex Engineered Systems.” *Structural and Multidisciplinary Optimization* 43 (1) (July): 201–219.

License
-------

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US).
