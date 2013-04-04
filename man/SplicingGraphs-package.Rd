\name{SplicingGraphs-package}
\docType{package}

\alias{SplicingGraphs-package}

\title{
  Creation, manipulation, visualization of splicing graphs
}

\description{
  The SplicingGraphs package allows the user to create, manipulate, and
  visualize splicing graphs and their bubbles based on a gene model for
  a given organism. Additionally it allows the user to assign RNA-seq
  reads to the edges of a set of splicing graphs, and to summarize them.
}

\details{
  TODO
}

\author{
  SplicingGraphs is a reincarnation of an internal project, the SpliceGraph
  package, originally written by D. Bindreither, M. Carlson, and M. Morgan.
  The SpliceGraph package was never released as part of Bioconductor.

  The SplicingGraphs package is a complete revamp (design and implementation)
  of the SpliceGraph package, and was written by H. Pages.

  Maintainer: H. Pages <hpages@fhcrc.org>
}

\references{
  Heber, S., Alekseyev, M., Sze, S., Tang, H., and Pevzner, P. A. 
  \emph{Splicing graphs and EST assembly problem}
  Bioinformatics
  Date: Jul 2002
  Vol: 18
  Pages: S181-S188

  Sammeth, M. (2009) 
  \emph{Complete Alternative Splicing Events Are Bubbles in Splicing Graphs}
  J. Comput. Biol.
  Date: Aug 2009
  Vol: 16
  Pages: 1117-1140
}

\seealso{
  The man pages in the SplicingGraphs package are:
  \enumerate{
    \item The \link{SplicingGraphs} class.

    \item \code{\link{plotTranscripts}} for plotting a set of transcripts
          along genomic coordinates.

    \item \code{\link{sgedgesByGene}} for extracting all the edges and
          ranges from a SplicingGraphs object.

    \item \code{\link{txpath}} for extracting the transcript paths of a
          splicing graph.

    \item \code{\link{sgedges}} for extracting the edges (and nodes) of a
          splicing graph.

    \item \code{\link{sgraph}} for extracting a splicing graph as a
          plottable graph-like object.

    \item \code{\link{bubbles}} for computing the bubbles of a splicing graph.

    \item \code{\link{countReads}} for assigning reads to the edges of a
          SplicingGraphs object and summarizing them.

    \item \code{\link{toy_genes_gff}} for details about the toy data included
          in this package.
  }
}

\keyword{package}