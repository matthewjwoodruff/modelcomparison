Computational Experiment
========================

This study is taking aim at the idea that you can use a utility function and get good results. There's this idea that for expensive models you have to use a utility function. My hypothesis is that expensive models practically demand more sophisticated problem formulations. The reason is that, the more sophisticated the model, the greater the distortions introduced by a utility function. Does that make any sense? Now that I see it in black and white, I think that's a bit wrong. But suppose that's the hypothesis. How would we test it? Well, it would suffice to show that a single objective formulation leads you farther astray with GASP than with the RSM. What would that mean exactly? That the solutions you get from those formulations blatantly ignore opportunities for good performance, but that they somehow do it more for GASP. This is starting to sound far too much like the MOVA argument. And also not particularly likely. Let's try again.

I think we need to distinguish between decision variable formulation and objective formulation. There's also constraints, but they're on the output side. Let's call it, "input formulation", and "output formulation". OK, so more sophisticated models open up a lot more input formulations, but the output formulations are somewhat less model dependent? Well, not really. Blanket statement, and not even true for the GAA problem. Maybe we don't need to focus on this distinction.

So what do we gain from using a more complex model? We can make more sophisticated problem formulations. But if you're stuck in single-objective land, you have to aggregate the outputs of you model to a high degree, and you lose the benefit of upgrading to a more accurate model. Ah ha! Let's chase this idea.

Single-objective optimization aggregates the outputs of the model into one function. So you're spending a lot of computer time and money on a more accurate model, but then when you optimize it you're taking all of that complexity and cramming it into a single number that has arbitrary units. That sounds like madness. How do we demonstrate this is a problem using GASP? (The link to the RSM being simply that upgrading to a more sophisticated model allows us to have this insight.)

Again, I don't think that there's anything different from the original MOVA paper in this argument. In fact, I think this whole line of thinking is a dead end for this paper --- It's just chasing the same argument I already presented in (Woodruff, Reed, and Simpson 2013).

So that brings us to a different point. This paper has to be about something else. The abstract talks about the opportunities you gain. That's actually a really straightforward point to make. Optimize a more sophisticated model and take advantage of its integer variables, then get better solutions, at least in some respects. But we can also use this opportunity to reiterate the MOVA argument about myopia and hysteresis.

Incidentally it might be awesome if we found that at least some of the single objective formulations were harder to optimize. Show that the single objective problem formulations *create difficult interdependencies* that make the problems harder to optimize. That's nice, but the data might not support it.

Actually, we can use this study the other way round. Not that we're trying to justify MOVA any more, instead look at how well swapping out the model serves MOVA. Gives us more perspective on problem formulations and helps break out of cog hysteresis wrt our choice of formulations.

So this study comes down to two things:

1.  Using a more sophisticated model lets us find new parts of the Pareto frontier, i.e. new design alternatives.
2.  Using a more sophisticated model serves MOVA because it gives us a new perspective on the problem formulation.

This leads to the question of what my research question is.

"Can using a higher-accuracy model improve how we use a low-accuracy model?" :This is a bit vague. "Does using a higher-accuracy model give us access to new problem formulations?" :This is gobsmackingly obvious and not worth writing a paper about. "Does using single-objective problem formulations for expensive models have any drawbacks?" :Vague, and I don't see what it would add to (Woodruff, Reed, and Simpson 2013).

