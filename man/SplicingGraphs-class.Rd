\name{SplicingGraphs-class}

\alias{class:SplicingGraphs}
\alias{SplicingGraphs-class}
\alias{SplicingGraphs}

\alias{length,SplicingGraphs-method}
\alias{names,SplicingGraphs-method}
\alias{elementLengths,SplicingGraphs-method}
\alias{show,SplicingGraphs-method}


\title{
  SplicingGraphs objects
}

\description{
  The SplicingGraphs class is a container for splicing graphs created from
  transcript annotations.
}

\usage{
SplicingGraphs(exbytx, grouping=NULL, check.introns=TRUE)

## Basic accessors:

\S4method{length}{SplicingGraphs}(x)
\S4method{names}{SplicingGraphs}(x)
\S4method{elementLengths}{SplicingGraphs}(x)
}

\arguments{
  \item{exbytx}{
    A \link[GenomicRanges]{GRangesList} object containing the exons of one
    or more genes grouped by transcripts. See Details section below.
  }
  \item{grouping}{
    An optional object that represents the grouping by gene of the top-level
    elements (i.e. the transcripts) in \code{exbytx}. See Details section
    below.
  }
  \item{check.introns}{
    TODO
  }
  \item{x}{
    TODO
  }
}

\details{
  \code{exbytx} must be a \link[GenomicRanges]{GRangesList} object
  containing the exons of one or more genes grouped by transcripts. More
  precisely, each top-level element in \code{exbytx} contains the genomic
  ranges of the exons for a particular transcript. Typically \code{exbytx}
  will be obtained from a \link[GenomicFeatures]{TranscriptDb} object
  \code{txdb} with \code{\link[GenomicFeatures]{exonsBy}(txdb, by="tx")}.

  \code{grouping} is an optional object that represents the grouping by gene
  of the top-level elements (i.e. the transcripts) in \code{exbytx}. It can
  be either:
  \itemize{
    \item Missing (i.e. \code{NULL}). In that case, all the transcripts in
          \code{exbytx} are considered to belong to the same gene and the
          SplicingGraphs object returned by \code{SplicingGraphs} will be
          unnamed.
    \item A list of integer or character vectors, or an
          \link[IRanges]{IntegerList}, or a \link[IRanges]{CharacterList}
          object, of length the number of genes to process, and where
          \code{grouping[[i]]} is a vector of valid subscripts in
          \code{exbytx} pointing to all the transcripts of the i-th gene.
    \item A factor, character vector, or integer vector, of the same length
          as \code{exbytx} and 1 level per gene.
    \item A named \link[GenomicRanges]{GRangesList} object containing
          transcripts grouped by genes i.e. each top-level element in
          \code{grouping} contains the genomic ranges of the transcripts
          for a particular gene. In that case, the grouping is inferred from
          the tx_id (or alternatively tx_name) metadata column of
          \code{unlist(grouping)} and all the values in that column must
          be in \code{names(exbytx)}.
          If \code{exbytx} was obtained with
          \code{\link[GenomicFeatures]{exonsBy}(txdb, by="tx")},
          then the \link[GenomicRanges]{GRangesList} object used for grouping
          would typically be obtained with
          \code{\link[GenomicFeatures]{transcriptsBy}(txdb, by="gene")}.
    \item A data.frame or \link[IRanges]{DataFrame} with 2 character vector
          columns: a gene_id column (factor, character vector, or integer
          vector), and a tx_id (or alternatively tx_name) column. In that
          case, \code{exbytx} must be named and all the values in the tx_id
          (or tx_name) column must be in \code{names(exbytx)}.
  }
}

\value{
  TODO
}

\author{
  H. Pages
}

\references{
  Heber, S., Alekseyev, M., Sze, S., Tang, H., and Pevzner, P. A. 
  \emph{Splicing graphs and EST assembly problem}
  Bioinformatics
  Date: Jul 2002
  Vol: 18
  Pages: S181-S188

  Sammeth, M. (2009) 
  \emph{Complete alternative splicing events are bubbles in splicing graphs}
  J. Comput. Biol.
  Date: Aug 2009
  Vol: 16
  Pages: 1117-1140
}

\seealso{
  \itemize{
    \item \code{\link[GenomicFeatures]{exonsBy}},
          \code{\link[GenomicFeatures]{transcriptsBy}}, and the
          \link[GenomicFeatures]{TranscriptDb} class in the GenomicFeatures
          package.

    \item The \link[GenomicRanges]{GRangesList} class in the GenomicRanges
          package.

    \item The \link[IRanges]{IntegerList}, \link[IRanges]{CharacterList},
          and \link[IRanges]{DataFrame} classes in the IRanges package.

    \item \code{\link{sgdf}} and \code{\link{sgraph}} for extracting
          a splicing graph as a data frame or as a plottable graph-like
          object.
  }
}

\examples{
## ---------------------------------------------------------------------
## 1. Load a toy gene model as a TranscriptDb object
## ---------------------------------------------------------------------

library(GenomicFeatures)
suppressWarnings(
  toy_genes_txdb <- makeTranscriptDbFromGFF(toy_genes_gff())
)

## ---------------------------------------------------------------------
## 2. Compute all the splicing graphs (1 graph per gene) into a single
##    GRangesList object
## ---------------------------------------------------------------------

## Extract the exons grouped by transcript:
ex_by_tx <- exonsBy(toy_genes_txdb, by="tx", use.names=TRUE)

## Extract the transcripts grouped by gene:
tx_by_gn <- transcriptsBy(toy_genes_txdb, by="gene")

sg <- SplicingGraphs(ex_by_tx, tx_by_gn)
## Note that 'sg' can also be created directly from the
## TranscriptDb object:
#sg <- SplicingGraphs(toy_genes_txdb)  # not ready yet
sg

## 'sg' has 1 element per transcript, and each transcript is
## assigned a name that is the id of the gene it belongs to. All the
## transcripts belonging to the same gene are guaranteed to be
## consecutive elements in 'sg'.
names(sg)

## ---------------------------------------------------------------------
## 3. Extract information from the SplicingGraphs object
## ---------------------------------------------------------------------

if (FALSE) {
  ## FIXME: All the stuff below is broken!
  ## get the new disjoint exon ids
  mcols(unlist(sgA))$disJ_exon_id

  ## get the gene ids
  mcols(sgA)$gene_id

  ## get the original exon ids
  mcols(unlist(sgA))$exon_ids

  ## access the splicing events via the metadata slot
  spliceEvents <- metadata(sgA)$spliceEvents
  spliceEvents

  ## count the splicing events
  table(spliceEvents$eventType)

  ## assignment of edges to bubbles
  mcols(sgA)
}
}