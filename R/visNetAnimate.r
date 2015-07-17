#' Function to animate the same graph but with multiple graph node colorings according to input data matrix
#'
#' \code{visNetAnimate} is supposed to animate the same graph but with multiple colorings according to input data matrix. The output can be a pdf file containing a list of frames/images, a mp4 video file or a gif file. To support video output file, the software 'ffmpeg' must be first installed (also put its path into the system PATH variable; see Note). To support gif output file, the software 'ImageMagick' must be first installed (also put its path into the system PATH variable; see \url{http://www.imagemagick.org/script/binary-releases.php}).
#'
#' @param g an object of class "igraph" or "graphNEL"
#' @param data an input data matrix used to color-code vertices/nodes. One column corresponds to one graph node coloring. The input matrix must have row names, and these names should include all node names of input graph, i.e. V(g)$name, since there is a mapping operation. After mapping, the length of the patern vector should be the same as the number of nodes of input graph. The way of how to color-code is to map values in the pattern onto the whole colormap (see the next arguments: colormap, ncolors, zlim and colorbar)
#' @param filename the without-extension part of the name of the output file. By default, it is 'visNetAnimate'
#' @param filetype the type of the output file, i.e. the extension of the output file name. It can be one of either 'pdf' for the pdf file, 'mp4' for the mp4 video file, 'gif' for the gif file
#' @param num.frame a numeric value specifying the number of frames/images. By default, it sets to the number of columns in the input data matrix
#' @param sec_per_frame a numeric value specifying how long (seconds) it takes to stream a frame/image. This argument only works when producing mp4 video or gif file.
#' @param height.device a numeric value specifying the height (or width) of device/frame/image.
#' @param margin margins as units of length 4 or 1
#' @param border.color the border color of each figure
#' @param colormap short name for the colormap. It can be one of "jet" (jet colormap), "bwr" (blue-white-red colormap), "gbr" (green-black-red colormap), "wyr" (white-yellow-red colormap), "br" (black-red colormap), "yr" (yellow-red colormap), "wb" (white-black colormap), and "rainbow" (rainbow colormap, that is, red-yellow-green-cyan-blue-magenta). Alternatively, any hyphen-separated HTML color names, e.g. "blue-black-yellow", "royalblue-white-sandybrown", "darkgreen-white-darkviolet". A list of standard color names can be found in \url{http://html-color-codes.info/color-names}
#' @param ncolors the number of colors specified over the colormap
#' @param zlim the minimum and maximum z/patttern values for which colors should be plotted, defaulting to the range of the finite values of z. Each of the given colors will be used to color an equispaced interval of this range. The midpoints of the intervals cover the range, so that values just outside the range will be plotted
#' @param colorbar logical to indicate whether to append a colorbar. If pattern is null, it always sets to false
#' @param colorbar.fraction the relative fraction of colorbar block against the figure block
#' @param glayout either a function or a numeric matrix configuring how the vertices will be placed on the plot. If layout is a function, this function will be called with the graph as the single parameter to determine the actual coordinates. This function can be one of "layout.auto", "layout.random", "layout.circle", "layout.sphere", "layout.fruchterman.reingold", "layout.kamada.kawai", "layout.spring", "layout.reingold.tilford", "layout.fruchterman.reingold.grid", "layout.lgl", "layout.graphopt", "layout.svd" and "layout.norm". A full explanation of these layouts can be found in \url{http://igraph.org/r/doc/layout_nicely.html}
#' @param glayout.dynamics logical to indicate whether graph layout should be dynamic. By default, it always sets to false. If YES, the Fruchterman-Reingold layout algorithm \url{http://igraph.org/r/doc/layout_with_fr.html} will be used to stimulate the dynamic layout 
#' @param mtext.side on which side of the mtext plot (1=bottom, 2=left, 3=top, 4=right)
#' @param mtext.adj the adjustment for mtext alignment (0 for left or bottom alignment, 1 for right or top alignment)
#' @param mtext.cex the font size of mtext labels
#' @param mtext.font the font weight of mtext labels
#' @param mtext.col the color of mtext labels
#' @param ... additional graphic parameters. See \url{http://igraph.org/r/doc/plot.common.html} for the complete list.
#' @return 
#' If specifying the output file name (see argument 'filename' above), the output file is either 'filename.pdf' or 'filename.mp4' in the current working directory. If no output file name specified, by default the output file is either 'visNetAnimate.pdf' or 'visNetAnimate.mp4'
#' @note When producing mp4 video, this function requires the installation of the software 'ffmpeg' at \url{https://www.ffmpeg.org}. Assuming you have a ROOT (sudo) privilege, shell command lines for ffmpeg installation in Terminal (for both Linux and Mac) are:
#' \cr
#' wget http://www.ffmpeg.org/releases/ffmpeg-2.7.1.tar.gz
#' \cr
#' tar xvfz ffmpeg-2.7.1.tar.gz
#' \cr
#' cd ffmpeg-2.7.1
#' \cr
#' ./configure --disable-yasm
#' \cr
#' make
#' \cr
#' make install
#' \cr
#' ffmpeg -h
#' # Installation without Root privilege, please replace with:
#' ./configure --disable-yasm --prefix=$HOME/ffmpeg-2.7.1
#' # Also add the system PATH variable to your ~/.bash_profile file
#' export PATH=$HOME/ffmpeg-2.7.1:$PATH
#' @export
#' @seealso \code{\link{visNetMul}}
#' @include visNetAnimate.r
#' @examples
#' \dontrun{
#' # 1) generate a random graph according to the ER model
#' g <- erdos.renyi.game(100, 1/100)
#'
#' # 2) produce the induced subgraph only based on the nodes in query
#' subg <- dNetInduce(g, V(g), knn=0)
#'
#' # 3) visualise the module with vertices being color-coded by scores
#' nnodes <- vcount(subg)
#' nsamples <- 10
#' data <- matrix(runif(nnodes*nsamples), nrow=nnodes, ncol=nsamples)
#' rownames(data) <- V(subg)$name
#' # output as a pdf file
#' visNetAnimate(g=subg, data=data, filetype="pdf")
#' # output as a mp4 file
#' visNetAnimate(g=subg, data=data, filetype="mp4")
#' # output as a mp4 file but with dynamic layout
#' visNetAnimate(g=subg, data=data, filetype="mp4", glayout.dynamics=TRUE)
#' }

