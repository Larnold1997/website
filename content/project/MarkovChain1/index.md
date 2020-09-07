---
date: "2020-09-07T00:00:00Z"
# external_link: ""
# image:
#   caption: Photo by rawpixel on Unsplash
#   focal_point: Smart
# links:
# - icon: twitter
#   icon_pack: fab
#   name: Follow
#   url: https://twitter.com/georgecushen
# slides: example
summary: Introduction to Markov Chains
tags:
- Statistics Tutorials
title: Markov Chains Part 1
url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""
---

This post is an introduction to the Markov Chain, a common stochastic modeling framework to simulate random phenomena. 

## A Motivating Example: Susceptible-Infected-Susceptible (SIS) Model

At any given time, an individual is either *infected* with a disease or is healthy, i.e. is *susceptible* to becoming infected. Over an extended period of time (e.g. a year), an individual is likely to experience both of these *states*. Suppose we observe an individual over a sequence of days <a href="https://www.codecogs.com/eqnedit.php?latex=n&space;=&space;1,&space;2,&space;..." target="_blank"><img src="https://latex.codecogs.com/gif.latex?n&space;=&space;1,&space;2,&space;..." title="n = 1, 2, ..." /></a> and classify this individual on day *n* as:

<a href="https://www.codecogs.com/eqnedit.php?latex=X_n&space;=&space;\begin{cases}&space;I&space;&&space;\text{if&space;infected}\\&space;S&space;&&space;\text{if&space;susceptible}\\&space;\end{cases}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?X_n&space;=&space;\begin{cases}&space;I&space;&&space;\text{if&space;infected}\\&space;S&space;&&space;\text{if&space;susceptible}\\&space;\end{cases}" title="X_n = \begin{cases} I & \text{if infected}\\ S & \text{if susceptible}\\ \end{cases}" /></a>

There is some *probability* <a href="https://www.codecogs.com/eqnedit.php?latex=\alpha" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\alpha" title="\alpha" /></a> that an infected individual remains infected the following day; in this simple scenario, there must therefore be a probability <a href="https://www.codecogs.com/eqnedit.php?latex=1&space;-&space;\alpha" target="_blank"><img src="https://latex.codecogs.com/gif.latex?1&space;-&space;\alpha" title="1 - \alpha" /></a> that the individual instead *transitions* to the susceptible state the following day<a href="#note1" id="note1ref"><sup>1</sup></a>. Likewise, we can apply this same reasoning to deduce that a susceptible individual will remain susceptible the following day with probability <a href="https://www.codecogs.com/eqnedit.php?latex=\beta" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\beta" title="\beta" /></a> or will transition to infected with probability <a href="https://www.codecogs.com/eqnedit.php?latex=1&space;-&space;\beta" target="_blank"><img src="https://latex.codecogs.com/gif.latex?1&space;-&space;\beta" title="1 - \beta" /></a> 

With fairly high accuracy, we can guess how an individual will feel tomorrow based only on how he/she feels today. In other words, there is no need to consider how an individual felt before day *n* in order to guess how an individual is likely to feel on day *n + 1*. Thus, the values of <a href="https://www.codecogs.com/eqnedit.php?latex=\alpha" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\alpha" title="\alpha" /></a> and <a href="https://www.codecogs.com/eqnedit.php?latex=\beta" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\beta" title="\beta" /></a> apply regardless of the indivdual's health histroy. We call this one-step memory proprty the *Makrov property*; it can be interpreted as "given the present, the future does not depend on the past." 

*Markov chains* (MCs) are a type of stochastic (random) mathematical model that allows us to describe this scenario more formally. This math is useful for many reasons; for example, we can use it to compute the percentage of days that an individual is expected to be sick, or the number of individuals sick simultaneously during an epidemic.

## Mathematical Notation

Formally, a Markov Chain is a stochastic process on the *state space* <a href="https://www.codecogs.com/eqnedit.php?latex=S&space;=&space;\{1,&space;2,&space;\dots,&space;s\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?S&space;=&space;\{1,&space;2,&space;\dots,&space;s\}" title="S = \{1, 2, \dots, s\}" /></a> (i.e. the chain has *s* possible states) that has one-step memory. Importantly, the Markov chain assumes a *discrete* state-space<a href="#note2" id="note1ref"><sup>2</sup></a>. The *transtion probability* from state *i* to state *j* is given by:

<a href="https://www.codecogs.com/eqnedit.php?latex=\mathcal{P}(X_n&space;=&space;j&space;|&space;X_{n-1}&space;=&space;i,&space;X_{n-2}&space;=&space;x_{n-2},&space;\dots,&space;X_0&space;=&space;x_o)&space;=&space;\mathcal{P}(X_n&space;=&space;j&space;|&space;X_{n-1}&space;=&space;i)&space;=&space;P_{ij}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\mathcal{P}(X_n&space;=&space;j&space;|&space;X_{n-1}&space;=&space;i,&space;X_{n-2}&space;=&space;x_{n-2},&space;\dots,&space;X_0&space;=&space;x_o)&space;=&space;\mathcal{P}(X_n&space;=&space;j&space;|&space;X_{n-1}&space;=&space;i)&space;=&space;P_{ij}" title="\mathcal{P}(X_n = j | X_{n-1} = i, X_{n-2} = x_{n-2}, \dots, X_0 = x_o) = \mathcal{P}(X_n = j | X_{n-1} = i) = P_{ij}" /></a>

