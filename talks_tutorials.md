# StanCon 2023 Talks and Tutorials

## Invited speakers

**Bob Carpenter** (Senior Research Scientist, Flatiron institute)\
**Talk Title: The efficient frontier: Bayes, neural nets, and the future of Stan**\
**Abstract:** Stan has relied primarily on two types of inference, (Euclidan) Hamiltonian Monte Carlo (HMC), with the adaptive no-U-turn sampler (NUTS), and variational approximation using autodiff variational inference (ADVI).  I will provide a quick overview of the evolution of these algorithms before moving on to future prospects for Bayesian inference for differentiable target densities.

1.  Pathfinder, quasi-Newton variational inference.  This is a massively parallelizable form of variational inference that is much faster, more accurate, and more robust than ADVI.  The Stan implementation is feature complete and being code reviewed for the next release (v2.33).

2.  Partial momentum refresh, Metropolis-adjusted Langevin (MALA) with non-uniform acceptance, massively parallel adaptation, and delayed rejection HMC (DR).  This provides an easy-to-adapt, massively parallelizable HMC that can sample multiscale densities like the funnel.  This required revised convergence diagnostics.

3.  Normalizing flows for variational inference.  Despite an absurd degree of overparameterization, deep neural networks with real non-volume preserving (RaelNVP) flows are massively parallelizable and super fast with state-of-the-art hardware on in-kernel GPU-based systems like JAX.  I'll provide some results both in high dimensions and for distributions with funnel- and banana-like properties.  Early results show that it outperforms a highly-tuned version of ADVI.


**John Kruschke** (Provost Professor Emeritus, Indiana University, Bloomington)\
**Talk Title: We all can benefit from Bayesian analysis reporting guidelines if we use them** \
**Abstract:** When reports of statistical analyses are opaque, then readers suffer, authors suffer, and science suffers. To alleviate suffering, I present the Bayesian analysis reporting guidelines – the BARG – published in Nature Human Behaviour. The BARG systematically explain essential ingredients for a report that is thorough, understandable, and reproducible. Software developers need to know the BARG so their software produces and displays all the relevant information. Educators can use the BARG to teach students the reasons behind statistical reports. Reviewers and editors, along with authors and analysts, can rely on the BARG to help research reports be clear and reproducible. In this talk I describe the BARG with a detailed example. The BARG can be beneficial for all users of Bayesian analysis and for the science they produce – if they use the BARG. Will you?


**Mariel Finucane** ( Principal Statistician, Mathematica Policy Research)\
**Talk Title: Statistical Significance Makes our Mission: Impossible** \
**Abastract:** It’s an old trick among statisticians: when we can’t answer the question that our collaborators are substantively interested in, we answer a question that sounds like that question. We hope they won’t notice the bait and switch. That, in a nutshell, is the story of statistical significance in the field of social policy evaluation. People want some assurance that the policy being studied moved the needle for the individuals or communities it serves. Statistical significance and p-values sound like they can provide that assurance. They can’t, and when we pretend they can (which we still do horrifyingly often!), we can be making a large-magnitude – not just semantic – mistake. In this talk, we provide examples of how statistical significance is an obstacle to achieving our mission, and we describe how Bayesian methods using evidence-based priors can give us what we thought we were getting with statistical significance, and more.


**Siddhartha Chib** (Harry C. Hartkopf Professor of Econometrics and Statistics, Washington University in St. Louis)\
**Talk Title: Regression Under Endogeneity: Bernstein-von Mises Theory and Bayes Factors Testing** \
**Abstract:** We develop a semiparametric Bayesian analysis of linear regression with possibly endogenous regressors. To avoid the risk of distributional misspecification, the prior-posterior analysis is based solely on moment restrictions following the framework of Chib, Shin and Simoni (2018, JASA). We study the consequences of neglected endogeneity and derive a Berstenin-von Mises (BvM) theorem for the posterior distribution of a (default) base model when exogeneity is assumed, but that assumption is false. Due to the negative consequences of neglected endogeneity, we develop a Bayes factor test for endogeneity that compares the base model with an extended model that is immune from the problem of neglected endogeneity. We prove that this test is a consistent selection procedure: as the sample becomes large, it almost surely selects the base model if the treatments are exogenous, and the extended model if the treatments are endogenous. The theory is illustrated with problems concerning the causal effect of education on wages, financial asset pricing with possibly endogenous risk factors, and the causal effect of potentially endogenous airplane ticket prices on passenger volume

