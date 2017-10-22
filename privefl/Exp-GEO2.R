library(GEOquery)

gds <- getGEO("GDS3795")
str(gds)
format(object.size(gds), units = "MB")
tab <- gds@dataTable@table
format(object.size(tab), units = "MB")

gds@header$sample_count
dim(tab)
names(tab)

test <- t(tab[-(1:2)])
dim(test)
format(object.size(test), units = "MB")
summary(as.vector(test))
ind.keep <- which(colSums(is.na(test)) == 0)

library(bigstatsr)
system.time(
  svd <- svd(scale(test[, ind.keep]), nu = 10, nv = 10)
)
plot(svd$u)

test2 <- big_copy(test[, ind.keep])
system.time(
  svd2 <- big_SVD(test2, big_scale(), k = 10)
)
plot(svd2)
plot(svd2, type = "scores")

test3 <- big_copy(test, type = "integer")
system.time(
  svd3 <- big_SVD(test3, big_scale(), k = 10)
)
plot(svd3)
plot(svd3, type = "scores")
