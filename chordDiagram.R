require(circlize)
require(readr)
# By @biomedical_informatics Edris Sharif Rahmani, March 7, 2023
load("my_col.RData")
mat <- data.frame(read_csv("chord.csv"))
rownames(mat) <- mat[,1]
mat <- as.matrix(mat[,-1])
name_colums <- colnames(mat)
col_name_colums <- my_col[1:length(name_colums)]
names(col_name_colums) <- name_colums
name_rows <- rownames(mat)
col_name_rows <- my_col[(length(name_colums) + 1):(length(name_rows) + length(name_colums))]
names(col_name_rows) <- col_name_rows
nameslist <- c(colnames(mat),rownames(mat))
names(my_col) <- nameslist 
chordDiagram(mat, annotationTrack = c("grid", "axis"),
             grid.col = my_col,
             preAllocateTracks = list(
               track.height = uh(4, "mm"),
               track.margin = c(uh(4, "mm"), 0)),
             link.sort = TRUE, 
             link.decreasing = TRUE,directional = 1, 
             direction.type = c("diffHeight", "arrows"),
             link.arr.type = "big.arrow")
legend(x = "topleft",
       inset = c(0.01,0),
       title = "Plasmid Families",
       legend = factor(rownames(mat)),
       col = col_name_rows,
       box.lty = 0,
       pch = 19,
       xpd = TRUE)
legend(x = "topright",
       inset = c(.1,0),
       title = "STs",
       legend = factor(colnames(mat)),
       col = col_name_colums,
       box.lty = 0,
       pch = 19,
       xpd = TRUE)