## Tutorials


**Fundamentals of Stan**\
**Instructor:** Charles Margossian (Flatiron Institute). _This course serves as an introduction to Stan and may be used as a stepping stone before taking more advanced tutorials._

**Bayesian workflow illustrated using BRMS**\
**Instructor:** Mitzi Morris (Columbia University)

**Hierarchical models in Stan: varieties, optimizations & nuances**\
**Instructor:** Mike Lawrence (Axem Neurotechnology)


**Building a GPT in Stan**\
**Instructor:** Daniel Lee

**Cognitive diagnostic models in R and Stan**\
**Instructor:** Jake Thompson (University of Kansas)


**Advances of model assessment, selection, and inference after model selection**\ 
**Instructor:** Andrew Johnson (Aalto University)


# Talks


**Two Challenges for Bayesian Model Expansion**\
Collin Cademartori (Columbia University)\
**Abstract**: The process of iterative model expansion often involves moving from some simple initial model to more complex, higher-dimensional models in order to obtain better fit to our observed data or to remove unrealistic assumptions. In this talk, I will argue that this model expansion process can create distinct challenges which motivate the use of more fine-grained posterior summaries in inference and model evaluation. In particular, a pair of theoretical results demonstrate how expansion can make typical model summaries and checks less informative as the model complexity grows. I will present some intuition for these results and discuss how the corresponding challenges can be mitigated by avoiding premature posterior marginalization. A brief example will tie these ideas together with a case in which certain conditional p-values contain substantially more information than the usual marginal counterpart.

**Bayesian modeling workflow for pharmacometric applications using bbr.bayes with Stan/Torsten**\
William R Gillespie (Metrum Research Group)\
**Abstract**: The R package bbr.bayes extends the bbr package by providing tools to facilitate traceable and reproducible Bayesian modeling workflows. The current version supports Stan models using cmdstanr. Future releases will add support for Bayesian modeling with NONMEM.
bbr.bayes includes R functions for:

•	Creating a new bbr model object de novo or by copying a pre-existing model. In the de novo case that includes creating template files for the Stan model and R scripts to generate a Stan data set, generate initial estimates and to set and record cmdstan arguments.

•	Documenting a model object by providing a model description and tags.

•	Creating a model log that summarizes multiple models. This may be used to create a tabular summary of model characteristics and fitting diagnostics, e.g., looCV results.
bbr.bayes promotes a consistent approach to a Bayesian workflow that enhances traceability and reproducibility, facilitates QC, and simplifies summarization and comparison of multiple models. I will illustrate the use of bbr.bayes for a typical pharmacometric data analysis using Stan/Torsten. 


**bibat: a batteries-included Bayesian analysis template**\
Teddy Groves (Technical University of Denmark)\
**Abstract**: Choosing how to structure and write code that implements a Bayesian workflow can be very tricky, especially when there are multiple models, datasets and data transformations to keep track of. Bibat aims to make creating a high-quality, scaleable Python-and-Stan based Bayesian statistical analysis project less of a hassle by providing easy access to automation, a file-based and declarative workflow and a project structure with well-designed abstractions and modules. Bibat is "batteries-included" in the sense that it works out of the box: just run the command `bibat` then fill in a quick form and bibat will create a project implementing a complete example analysis that you can run with the command `make analysis`. My talk will explain bibat's main features and hopefully prompt you to give me feedback about its design. You can find bibat's source code on github here https://github.com/teddygroves/bibat/, or read the documentation here https://bibat.readthedocs.io/en/latest/

**Parameterization of complex models ... easy as ABC (Approximate Bayesian Computation)**\
Paul Johnson (Vanderbilt University)\
**Abstract**: Approximate Bayesian Computation (ABC) is a flexible approach that allows statisticians to perform Bayesian inference in cases where a likelihood function is either unknown or too complex to be represented in closed form (e.g., agent-based simulations). However, ABC is not as commonly featured in the literature compared to traditional MCMC sampling or surrogate modeling techniques. Here, we provide an overview of the ABC framework and demonstrate its utility with an applied case study analyzing economic risks of supply-chain disruptions due to flooding along the Upper Mississippi River. We show that with even one observational data point, the ABC framework can help researchers quantify uncertainties of parameters in complex models. 

