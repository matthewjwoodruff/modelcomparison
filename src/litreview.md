# Literature Review

## Plan

I think JMD is a good journal to target for this paper.
    They do lots of metamodeling papers, and they also have some more touchy-feely stuff about design novelty.
    Maybe even possible (although worthwhile?) to get in a technical brief on the difficulties of getting GASP up and running.

Next up, EJOR.

* What is a model for?
* How does it interact with problem formulation?
    - In terms of solutions produced
    - In terms of formulations available
* What's interesting about this study?
* What do I want people to do after reading it?
    - Try more problem formulations?
    - Try different models?

I think what I really need to do here is figure out what the state of the literature is.
    I'll start by looking at the summaries I did on SMO.
    Other places to look:

* Who has cited Tsoukias?  Possibly relevant.
* Does EJOR publish anything relevant?
* How about the MOEA crowd?
* Tim has mentioned Journal of Mech Design.
* Also seach around for multi-fidelity modeling, surrogate modeling, kriging, regression, etc.
* Sensitivity analysis lit might be relevant?  Especially if somebody's done SA on metamodels.
    Other than me, of course.

I'll be looking for:

* Multi-fidelity modeling
* Problem formulation
* Other stuff?  I don't really know what I'm looking for.  Similar studies, I suppose.
    - Compare solution sets from model and metamodel. (I'm sure this has been done.)
    - Compare formulations from model and metamodel.  (I'm not sure this has been done.)

Let's take this next-to-last point as a start.
    I'm looking for papers that *compare a model and a metamodel*, because that's what I do too.
    This will be a natural jumping-off point in the literature, it's clearly the most related body of work.
    I imagine there's a good deal of error estimation and so forth.

So the question is, do I want to start with papers that are about *developing* metamodels, or papers that are about *using existing* metamodels?  I'm not sure the latter category exists, really.

Alternatively, do I want to just pull the latest number from EJOR, Evolutionary Computation, IEEE Trans Evolutionary Computation, and JMD? Also simulation opt lit, Proc. WinterSim and perhaps others?
    Not necessarily in that order.

I'm going to take the latter route.  We'll see what emerges.

## What I've Learned

There's an interesting and relevant confluence of ideas out there in the literature.
    There are the people doing single-objective optimization for really expensive functions with GP-based metamodels.
    There is the decision-based design crowd, who have a single-objective optimizer with human-in-the-loop pauses to collect rankings.
    And there's the value-based global optimization aspect, which apparently combines the philosophy of DBD with optimization based on metamodels.

For the JMD folks, design novelty is an important point.
    Or at least important enough that some of our PSU IE folks published about it in JMD.
    Design novelty could work for me because, what better way to get design novelty than to reconceive the problem.

But really, I'm looking for a link in the literature that brings in what we're doing in this paper.
    So from the point of view of the GP-based metamodel optimization folks, what does this study look like?
    We're taking a not-so-expensive model and comparing it to an even cheaper metamodel.
    I think they would argue irrelevance because GASP is so cheap in the first place.

Ah ha!
    So that's our way in.
    We've taken this line before, in the conference paper.
    But it's worth revisiting the point (Moore's Law again) that *this study would have been impossible a decade ago because GASP function evaluations were too expensive.*

Ok. Good.
    But, what is this study about, really?
    We're exploring the possibilities of an alternative model.
    Could we instead divert away from the point above and talk about how using a different model gave us a new perspective, regardless of its expense?
    We're going to want to collect data from the metamodel and compare to GASP, not just the reference sets but everything along the way --- *how much error is in the metamodel?*
    I'm betting that there's not much, using conventional error metrics like RMSE.
    And then we can have a paper about how good approximations can still give you a lot of error.
    Another interesting thing would be to plot absolute error versus optimization time.
    Does the error go up as we get closer to the Pareto Front?
    For this we want to capture every solution Borg tries.
    Probably better to hook into the model than into Borg?
    Or not even that, this is basically a Tee.

So why is this important?
    And to whom?
    The bit about error is important because we rely on metamodels for optimization and we think that good error stats means that we're close to the truth, where in fact the *problem formulation* can magnify errors.
    This is a problem for the single-objective folks, mitigated by model updates, but still present.
    Basically, they're relying on their model to converge to reality at least where they're interested in it.
    I.e., they're relying on a procedure that they wouldn't admit is a heuristic --- optimizing over a metamodel to find the best point to sample next.
    Not that it's a bad heuristic.
    I think it's quite a good one, in fact.
    Anyway, I'm not sure if this is a path to pursue.
    Could be read as an attack on those guys' methods, which are pretty rigorous compared to our hand-waving, which I don't intend.

But, who it's a real problem for is people who are *just* using a metamodel.
    People who don't have the defence that they're automatically updating their metamodels.
    Does that include Moore?
    Nope.
    She's updating her Kriging model all the time, really.
    In fact, I went back to her dissertation and she's doing *exactly* the stuff from the Powerpoint Jon sent me: GP-based optimization, with dynamically updated kriging models.

So, what's the context here?
    Is this study in fact a case for dynamic updates of *both* model and formulation?


<!--
vim:ts=4:sw=4:expandtab:wrap lbr
-->
