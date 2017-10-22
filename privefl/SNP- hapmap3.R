library(bigsnpr)

tmpfile <- tempfile()
base <- paste0(
  "https://github.com/gabraham/flashpca/raw/master/",
  "HapMap3/1kg.ref.phase1_release_v3.20101123_thinned_autosomal_overlap")
exts <- c(".bed", ".bim", ".fam")
download.file(paste0(base, exts), paste0(tmpfile, exts))

rdsfile <- snp_readBed(paste0(tmpfile, ".bed"), tempfile())

hapmap3 <- snp_attach(rdsfile)
G <- hapmap3$genotypes
object.size(G)
class(G)

G.matrix <- G[]
format(object.size(G.matrix), units = "MB")

system.time(
  svd <- svd(scale(G[]), nu = 10, nv = 10)
)
plot(svd$u)

system.time(
  svd2 <- big_SVD(G, big_scale(), k = 10)
)
plot(svd2)
plot(svd2, type = "scores")