<table>
<col width="34%" />
<col width="26%" />
<col width="39%" />
<thead>
<tr class="header">
<th align="left">Decision Variables</th>
<th align="left">Objectives</th>
<th align="left">Learn from Reference Sets</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>27 real</p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>Baseline for comparing models. They're close, some infeasible.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real</p></td>
<td align="left"><p>GP and PFPF</p></td>
<td align="left"><p>? Haven't done yet, expecting much more divergence.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real</p></td>
<td align="left"><p>F1, F2, F3 (PFPF)</p></td>
<td align="left"><p>? Haven't done yet, expecting something in between GP and basic minmax behavior</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>What price do we pay for integer variables? Can we do as well as the more restrictive formulation? Do we make big gains anywhere? This is a new formulation and we don't know what we don't know, so expect the results to raise new questions / suggest new formulations.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>GP and PFPF</p></td>
<td align="left"><p>Does it get harder to optimize in this situation? How does the mixed/aggregate formulation compare to the mixed/large formulation and to the real/ aggregate formulation?</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>F1, F2, F3 (PFPF)</p></td>
<td align="left"><p>Another perspective on aggregation.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>??? 27 real * 2<sup>9</sup></p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>This is kind of crazy --- 256 separate real formulations, brute forcing the integer part of the problem. Easy to automate, but worth it? We'd get to compare the integer formulation to its potential, but this would really be a question about Borg's ability to optimize mixed integer problems than it would be about the problem formulations per se.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 3 int</p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>This time we treat the three integer variables as a platform decision. We can contrast with the 9 integer formulation. Is this easier? Better solutions? Faster convergence? How about PFPF?</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>9 minmax, PFPF, and a platform commonality objective</p></td>
<td align="left"><p>This breaks apart PFPF from the commonality of the platform decisions. Implicitly this increases the importance of platform decisions. Downside is that we now have two competing interpretations of PFPF, whether it's just parametric commonality or the whole deal. Another drawback is that we're now at eleven objectives, which is dangerously close to being impossible to optimize.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real</p></td>
<td align="left"><p>Single-objective formulations. GP, F1, F2, a few weightings from GP+PFPF, F1+F2, F1+F2+PFPF</p></td>
<td align="left"><p>Consequences of myopic objective formulations.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>Single-objective formulations. GP, F1, F2, a few weightings from GP+PFPF,</p></td>
<td align="left"><p>Consequences of myopic objective formulations.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 3 int</p></td>
<td align="left"><p>Single-objective formulations. GP, F1, F2, a few weightings from GP+PFPF, F1+F2, F1+F2+PFPF</p></td>
<td align="left"><p>Consequences of myopic objective formulations.</p></td>
</tr>
</tbody>
</table>

<table>
<col width="25%" />
<col width="19%" />
<col width="54%" />
<thead>
<tr class="header">
<th align="left">Decision Variables</th>
<th align="left">Objectives</th>
<th align="left">Learn from Global Sensitivity Analysis</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>27 real</p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>Here is where we start seeing aggregation yield weird results.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real</p></td>
<td align="left"><p>GP and PFPF</p></td>
<td align="left"><p>Expecting another data point showing greater divergence between models with more aggregation.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real</p></td>
<td align="left"><p>F1, F2, F3 (PFPF)</p></td>
<td align="left"><p>Again expecting greater divergence with more aggregation.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>No longer have the RSM as a baseline. Do integer variables interact with real variables? Do integer variables interact with each other? Does the presence of these integer variables change the dependency structure of the real variables?</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>GP and PFPF</p></td>
<td align="left"><p>How do integer variables affect highly aggregated objectives? More interactions?</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>F1, F2, F3 (PFPF)</p></td>
<td align="left"><p>Another perspective on aggregation.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>??? 27 real * 2<sup>9</sup></p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>I'm not sure we'd even do sobol' on these. What would we stand to gain? We could show different dependency structures based on the different integer decisions, which might be interesting. On the other hand, we could pick a few select integer decisions from the mixed integer results, just to illustrate the change in dependency structure. That's probably more realistic than doing 256 Sobol' studies and then not even really looking at the results.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 3 int</p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>Do the integer variables affect real variable sensitivities the same when they're platform variables as when they're separate?</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>9 minmax, PFPF, and a platform commonality objective</p></td>
<td align="left"><p>Sobol' won't have anything new to tell us compared to the other formulation, since there's no mystery about the dependency structure for PFPF and this other commonality measure.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real</p></td>
<td align="left"><p>Single-objective formulations. GP, F1, F2, a few weightings from GP+PFPF, F1+F2, F1+F2+PFPF</p></td>
<td align="left"><p>This one admits a comparison between GASP and RSM sensitivities.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>Single-objective formulations. GP, F1, F2, a few weightings from GP+PFPF,</p></td>
<td align="left"><p>We get these for free if we run Sobol' sequences for this DV formulation.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 3 int</p></td>
<td align="left"><p>Single-objective formulations. GP, F1, F2, a few weightings from GP+PFPF, F1+F2, F1+F2+PFPF</p></td>
<td align="left"><p>We get these for free if we run Sobol' sequences for this DV formulation.</p></td>
</tr>
</tbody>
</table>

