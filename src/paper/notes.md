# Notes

General notes about the study, not yet assigned to a particular section.

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


## Feasibility, Infeasibility, and Broken Models

GASP can't be relied on to produce well-formed results, to run without crashing, or even to crash on bad inputs.
    I need to build in a way to handle model breakage.
    I'm not sure how to do that, either, but perhaps for the time being just assign a very large constraint violation to a solution with missing / all $\infty$ objective values.
    What about only one aircraft versus all three being broken?  $\infty$ versus $3\infty$?

## Quotation

I haven't laid hands on the book yet, so I'm relaying this quote as given by [@venkataraman_and_haftka_2004_complexity].
    "For very large, ill-conditioned problems (200 variables or more) with no gradients available, one is likely to need divine assistance" [@fox_1971_optimization].
    In context, Venkataraman and Haftka point out that this is no longer true.
    The meaning is basically that the search is for a needle in a haystack because without gradients the problem doesn't tell you how to solve it.


<!--
vim:ts=4:sw=4:expandtab:wrap lbr
-->