**Bayesian pipelines with stantargets**\
Will Landau (Eli Lilly)\
**Abstract**: The stantargets R package is an extension of CmdStanR, a lightweight interface to Stan, and targets, a general-purpose pipeline tool for reproducible research and high-performance computing. In stantargets, a complicated Stan workflow becomes a concise targets pipeline, and targets orchestrates the pipeline to efficiently bring the results up to date with the underlying code and data. By simplifying pipeline creation, stantargets reduces the practical burden of developing and maintaining reproducible analysis workflows for Bayesian statistics.

**Access Stan models from your favorite language with BridgeStan**\
Edward A. Roualdes (California State University in Chico) \
**Abstract**: BridgeStan provides efficient in-memory access to the methods of Stan models through Python, Julia, and R. This allows algorithm development in these languages with the efficiency and expressiveness of Stan models. Importantly, methods for log-density, gradient, and Hessian evaluations as well as constraining and unconstraining transforms are exposed from an underlying Stan model, with zero to minimal additional memory allocations.  Furthermore, these features are exposed through a language-agnostic C API, allowing foreign function interfaces in their languages with minimal additional development.

**Journey to efficient sampling in multivariate normal latent variable models**\
Edgar Merkle (University of Missouri)\
**Abstract**: Latent variable models arising from psychometrics overlap with many families of traditional statistical models, including mixed models, generalized linear models, time series models, and path models. There are many ways to estimate these models in Stan, some of which are much slower and inefficient than others. In the talk, I will describe Stan strategies for coding the models, so that the sampling is as fast and efficient as possible. These strategies are informed by my 8 years of experience of developing blavaan, which is an R package for Bayesian latent variable modeling that relies on Stan under the hood. The talk will focus on multivariate normal models, with extensions to multivariate probit models and multilevel, multivariate models. I will conclude with discussion of some areas where I think further improvement could be made.

**Delayed rejection Hamiltonian Monte Carlo for sampling multiscale distributions**\
Chirag Modi (Flatiron Institute)\
**Abstract**: In this talk, I will discuss a new algorithm that combines delayed rejection (DR) techniques with  Hamiltonian Monte Carlo (HMC) for efficient sampling of pathological distributions such as Neal's funnel where the target distribution has a wide range of length scales and the small step sizes needed for stability in high-curvature regions can be inefficient elsewhere. I will focus on the DR variant where if an initial HMC trajectory is rejected, we make one or more subsequent proposals each using a step size geometrically smaller than the last. I will also extend the standard delayed rejection framework to allow the probability of a retry to depend on the probability of accepting the previous proposal. DRHMC enables up to five-fold performance gains over optimally-tuned HMC for multi-scale distributions and provides increased robustness to step size misspecification for simpler distributions. 

**What do news readers want?**\
Cameron Pfiffer (Stanford University)\
**Abstract**: We estimate a hierarchical Bayesian model of news readers' preferences for different types of news content. Using a novel dataset covering the complete history of individual-level web traffic and digital subscriptions from a major metropolitan newspaper in the United States from 2020 to 2021, we investigate consumers' willingness to pay for different kinds of content, such as investigative journalism, local news, sports, and political news. Our statistical identification relies on the quasi-random arrival of paywall events which force consumers to subscribe if they wish to continue reading. Using this variation, we estimate a model of consumer demand and construct the optimal content portfolio for the paper under different counterfactual revenue models: a fully subscription-based model and a fully ad-supported model. Preliminary results suggest that news consumers are willing to pay for investigative and local content, and that commonly used measures of demand based only on time-use substantially underestimate the value of investigative news.

