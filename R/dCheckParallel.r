#' Function to check whether parallel computing should be used and how
#'
#' \code{dCheckParallel} is used to check whether parallel computing should be used and how
#'
#' @param multicores an integer to specify how many cores will be registered as the multicore parallel backend to the 'foreach' package. If NULL, it will use a half of cores available in a user's computer
#' @param verbose logical to indicate whether the messages will be displayed in the screen. By default, it sets to true for display
#' @return TRUE for using parallel computing; FALSE otherwise
#' @note
#' Whether parallel computation with multicores is used is system-specific (now only Linux or Mac OS). Also, it will depend on whether these two packages "foreach" and "doMC" have been installed. It can be installed via: \code{source("http://bioconductor.org/biocLite.R"); biocLite(c("foreach","doMC"))}.
#' @export
#' @seealso \code{\link{dRWR}}, \code{\link{dRWRcontact}}, \code{\link{dRWRpipeline}}, \code{\link{dDAGtermSim}}, \code{\link{dDAGgeneSim}}
#' @include dCheckParallel.r
#' @examples
#' dCheckParallel(multicores=2)

dCheckParallel <- function (multicores=NULL, verbose=T)
{
    
    # @import doMC
    # @import foreach
    
    flag_parallel <- F
    if (requireNamespace("doMC", quietly=T) & requireNamespace("foreach", quietly=T)) {
        if(1){
            doMC::registerDoMC()
            cores <- foreach::getDoParWorkers()
            if(is.null(multicores)){
                multicores <- max(1, ceiling(cores*0.5))
            }else if(is.na(multicores)){
                multicores <- max(1, ceiling(cores*0.5))
            }else if(multicores < 1 | multicores > cores){
                multicores <- max(1, ceiling(cores*0.5))
            }else{
                multicores <- as.integer(multicores)
            }
            doMC::registerDoMC(multicores) # register the multicore parallel backend with the 'foreach' package
            
            if(verbose){
                message(sprintf("\tdo parallel computation using %d cores ...", multicores, as.character(Sys.time())), appendLF=T)
            }
            flag_parallel <- T
        }
    }

    if(0){
    flag_parallel <- F
    pkgs <- c("doMC","foreach")
    if(any(pkgs %in% rownames(installed.packages()))){
        tmp <- sapply(pkgs, function(pkg) {
            suppressPackageStartupMessages(require(pkg, character.only=T))
        })
        if(all(tmp)){
            doMC::registerDoMC()
            cores <- foreach::getDoParWorkers()
            if(is.null(multicores)){
                multicores <- max(1, ceiling(cores*0.5))
            }else if(is.na(multicores)){
                multicores <- max(1, ceiling(cores*0.5))
            }else if(multicores < 1 | multicores > cores){
                multicores <- max(1, ceiling(cores*0.5))
            }else{
                multicores <- as.integer(multicores)
            }
            doMC::registerDoMC(multicores) # register the multicore parallel backend with the 'foreach' package
            
            if(verbose){
                message(sprintf("\tdo parallel computation using %d cores ...", multicores, as.character(Sys.time())), appendLF=T)
            }
            flag_parallel <- T
        }
    }
    }
    
    return(flag_parallel)
}