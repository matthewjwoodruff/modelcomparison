Abstract
========

Many Objective Visual Analytics: Constructive Problem Framing for Design Optimization

Constructive problem framing is a process that starts by acknowledging that the design optimization problem under consideration is not fully understood, treating the problem's formulation and even its basic assumptions as fluid and subject to revision by the designer. Learning about the problem leads to changes to the designer's assumptions and problem formulation, and ultimately to the selection of a design. Many Objective Visual Analytics (MOVA) provides a conceptual framework for constructive problem framing, setting it in terms of four mutually interacting activities: problem conception and formulation, many objective optimization, visualization, and negotiated design selection. This paper uses MOVA to illuminate the process of constructive problem framing for a new, computationally challenging, instance of the General Aviation Aircraft product family design problem (GAA Problem). While previous studies of the GAA Problem have employed a polynomial response surface model to provide rapid feedback, this study takes advantage of advances in computing power and algorithm design, using the cutting-edge multi-master Borg optimization framework to optimize a non-trivial aircraft design synthesis model. This paper uses the conceptual framework provided by MOVA to show how the transition from one problem formulation to the next encapsulates the knowledge acquired during the constructive problem framing process.

Introduction
============

Computational Experiment
========================

Demonstrate several iterations of constructive problem framing, each with its own variations on the process, to show how different ways of formulating and evaluating hypotheses are valid.

Strategies to exhibit
---------------------

These strategies will be combined in some iterations.

1.  *Initial information.* We, like most people, already have a good deal of information about the problem. This iteration shows how we use existing knowledge to form initial hypotheses.

2.  *Visualization.* We probably do this every time, unless we create a formulation that breaks the MOEA. Display our trademark visuals for comparing formulations --- scatter / glyph plot and parallel coordinate, as well as anything new that comes up. Visualization needs to be emphasized as a central tool for forming and evaluating hypotheses.

3.  *Full iteration.* Optimize, visualize, compare solutions, form a new hypothesis.

4.  *Branching.* Form multiple hypotheses at the same time and compare them.

5.  *Short-cut.* Evaluate hypotheses based on existing model evaluations, and decide whether or not to optimize them. Use ancillary Pareto sorting and objective re-evaluation

6.  *Carry-forward.* Use existing model evaluations to generate an initial archive for a new problem formulation.

7.  *Emergent Strategies.* Things I haven't thought of yet that emerge from the process.

Matrix Formalism?
-----------------

We have an opportunity to apply Curtis and Mattson's matrix formalism for formulation space exploration in the model reevaluation script.

Bibliography
============

License
-------

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)
This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US).