Translating from math-speak to English: the probability that the Markov Chain will be in state *j* at time-step *n* <a href="https://www.codecogs.com/eqnedit.php?latex=X_n&space;=&space;j" target="_blank"><img src="https://latex.codecogs.com/gif.latex?X_n&space;=&space;j" title="X_n = j" /></a> given (| is read as "given") that the Markov Chain is in state *i* at time-step *n-1*, i.e. <a href="https://www.codecogs.com/eqnedit.php?latex=X_{n-1}&space;=&space;i" target="_blank"><img src="https://latex.codecogs.com/gif.latex?X_{n-1}&space;=&space;i" title="X_{n-1} = i" /></a> depends *only* on the fact that <a href="https://www.codecogs.com/eqnedit.php?latex=X_{n-1}&space;=&space;i" target="_blank"><img src="https://latex.codecogs.com/gif.latex?X_{n-1}&space;=&space;i" title="X_{n-1} = i" /></a> and we can ignore all previous realizations of the Markov Chain.


## Back to the SIS Model: Constructing the Transition Probablity Matrix

There are two states in the SIS model: <a href="https://www.codecogs.com/eqnedit.php?latex=S&space;=&space;\{Infected,&space;Susceptible\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?S&space;=&space;\{Infected,&space;Susceptible\}" title="S = \{Infected, Susceptible\}" /></a> The transition proabilities are <a href="https://www.codecogs.com/eqnedit.php?latex=\alpha" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\alpha" title="\alpha" /></a> <a href="https://www.codecogs.com/eqnedit.php?latex=1&space;-&space;\alpha" target="_blank"><img src="https://latex.codecogs.com/gif.latex?1&space;-&space;\alpha" title="1 - \alpha" /></a> <a href="https://www.codecogs.com/eqnedit.php?latex=\beta" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\beta" title="\beta" /></a> and <a href="https://www.codecogs.com/eqnedit.php?latex=1&space;-&space;\beta" target="_blank"><img src="https://latex.codecogs.com/gif.latex?1&space;-&space;\beta" title="1 - \beta" /></a> as defined above, leading to the following *transition probability matrix* (TPM):

<a href="https://www.codecogs.com/eqnedit.php?latex=\mathbf{P}&space;=&space;\begin{bmatrix}&space;\alpha&space;&&space;1&space;-&space;\alpha&space;\\&space;1&space;-&space;\beta&space;&&space;\beta&space;\end{bmatrix}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\mathbf{P}&space;=&space;\begin{bmatrix}&space;\alpha&space;&&space;1&space;-&space;\alpha&space;\\&space;1&space;-&space;\beta&space;&&space;\beta&space;\end{bmatrix}" title="\mathbf{P} = \begin{bmatrix} \alpha & 1 - \alpha \\ 1 - \beta & \beta \end{bmatrix}" /></a>

The rows of this matrix correspond to the current state (an individual's infection status today), while the columns of this matrix correspond to the next state (an individual's infection status tomorrow). Each entry of this matrix, therefore, represents the probability that a transition from state *i* to state *j* will occur in a single step. It is a specific example of a *probabilistic matrix*, which has the properties of rows that sum to 1 and entries that are bounded between 0 and 1. 

Transition probablity matrices are necessary for most of the "useful" math associated with MCs. As a brief example, multiplying the TPM by itself yields the 2-step transition probability matrix, which in the SIS example, represents the probability an individual has infection status *j* the *day after tomorrow*, given that the individual currently has infection status *i*<a href="#note1" id="note3ref"><sup>3</sup></a>.

## ODEs and MCs: A Comparison

[Elsewhere,](https://larnold1997.github.io/project/sir_model/) I have presented a very similar model for infectious diseases using ordinary differential equations (ODEs). Both frameworks are equally valid and can be used to answer many of the same questions. However, there is a notable difference between these two types of models. An ODE model is deterministic, i.e. it will *always* yield the same answer using the same parameters and set of initial conditions. MCs, on the other hand, are *stochastic*, i.e. they are based in randomness, and any values obtained using MCs must be assessed probabilistically. Thereore, before applying either framework, a modeler must decide what type of answer they hope to get for their research question(s).

<a id="note1" href="#note1ref"><sup>1</sup></a> Recall from basic probability that if one of two events always occurs, then the probability that each of them occurs must sum to 1.

<a id="note2" href="#note1ref"><sup>2</sup></a> In the context of the SIS example, this means an individual is either susceptible or infected; there is no intermediate state.

<a id="note3" href="#note1ref"><sup>3</sup></a> In a future post, I will explore how repeating this process yields the long-term probabilities associated with the Markov chain.