**Fully Bayesian Economically Optimal Design for Spatially Varying Coefficient Linear Stochastic Plateau Model**\
B. Wade Brorsen (Oklahoma State University)\
**Abstract**: Experimentation to guide optimal fertilizer selection is moving toward on-farm experimentation due to the uncertainty of small on-station experiments. However, there is no agreement on the optimal way to conduct on-farm experimentation, which motivated this paper. Optimal on-farm experimentation is addressed using fully Bayesian decision theory. Monte Carlo integration was used, assuming a linear stochastic plateau model with spatially correlated plateau parameters. The spatially varying coefficient model can be used to guide the application of site-specific nitrogen. The actual economic optimal nitrogen values vary from 130 to 180 for different plots based on the data-generating process used for simulation. Of the designs considered, the results show that experimenting on 15 plots of a field with treatment levels of 35, 130, 165, and 230 with 2, 3, 5, and 5 replications maximized the farmers' profit over several years. The third year was the best time to quit experimenting.

**MCMC-Monitor: Browser-based Monitoring of Stan MCMC Samplers**\
Jeff Soules (Flatiron Institute)\
**Abstract**: We have developed MCMC-Monitor, a browser-based visualization tool for live-monitoring of MCMC samplers. It displays interactive plots of standard and user-specified variables for MCMC runs, both during sampling and after run completion. Plots include timeseries line charts showing the evolution of variables on a per-chain or cumulative basis; histograms; 2- and 3-D scatterplots of user-selected variable combinations; and autocorrelation function plots, as well as tabular data, including effective sample size estimates. Variables include user-requested subsets of model parameters, as well as Stan-computed descriptive variables like per-draw log probability, acceptance rate, stepsize, and more. By exposing these data in graphical format in real-time, MCMC-Monitor provides insight into the convergence of live runs, allowing users to make adjustments before expending time and compute resources. One distinctive feature of MCMC-Monitor is that it allows monitoring runs either on the local machine or on a remote computer.

**Bayesian phase retrieval for image reconstruction using fast Fourier transforms in Stan**\
Brian Ward (Flatiron Institute)\
**Abstract**: In this talk, I will show how Stan's new complex number capabilities and 2D fast Fourier transform can be applied to biomedical image reconstruction problems from the field of holographic coherent diffraction imaging. These features in Stan allow us to directly represent a generative forward model for this problem called the HoloML model. This model uses photon counts observed during X-ray diffraction imaging as the rate for a Poisson likelihood to recover the missing phase information required to construct images of the desired specimen. I will present step-by-step how to simulate from the forward model, discuss which Stan developments made this model possible and efficient, and conclude with simulated results from both optimization and Bayesian sampling to solve the inverse problem.

**Implementing an Almost Ideal Demand System of mobility expenditure in Stan**\
Ariane Kehlbacher (German Aerospace Center DLR)\
**Abstract**: The Almost Ideal Demand System (AIDS) by Deaton is widely used in economics to estimate systems of demand functions. The model predicts (across households and/or over time) how consumers change their demand in response to price and/or income changes. This is why the AIDS is often used to investigate the welfare implications of, for example, taxes or subsidies, or price changes. Reasons for the AIDS's popularity in econometrics is inter alia its flexibility as it gives an arbitrary first-order approximation to any demand system. In the majority of applications, the AIDS is estimated using frequentist methods. A few applications use Bayesian methods, but as of yet these studies employ Gibbs Sampling in their estimation. Taking advantage of the efficiency gains that arise from using Hamiltonian Monte Carlo to estimate the model, this work estimates an AIDS using Stan. Data on expenditures for three transport modes, car, train and bus/taxi, by different groups of households in Germany are used. The objective is to investigate substitute and complementary relationships between transport modes so as to better understand the impact of recent increases in energy costs on transport demand. The poster explains model specification including parameter restrictions, estimation in Stan, as well as the computation of the price and expenditure elasticities. Interesting issues arise in relation to 1) the prior specification in the light of the parameter restrictions required by economic theory, which leave only a subset of parameters free to be estimated, and 2) the imposition of curvature (i.e. a downward sloping demand function) which requires the computation of Eigenvalues of the matrix of second order derivatives and some kind of rejection step.

