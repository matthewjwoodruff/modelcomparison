Computational Experiment
========================

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
-   covered some of this ground before, but in much less detail

Bibliography
============

License
-------

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US).