visNetAnimate <- function (g, data, filename="visNetAnimate", filetype=c("pdf", "mp4", "gif"), num.frame=ncol(data), sec_per_frame=1, height.device=7, margin=rep(0.1,4), border.color="#EEEEEE", colormap=c("bwr","jet","gbr","wyr","br","yr","rainbow","wb"), ncolors=40, zlim=NULL, colorbar=T, colorbar.fraction=0.25, glayout=layout.fruchterman.reingold, glayout.dynamics=F, mtext.side=3, mtext.adj=0,mtext.cex=1,mtext.font=2,mtext.col="black", ...)
{

    ## check input graph
    if(class(g)=="graphNEL"){
        ig <- igraph.from.graphNEL(g)
    }else{
        ig <- g
    }
    if (class(ig) != "igraph"){
        stop("The function must apply to either 'igraph' or 'graphNEL' object.\n")
    }
    if(is.null(V(ig)$name)){
        V(ig)$name <- as.character(V(ig))
    }

    ## check input data
    if(is.matrix(data) | is.data.frame(data) | is.vector(data)){
        data <- as.matrix(data)
    }else if(is.null(data)){
        stop("The input data must be not NULL.\n")
    }

    if(is.null(rownames(data))) {
        stop("The function must require the row names of the input data.\n")
    }else if(any(is.na(rownames(data)))){
        warning("Data with NA as row names will be removed")
        data <- data[!is.na(rownames(data)),]
    }
    cnames <- colnames(data)
    if(is.null(cnames)){
        cnames <- seq(1,ncol(data))
    }
    
    ## check mapping between input data and graph
    ind <- match(rownames(data), V(ig)$name)
    nodes_mapped <- V(ig)$name[ind[!is.na(ind)]]
    if(length(nodes_mapped)!=vcount(ig)){
        stop("The function must require that the row names of input data could all be mapped onto the input graph.\n")
    }
    data <- as.matrix(data[nodes_mapped,])
    
    ## determine the color range
    vmin <- floor(stats::quantile(data, 0.05))
    vmax <- ceiling(stats::quantile(data, 0.95))
    if(vmin < 0 & vmax > 0){
        vsym <- abs(min(vmin, vmax))
        vmin <- -1*vsym
        vmax <- vsym
    }
    if(!is.null(zlim)){
        if(zlim[1] < floor(min(data)) | zlim[2] > ceiling(max(data))){
            #zlim <- c(vmin,vmax)
        }
    }else{
        zlim <- c(vmin,vmax)
    }
    
    ######################################################################################    
    ######################################################################################
    if(is.function(glayout)){
        glayout_fix <- glayout(ig)
    }else{
        glayout_fix <- glayout
    }
    layout.old <- glayout_fix
    
    filetype <- match.arg(filetype)
    if(is.null(filename)){
        outputfile <- paste("visNetAnimate", filetype, sep=".")
    }else{
        outputfile <- paste(filename, filetype, sep=".")
    }

    if(filetype=="pdf"){
        
        if(height.device>100){
            height.device <- ceiling(height.device/100)
        }
        grDevices::pdf(outputfile, width=height.device, height=height.device)
        for(t in seq(from=1, to=ncol(data), length.out=num.frame)){
            k <- floor(t)
            d <- as.matrix(data[,k])
            colnames(d) <- cnames[k]
            rownames(d) <- rownames(data)
            
            if(glayout.dynamics){
				#layout.new <- layout.fruchterman.reingold(ig, params=list(niter=10, maxdelta=2, start=layout.old, weights=E(ig)$weight))
				layout.new <- layout_with_fr(ig, niter=50, coords=layout.old, weights=E(ig)$weight)
            }else{
            	layout.new <- layout.old
            }
            
            visNetMul(g=ig, data=d, margin=margin, colormap=colormap, ncolors=ncolors, zlim=zlim, colorbar=colorbar, colorbar.fraction=colorbar.fraction, newpage=F, glayout=layout.new, mtext.side=mtext.side, mtext.adj=mtext.adj, mtext.cex=mtext.cex, mtext.font=mtext.font, mtext.col=mtext.col, ...)
            
            layout.old <- layout.new
        }
        grDevices::dev.off()
        
        if(file.exists(file.path(getwd(), outputfile))){
            message(sprintf("Congratulations! A file '%s' (in the directory %s) has been created!", outputfile, getwd()), appendLF=T)
        }
        
        invisible()
        
    }else if(filetype=="mp4" | filetype=="gif"){
        
        ## num.frame: how many frames in total
        ## sec_per_frame: seconds per frame
        ## frame_per_sec: frames per second
        frame_per_sec <- 1/sec_per_frame
        
        #layout.old <- layout.fruchterman.reingold(ig)
        layout.old <- layout_with_fr(ig)
        
        ## specify the temporary png files
        tdir <- tempdir()
        png_files <- file.path(tdir, "Rplot%06d.png")
        
        ## remove the existing temporary png files
        unlink(file.path(tdir, "Rplot*.png"), recursive=T, force=T)
        unlink(file.path(tdir, outputfile), recursive=T, force=T)
        
        if(height.device<10){
            height.device <- ceiling(height.device*100)
        }
        grDevices::png(png_files, width=height.device, height=height.device)
        for(t in seq(from=1, to=ncol(data), length.out=num.frame)){
            k <- floor(t)
            d <- as.matrix(data[,k])
            colnames(d) <- cnames[k]
            
            if(glayout.dynamics){
				#layout.new <- layout.fruchterman.reingold(ig, params=list(niter=10, maxdelta=2, start=layout.old, weights=E(ig)$weight))
				layout.new <- layout_with_fr(ig, niter=50, coords=layout.old, weights=E(ig)$weight)
            }else{
            	layout.new <- layout.old
            }
            
            #visNetMul(g=ig, data=d, margin=margin, colormap=colormap, ncolors=ncolors, zlim=zlim, colorbar=colorbar, colorbar.fraction=colorbar.fraction, newpage=F, glayout=layout.new, mtext.side=mtext.side, mtext.adj=mtext.adj, mtext.cex=mtext.cex, mtext.font=mtext.font, mtext.col=mtext.col,...)
            visNetMul(g=ig, data=d, margin=margin, colormap=colormap, ncolors=ncolors, zlim=zlim, colorbar=colorbar, colorbar.fraction=colorbar.fraction, newpage=F, glayout=layout.new, mtext.side=mtext.side, mtext.adj=mtext.adj, mtext.cex=mtext.cex, mtext.font=mtext.font, mtext.col=mtext.col)
            
            layout.old <- layout.new
        }
        grDevices::dev.off()
        
        if(filetype=="mp4"){        
			ffmpeg <- paste("ffmpeg -y -v quiet -r", frame_per_sec, "-i", png_files, "-q:v 1", file.path(tdir, outputfile))
			message(sprintf("Executing this ...\n\t%s", ffmpeg), appendLF=T)
			cmd <- try(system(ffmpeg), silent=TRUE)
		}else if(filetype=="gif"){
			convert <- paste("convert -delay 100", png_files, file.path(tdir, outputfile))
			message(sprintf("Executing this ...\n\t%s", convert), appendLF=T)
			cmd <- try(system(convert), silent=TRUE)
		}
		
        if(cmd==0){
            if(file.exists(file.path(tdir, outputfile))){
                file.copy(from=file.path(tdir, outputfile), to=outputfile, overwrite=T, recursive=F, copy.mode=T)
                message(sprintf("Congratulations! A file '%s' (in the directory %s) has been created!", outputfile, getwd()), appendLF=T)
            }
        }else{
            stop("Unfortunately, fail to produce the file. Please install ffmpeg or ImageMagick first. Also make sure its path being put into the system PATH variable (see Help). Alternatively, produce the pdf file instead\n")
        }

        invisible(cmd)
    }
    
}