**Dimensionality Reduction via Probabilistic Inference**\
Aditya Ravuri (University of Cambridge)\
**Abstract**: Dimensionality reduction (DR) algorithms compress high-dimensional data into a lower dimensional representation while preserving important features of the data. DR is a critical step in many analysis pipelines as it enables visualisation, noise reduction and efficient downstream processing of the data. In this work, we introduce the ProbDR variational framework, which interprets a wide range of classical DR algorithms as probabilistic inference algorithms in this framework. The framework can be used to provide probabilistic interpretations of PCA, CMDS, LLE, LE, MVU, diffusion maps, kPCA, Isomap, (t-)SNE, and UMAP. By treating DR as probabilistic inference, we show how Stan can be used to perform posterior inference for the low-dimensional latent variables and other model parameters, enabling reasoning about unseen data. We hope that our framework facilitates communication, reasoning about uncertainties, model composition, and extensions, particularly when domain knowledge is present. Preprint: https://arxiv.org/abs/2304.07658


**A Bayesian Nonparametric approach for modeling temporal local clusters**\
Chetkar Jha (Washington University at St. Louis)\
**Abstract**: We propose an unsupervised Bayesian nonparametric approach for dynamic modeling of local clusters over time. Clustering and in particular local clusters may change over time as cluster membership evolves. The evolution of cluster membership may undergo because of a known or unknown physical, chemical, or biological process and understanding this evolution may help us hypothesize about the underlying process. Our proposed approach induces a temporal evolution of local clusters by proposing an autoregressive Dirichlet process prior on global column level clusters, where the temporal weights are learned. Posterior inference is performed through a Monte Carlo Markov Chain that is efficient for large datasets. Our proposed approach facilitates flexible modeling of dynamic clusters over time. We demonstrate the performance of our method using simulation and real dataset analysis.

**Probabilistic Tsunami Hazard Maps**\
Georgios Boumis (University of Alabama)\
**Abstract**: For sustainable tsunami disaster risk reduction and management, we need to be able to provide probabilistic tsunami hazard estimates in a spatially-continuous manner with small uncertainty. Current practices involve time consuming and cost intensive numerical modeling of complex tsunami processes, e.g., generation and propagation under multiple possible scenarios. Here, we instead present probabilistic tsunami hazard maps derived solely from tide gauge observations. Specifically, we leverage Stan and rstan to develop a Bayesian hierarchical model which allows us, via latent Gaussian processes, to map extreme tsunami amplitude along the entire stretch of California and Oregon shorelines, even at ungauged coasts. Our Bayesian hazard estimates show significantly reduced uncertainty compared to site-specific maximum likelihood analysis.

**Kolmogorov and Stan**\
Ben Goodrich (Columbia University)\
**Abstract**: Columbia received a NSF grant for which Andrew Gelman and I are the PIs whose goal is to make the evaluation of a (reparameterized) log-likelihood function faster by only evaluating it (and its autodiffed gradient) a limited number of times and thereafter relying on interpolation rather than evalu-
ation to yield the value of the log-likelihood function (and its gradient) at a new point. In this talk, I will report on the progress made thus far. In theory, it is
possible to interpolate any continuous function, including a log-likelihood, that is defined on the unit hypercube, which can usually be achieved by reparameterizing
a Stan program so that the parameters block only contains a vector of cumulative probabilities on [−1, 1] that are mapped to the substantive parameters in the trans-
formed parameters block using the quantile function of the prior distributions for the substantive parameters. The theory that supports interpolation of a function
on the unit hypercube was established by Kolmogorov in 1963 and enhanced by other mathematicians in the following decade, but only in the past five years have
researchers come close to implementing these ideas in floating-point software with sufficiently smooth functions. We have derived a candidate function for the critical
component of Kolmogorov’s theory that is numerically accurate and are working toward proving that it is, in fact, admissible.

**Bayesian analysis of brain oscillation phase data in Stan**\
Sydney Dimmock (University of Bristol)\
**Abstract**: Electroencephalography and magnetoencephalography recordings are non-invasive and temporally precise, making them invaluable tools in the investigation of neural responses in humans. However, these recordings are noisy, both because the neuronal electrodynamics involved produces a muffled signal and because the neuronal processes of interest compete with numerous other processes, from blinking to day-dreaming. One fruitful response to this noisiness has been to use stimuli with a specific frequency and to look for the signal of interest in the response at that frequency. Typically this signal involves measuring the coherence of response phase: here a Bayesian approach to measuring phase coherence is described. This Bayesian approach is illustrated using an example from neurolinguistics and is more descriptive and more data-efficient than the traditional statistical approaches.

