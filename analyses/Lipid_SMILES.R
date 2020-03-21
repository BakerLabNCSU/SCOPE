library("httr")
library("jsonlite")
library(fingerprint)
library(rcdk)
library(rprojroot)

setwd(find_root("SCOPE_lipid_analysis.Rproj"))
setwd("analyses/data")

Case1_v_Ctrl_Negative <- read.csv("Case1_v_Ctrl_Negative.csv", stringsAsFactors = F)
Case1_v_Ctrl_Positive <- read.csv("Case1_v_Ctrl_Positive.csv", stringsAsFactors = F)

All_lipids <- rbind(Case1_v_Ctrl_Negative, Case1_v_Ctrl_Positive)

lipids <- All_lipids$Name
lipids <- sub("/", "_", lipids)

lipids <- unlist(strsplit(lipids, ";"))
lipids <- sub("_[A-B]$", "", lipids)
# lipids <- sub("_0:0|0:0_$", "", lipids)
lipids <- unique(lipids)

df <- data.frame(abbrev = lipids, smi = NA)
for (i in 1:length(lipids)) {
  call1 <- paste0("https://www.lipidmaps.org/rest/compound/abbrev_chains/", lipids[i],"/smiles/txt")
  get_smiles <- GET(call1)
  get_smiles_text <- content(get_smiles, "text")
  get_smiles_text <- sub(".*smiles\\t(.*)\\n\\n", "\\1", get_smiles_text)
  if (get_smiles_text == "") {
    call1 <- paste0("https://www.lipidmaps.org/rest/compound/abbrev/", lipids[i],"/smiles/txt")
    get_smiles <- GET(call1)
    get_smiles_text <- content(get_smiles, "text")
    get_smiles_text <- sub(".*smiles\\t(.*)\\n\\n", "\\1", get_smiles_text)
  }
  df[i, 2] <- get_smiles_text
}
# write.csv(df, file = "smiles.csv")

# Manually add smiles by searching LIPID MAPS, read in lipid species once each lipid has a corresponsing SMILES annotation

df <- read.csv("All_lipid_SMILES.csv", stringsAsFactors = F)

head(df)

sum(df$smi == "")

df.c <- df[df$smi != "", ]
df.na <- df[df$smi == "", ]

head(df.c)

fing <- parse.smiles(df.c$smi)
fing <- lapply(fing, get.fingerprint, type = "circular")
fp.sim <- fp.sim.matrix(fing)
row.names(fp.sim) <- df.c$abbrev
fp.dist <- as.dist(1 - fp.sim)
cls <- hclust(fp.dist)
plot(cls)

# Dendrogram of all identified lipids, structurally related using an ECFP_6 fingerprint, Euclidian distance and average linkage method.
save.image("fp_all_lipid.rdata")

# Identified lipid species annotations filtered to significantly differntiable molecules. Dendrogram of only significantly differntiable disease vs. control lipids. 

df <- read.csv("Sig_lipid_SMILES.csv", stringsAsFactors = F, header = T)

head(df)
sum(df$smi == "")

df.c <- df[df$smi != "", ]
df.na <- df[df$smi == "", ]

head(df.c)

fing <- parse.smiles(df.c$smi)
fing <- lapply(fing, get.fingerprint, type = "circular")
fp.sim <- fp.sim.matrix(fing)
row.names(fp.sim) <- df.c$abbrev
fp.dist <- as.dist(1 - fp.sim)
cls <- hclust(fp.dist)
plot(cls)

#Dendrogram of all identified lipids, structurally related using an ECFP_6 fingerprint, Euclidian distance and average linkage method.
save.image("fp_sig_lipid.rdata")
