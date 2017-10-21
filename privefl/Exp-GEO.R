library(GEOquery)

gds <- getGEO("GDS3929")
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

library(bigstatsr)
system.time(
  svd <- svd(scale(test), nu = 10, nv = 10)
)
plot(svd$u)

test2 <- big_copy(test)
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


test4 <- test[rep(rows_along(test), 20), ]
dim(test4)
system.time(
  svd4 <- svd(scale(test4), nu = 10, nv = 10)
)
plot(svd4$u)

test5 <- big_copy(test4)
system.time(
  svd5 <- big_SVD(test5, big_scale(), k = 10)
)
plot(svd5, type = "scores")

system.time(
  svd6 <- big_randomSVD(test5, big_scale(), k = 10)
)
plot(svd6, type = "scores")