**Incidences of Early Life Immune System and Neurodevelopmental Disorders are Linked with Peri- and Postpartum Health Factors**\
Yanan Long (University of Chicago)\
**Abstract**: In this work, we demonstrate how to use Stan/brms to estimate Bayesian models for studying the relationship between exogenous factors  and early-life health outcomes such as immune system disorders and neurodevelopemental disorders, using a very large healthcare insurance dataset from 2003-2011. As part of the study, we also showcase a custom extension to brms enabling the estimation of cure models, which are a class of survival (time-to-event) models that include a fraction of the population not experiencing the event.

**Estimating Tumor Growth/Inhibition Dynamics from Published Progression-Free Survival Curves Using a Bayesian Generative Approach**\
Arya Pourzanjani (Amgen)\
**Abstract**: Mechanistic modeling of tumor growth/inhibition dynamics is crucial for early decision making in oncology drug development because of its ability to quantify and predict efficacy across various drug treatments as well as various dosing regimens of the same drug. Unfortunately, the scope of such models is limited by data sparsity and lack of control subjects in early oncology data. Although longitudinal tumor size data from historical trials is rarely publicly available, progression-free survival (PFS) curves are directly derived from longitudinal tumor size data and have become ubiquitous in the published literature on historical trials due to the increasing use of PFS as a primary endpoint in clinical trials. We utilize this relationship between PFS curves and longitudinal tumor size measurements to create a Bayesian generative model of PFS curves to estimate underlying tumor growth/inhibition dynamics from published literature. The model accounts for both response and non-target progression in the data-generating process to more accurately estimate underlying tumor dynamics in a range of historical studies regardless of their outcome. Our approach allows for more stable estimation of tumor in dynamics in early oncology trials as well as the comparison of early-stage therapies to published standards of care.

**It Pays to be Bayes: On Creating Investment-grade Securities out of Pure Insurance Risk**\
Nathaniel Haines (Ledger Investing)\
**Abstract**: At Ledger Investing, we securitize insurance risk, which appeals to investors because these securities are uncorrelated with most other asset classes. For context, insurers allow insured parties to trade the possibility of experiencing a risky, high severity loss for a certain, low severity premium. We define the loss ratio as the ratio of money paid to settle claims for a pool of policies to the premium collected on those policies; our goal is to forecast loss ratios for pools of policies that have not yet been written. We then use such forecasted loss ratios to help the insurer and investor agree on a price. Notably, the data-generating process underlying the loss ratio for a given time period is quite complicated. Claims are often not reported for months or years, and they may take years more to settle. As a result, loss ratios for recent time periods have not yet reached their ultimate state. Further, the pool of policies written by an insurer and premiums charged is in constant flux due to market demands. In this talk, we illustrate how our Bayesian workflow tackles these complexities by using: (1) theoretically informed time-series and state-space models to capture how loss ratios develop and change over time; (2) historic industry data to inform prior distributions of models fit to individual programs; and (3) hierarchical stacking to combine loss ratio predictions from candidate models.

**Gaussian Processes and bayesian modeling for stellar research**\
Sabina Sagynbayeva (Stony Brook University)\
**Abstract**: The wealth of data from the Kepler telescope made it possible to study planets orbiting other stars (exoplanets) and exoplanets-hosting stars. Many of the light curves that we get from Kepler or TESS are variable, often due to star spots, and other surface features that rotate into and out of view over the course of a stellar rotation. Using multiple light curves from Kepler, we are interested in mapping the surface of the star HAT-P-11 using the planet that's orbiting it. Even though the stars are unresolved, we can in principle use their light curves to learn about what their surfaces look like by understanding the physical parameters of starspots, because we have the data for the planet crossing the starspots while orbiting the star and blocking its brightness (transits). This can be efficiently done using hierarchical Bayesian modeling treating the starspots as a statistical population and using the exoplanet to put constraints on our statistical model. We are considering the properties of the starspots as hyperparameters of our Gaussian Process (GP) model with a quasi-periodic kernel. 
