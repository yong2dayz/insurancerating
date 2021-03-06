% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_normality.R
\name{check_normality}
\alias{check_normality}
\title{Check model for (non-)normality of residuals (deprecated function; use 'check_residuals()' instead)}
\usage{
check_normality(object, simulate_residuals = TRUE, n_simulations = 20)
}
\arguments{
\item{object}{a model object.}

\item{simulate_residuals}{create scaled residuals by simulating from the fitted model}

\item{n_simulations}{number of simulations (defaults to 20)}
}
\value{
Invisibly returns the p-value of the test statistics. A p-value < 0.05 indicates a significant deviation from normal distribution
}
\description{
Check model for (non-)normality of residuals.
}
\details{
\code{check_normality()} calls \code{\link[stats]{shapiro.test}}
and checks the standardized residuals for normal distribution. Note that
this formal test almost always yields significant results for the distribution
of residuals and visual inspections (e.g. Q-Q plots) are preferable.
Normality of deviance residuals is in general not expected under a Poisson;
and seeing deviance residuals (or any other standard residuals) that differ
from a straight line in a qqnorm plot is therefore in general no concern at all.
For large counts, QQ is approximately normally distributed, which is expected as
the Poisson approaches normality for large means. For small counts, there is a
notable deviation from normality.

As explained in the vignette of \href{https://CRAN.R-project.org/package=DHARMa}{DHARMa},
neither deviance nor Pearson residuals are ideal for diagnosing Poisson models,
as they will appear visually inhomogeneous for low count rates, even if the model is entirely correct.
Instead, you can use \code{simulate_residuals = TRUE}, which implements the idea of randomized quantile residuals
by Dunn and Smyth (1996). This approach is adopted from DHARMa::simulateResiduals.
}
\examples{

\dontrun{
m1 <- lm(mpg ~ wt + cyl + gear + disp, data = mtcars)
check_normality(m1)

m1_norm <- check_normality(m1)
# QQ-plot
autoplot(m1_norm)

# Density plot
autoplot(m1_norm, type = "density")
}

}
\references{
Dunn, K. P., and Smyth, G. K. (1996). Randomized quantile residuals. Journal of Computational and Graphical Statistics 5, 1-10.

Gelman, A. & Hill, J. Data analysis using regression and multilevel/hierarchical models Cambridge University Press, 2006
}
\author{
Martin Haringa
}