<table>
<col width="25%" />
<col width="19%" />
<col width="55%" />
<thead>
<tr class="header">
<th align="left">Decision Variables</th>
<th align="left">Objectives</th>
<th align="left">Learn from Search Dynamics</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>27 real</p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>Same search operators?</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real</p></td>
<td align="left"><p>GP and PFPF</p></td>
<td align="left"><p>Same search operators?</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real</p></td>
<td align="left"><p>F1, F2, F3 (PFPF)</p></td>
<td align="left"><p>Same search operators?</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>Do different search operators work better when you have a mixed-integer problem?</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>GP and PFPF</p></td>
<td align="left"><p>We can learn about changes to search operator dynamics resulting both from the presence of integer variables and highly aggregated objectives, and how those factors interact.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>F1, F2, F3 (PFPF)</p></td>
<td align="left"><p>Another perspective on aggregation.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>??? 27 real * 2<sup>9</sup></p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>I don't think examining search operator dynamics across 256 formulations would be valuable in the least.</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 3 int</p></td>
<td align="left"><p>9 minmax and PFPF</p></td>
<td align="left"><p>Does having fewer / more influential integer variables change the choice of search operators?</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>9 minmax, PFPF, and a platform commonality objective</p></td>
<td align="left"><p>Does the search struggle with this many objectives?</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real</p></td>
<td align="left"><p>Single-objective formulations. GP, F1, F2, a few weightings from GP+PFPF, F1+F2, F1+F2+PFPF</p></td>
<td align="left"><p>Not hard to collect, not sure if they have anything important to say.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>27 real + 9 int</p></td>
<td align="left"><p>Single-objective formulations. GP, F1, F2, a few weightings from GP+PFPF,</p></td>
<td align="left"><p>Ditto</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 3 int</p></td>
<td align="left"><p>Single-objective formulations. GP, F1, F2, a few weightings from GP+PFPF, F1+F2, F1+F2+PFPF</p></td>
<td align="left"><p>Ditto</p></td>
</tr>
</tbody>
</table>

I'm not sure I'm going to do everything in this massive table. And I'm sure I'll do things that aren't in the table. Some of the experiments don't do much to support arguments in favor of reformulation or to show what new opportunities we have with a more complex model. I did the top row last year with the Java versions of everything. That will be a good double-check for this study, because this one's going to use CBorg.

Notes
=====

-   I know epsilons are a problem that goes unacknowledged in this table. That's because I'm not really ready to bring in the preliminary results that show just how crucial the epsilon resolution is. *ɛ*<sub>DOC</sub> in particular was set way too large while *ɛ*<sub>ROUGH</sub> was set way too small in all of my previous studies.
-   This will need a graphical comparison of reference sets --- I can pick up the one from the MOEA comparison paper.
-   PFPF is an issue. It won't be the same PFPF anymore if it includes integer variables for the 9-int formulations.
-   (Woodruff, Simpson, and Reed 2013) covered some of this ground before, but in much less detail

Bibliography
============

Woodruff, Matthew, Patrick Reed, and Timothy Simpson. 2013. “Many Objective Visual Analytics: Rethinking the Design of Complex Engineered Systems.” *Structural and Multidisciplinary Optimization* 43 (1) (July): 201–219.

Woodruff, Matthew, Timothy Simpson, and Patrick Reed. 2013. “Diagnostic Analysis of Metamodels’ Multivariate Dependencies and Their Impacts in Many-Objective Design Optimization.” In *Proceedings of the ASME 2013 IDETC/CIE Conference*. ASME.

License
-------

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US).
