Computational Experiment
========================

Decision Variable Formulations
------------------------------

<table>
<col width="42%" />
<col width="56%" />
<thead>
<tr class="header">
<th align="left">Formulation</th>
<th align="left">Explanation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>27 real</p></td>
<td align="left"><p>Baseline formulation</p></td>
</tr>
<tr class="even">
<td align="left"><p>27 real + 3 integer</p></td>
<td align="left"><p>Integer variables are for specifying a platform.</p></td>
</tr>
</tbody>
</table>

Objective Function Formulations
-------------------------------

<table>
<col width="42%" />
<col width="56%" />
<thead>
<tr class="header">
<th align="left">Formulation</th>
<th align="left">Explanation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>9 minmax + PFPF</p></td>
<td align="left"><p>Baseline many-objective formulation</p></td>
</tr>
<tr class="even">
<td align="left"><p>GP + PFPF</p></td>
<td align="left"><p>Baseline highly-aggregated formulation</p></td>
</tr>
<tr class="odd">
<td align="left"><p>F1 + F2 + PFPF</p></td>
<td align="left"><p>Baseline partly-aggregated formulation</p></td>
</tr>
<tr class="even">
<td align="left"><p>Utility functions</p></td>
<td align="left"><p>GP, F1, F2 on their own plus samples from the F1-F2 weighting space. Plus samples from the weighting space of each of the above with PFPF.</p></td>
</tr>
</tbody>
</table>

Analysis
--------

Notes
-----

-   I know epsilons are a problem that goes unacknowledged in this table. *ɛ*<sub>DOC</sub> in particular was set way too large while *ɛ*<sub>ROUGH</sub> was set way too small in all of my previous studies.
-   This will need a graphical comparison of reference sets --- I can pick up the parallel coords from the forthcoming MOEA comparison paper.
-   (Woodruff, Simpson, and Reed 2013) covered some of this ground before, but in much less detail

Bibliography
============

Woodruff, Matthew, Timothy Simpson, and Patrick Reed. 2013. “Diagnostic Analysis of Metamodels’ Multivariate Dependencies and Their Impacts in Many-Objective Design Optimization.” In *Proceedings of the ASME 2013 IDETC/CIE Conference*. ASME.

License
-------

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US).
