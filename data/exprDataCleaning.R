### Load my packages

library(magrittr)
library(bigsnpr)

#### First, we will create the gene expression matrix from all people...
# Assumption: All probes are identical for each dataset, and arranging the datasets by Normalization REF will out the DFs in the same order.

exprData <- Sys.glob("./data/E-MTAB-264.processed.1/*.txt") %>%
	purrr::map(fread) %>%
	purrr::map(dplyr::arrange, `Normalization REF`) %>% 
	dplyr::bind_cols() 

### Remove the duplicate columns, which is the Normalization REF...

exprData %<>% dplyr::select(-dplyr::matches("Normalization REF[0-9]+"))	
	
### Now lets read in the SNP data....

tmpfile <- tempfile()
base <- paste0(
	"https://github.com/gabraham/flashpca/raw/master/HapMap3/",
	"1kg.ref.phase1_release_v3.20101123_thinned_autosomal_overlap")
exts <- c(".bed", ".bim", ".fam")
purrr::map2_int(paste0(base, exts), paste0(tmpfile, exts), ~download.file(.x, .y))
rdsfile <- snp_readBed(paste0(tmpfile, ".bed"), tempfile())

bigsnp <- snp_attach(rdsfile)
(G <- bigsnp$genotypes)
object.size(G)

G.matrix <- G[]
G.matrix <- as.data.frame(G.matrix)
format(object.size(G.matrix), units = "MB")

row.names(G.matrix) <- bigsnp$fam$sample.ID
colnames(G.matrix) <- bigsnp$map$marker.ID

# write.csv(G.matrix,"./data/snpData.csv")
# write.csv(bigsnp$map, "./data/snpMetaData.csv")
# write.csv(bigsnp$fam, "./data/metaData.csv")

snpData <- G.matrix
snpMetaData <- bigsnp$map
metaData <- bigsnp$fam
rm(G.matrix, bigsnp, tmpfile)

### I have snp data for 1092 people, but expression data for 619. Lets find the intersect there. 

exprData %<>% dplyr::select(one_of(c("Normalization REF",intersect(colnames(exprData), rownames(snpData)))))

# Looks like the probes have Illumina codes, which is not really useful. Lets convert it to gene format. As indicated here (https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-264/), the expression data was collected using A-MEXP-930 - Illumina Human-6 v2 Expression BeadChip. If you follow the link, there is a txt file with the code annotations, which is what we need. 

# Similar to what we did above, lets read in this Illumina data temporarily. 

tmpfile <- tempfile()
base <- "https://www.ebi.ac.uk/arrayexpress/files/A-MEXP-930/A-MEXP-930.adf"
exts <- ".txt"
download.file(paste0(base, exts),paste0(tmpfile, exts))

rdsfile <- fread(paste0(tmpfile, exts), header= TRUE, sep= "\t", skip= "Reporter")

# since there is a header we do not want, we are starting to read the file where the word REPORTER is.

rdsfile %<>% rename(`Normalization REF`= `Reporter Name`) %>% select(`Normalization REF`, `Reporter Database Entry[hugo]` )

exprData %<>% left_join(rdsfile)

exprData %<>% select(`Reporter Database Entry[hugo]`, everything())
exprData %<>% filter(`Reporter Database Entry[hugo]` != "") %>% select(-`Normalization REF`)

exprData %<>% mutate_at(colnames(exprData)[2:length(exprData)], funs(as.numeric)) %>% group_by(`Reporter Database Entry[hugo]`) %>% summarise_all(mean)

exprData %<>% rename(GeneId = `Reporter Database Entry[hugo]`)

exprData %<>% column_to_rownames(var= "GeneId") %>% signif(digits= 3) %>% rownames_to_column(var= "GeneId") 

exprData %>% write_csv("./data/exprData.csv.gz")
