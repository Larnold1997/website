---
date: "2020-03-25T00:00:00Z"
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
summary: Introduction to the SIR Model
tags:
- Mathematical Modeling
title: Compartment Models in Epidemiology Part 1
url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""
---

This post is an introduction to the basic models of disease spread, a topic that has entered the vernacular in recent weeks due to the COVID-19 pandemic. The focus will be the Susceptible-Infected-Recovery compartmental model. 

## Compartment Models

*Compartment models* are a broad class of mathematical models used to describe how components of a system move around from one sub-section to another sub-section within the larger system. Sometimes, such models are called "bathtub models," as the underlying math describes the "flow" (i.e. of water) from a source (the faucet) to a sink (the drain). Sometimes, the flow is one-way, meaning that the component cannot return to the source once it has left; other times, the flow is bi-directional, and a component can return to its source. Compartment models have many applications, including ecology, economics, and, notably, epidemiology. 

## SIR Model

The most elementary compartmental model in epidemiology is the *Susceptible-Infected-Recovery Model*, commonly called the *SIR Model*. The entire population is divided into three groups: 

+ People who have not had a disease and therefore are *susceptible* (S)

+ People who currently have the disease and therefore are *infected* (I)

+ People who have *recovered* (R) from the disease

This can be represented by the following basic graphic.

![](SIR.png)

Notice that this model assumes that the population is constant (i.e. no births or deaths) and that, once recovered, an individual cannot become infected again. If we let <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;\beta" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;\beta" title="\beta" /></a>describe infection rate and <a href="https://www.codecogs.com/eqnedit.php?latex=\inline&space;\gamma" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\inline&space;\gamma" title="\gamma" /></a> describe recovery rate, then we have the following system of ordinary differential equations:

<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{dS}{dt}&space;=&space;-\beta&space;IS,&space;\frac{dI}{dt}&space;=&space;\beta&space;IS&space;-&space;\gamma&space;R,&space;\frac{dR}{dt}&space;=&space;\gamma&space;R" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\frac{dS}{dt}&space;=&space;-\beta&space;IS,&space;\frac{dI}{dt}&space;=&space;\beta&space;IS&space;-&space;\gamma&space;R,&space;\frac{dR}{dt}&space;=&space;\gamma&space;R" title="\frac{dS}{dt} = -\beta IS, \frac{dI}{dt} = \beta IS - \gamma R, \frac{dR}{dt} = \gamma R" /></a>

Observing that the sum of the three derivatives is zero proves that the SIR Model assumes the total population is constant. 

The so-called *basic reproduction number* has also entered everyday conversation: it describes the expected number of new infections from a single infection in a population where all subjects are susceptible. In the SIR Model, it is given by the ratio of the rate of infection over the rate of recovery:

<a href="https://www.codecogs.com/eqnedit.php?latex=R_0&space;=&space;\frac{\beta}{\gamma}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?R_0&space;=&space;\frac{\beta}{\gamma}" title="R_0 = \frac{\beta}{\gamma}" /></a>

Rewriting the rate of change of infected individuals illustrates the importance of the basic reproductive number:

<a href="https://www.codecogs.com/eqnedit.php?latex=\frac{dI}{dt}&space;=&space;(R_0S&space;-&space;1)\gamma&space;I" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\frac{dI}{dt}&space;=&space;(R_0S&space;-&space;1)\gamma&space;I" title="\frac{dI}{dt} = (R_0S - 1)\gamma I" /></a>

Thus

<a href="https://www.codecogs.com/eqnedit.php?latex=R_0&space;>&space;\frac{1}{S(0)}&space;\Rightarrow&space;\frac{dI}{dt}(0)&space;>&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?R_0&space;>&space;\frac{1}{S(0)}&space;\Rightarrow&space;\frac{dI}{dt}(0)&space;>&space;0" title="R_0 > \frac{1}{S(0)} \Rightarrow \frac{dI}{dt}(0) > 0" /></a>

causing an *epidemic* in which the percentage of infected individuals can become quite large.

## Assumptions

All mathematical models make assumptions in their attempt to simplify the complicated real world. We have already noted that the SIR Model assumes that the total population is constant. It is important to outline the other assumptions present in the model so that we know how it might fail and what improvements can be made as we add complexity. The other main assumptions present in the basic SIR Model are:

+ No prior immunity; in other words, everyone has the potential to get sick.

+ All individuals are similar (susceptibility and infectivity). Thus a healthy young adult is as likely to both become infected and to recover as an elderly person with pre-existing health problems.

+ All individuals mix uniformly (equivalently, the mixture is homogeneous). This is "math-speak" that simply means one person is equally likely to come into contact with every other person in the population - regardless of if that person is sick or healthy, a family member or a stranger. 

+ All recovered individuals are immune; i.e., there is no possibility of re-infection.

+ No behavioral changes during the course of the epidemic!

Clearly, the SIR Model should not be used in any real-world decision-making process. Nevertheless, the dynamics that it describes serves as the basis for many epidemiological models that *are* (and should!) be used to inform policy decisions.

## Simulation

See my [Shiny app](https://larnold1997.shinyapps.io/sirmodel/) to view a graph of the fraction of individuals in the S, I, and R compartments over time, and how this graph changes as different parameters change. (This app assumes that everyone who is not infected initially is susceptible - in other words, there is no prior immunity, as described above.)