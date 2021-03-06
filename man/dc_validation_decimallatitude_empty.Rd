% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dc_validation_decimallatitude_empty.R,
%   R/documentation_validation_decimallatitude_empty.R
\name{dc_validation_decimallatitude_empty}
\alias{dc_validation_decimallatitude_empty}
\title{Data check validation_decimallatitude_empty Check if decimalLatitude exists and is not empty.}
\format{An object of class function to perform a specific data check.}
\usage{
dc_validation_decimallatitude_empty(TARGET = NULL)
}
\arguments{
\item{TARGET}{a vector of decimallatitude information. To pass it must be
non-empty entry.}
}
\description{
This data check answers: "Is decimalLatitude information present?" question.\cr Data check will pass if \strong{The value for decimalLatitude is present.} and will fail if \strong{The value for decimalLatitude is missing.}.\cr Dimension of this data check is \strong{} and it's flagging type is: \strong{FLAG}\cr Example of entries that will pass: \code{decimalLatitude=-41.0983423}, such data check would return \code{TRUE}.\cr Example of entries that will fail: \code{decimalLatitude=}, such data check would return \code{FALSE}.
}
\section{samplePassData}{

The value for decimalLatitude is present.
}

\section{sampleFailData}{

The value for decimalLatitude is missing.
}

\section{targetDWCField}{

decimalLatitude
}

\section{checkCategory}{

 location
}

\examples{
perform_dc(data_bats, 'validation_decimallatitude_empty')
}
\references{
None
}
\keyword{location,validation,completeness,missing,incomplete}
