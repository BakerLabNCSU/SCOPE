# Manuscript Title

*Melanie T. Odenkirk, Jeremy Ash, Phyo Phyo Kway Zin, David Reif, Denis Fourches, Erin S. Baker*

## Usage
To run any of the r scripts provided, clone the repository and open the **SCOPE_Lipid_Analysis.Rproj** file in Rstudio.
Run the scripts within the project, so that they can find the relevant paths on your machine. Example data files for dual Case vs. Control comparison are included for building biological-structure relationships.


## Files

* The *analyses* folder contains five rmarkdown files and two r scripts, which perform the analyses reported in the paper.
	* **Lipid_SMILES.r**: Reads in lipid identifications, compiles SMILES annotations for annotated lipid species from LIPID MAPS. Outputs lipidome clustering profile of identified
llipids using an ECFP_6 fingerprint, Euclidean distance and average linkage method. 
	* **All_lipid_HG_Dendrogram.rmd**: Takes the clustering profile off all identified lipids as input. Maps biological variability of GDM and PRE diseases to clustering pattern. See already rendered report: **All_lipid_HG_Associations.html.**
	* **SIG_lipid_HG_Dendrogram.rmd**: Takes the clustering profile off all identified lipids as input. Maps biological variability of GDM and PRE diseases to clustering pattern. See already rendered report: **SIG_lipid_HG_Associations.html.**
	* **Lipid_fatty acyl_Heatmap.rmd**: Parses lipid identifications by fatty acyl components. Plots biological variability of GDM and PRE diseases by FA classifications.
	* **Lipid_FA_HG_Dysregulation.rmd**: Builds matrix of uniquely identified fatty acyl compositions and parses observed biological dysregulation of lipid species into head group annotations for visualizing variation between HG and FA annotations. See already rendered report: **Lipid_FA_HG_Dysregulation.html.**
	* **ToxPi_Sample_Outlier_Assessment.rmd**: Clusters patients by transformed ToxPi profiles. Allows for the mapping of associated clinical information (metadata) onto patient clustering. Default clustering leverages Euclidean distance and average linkage. See already rendered report: **ToxPi_Sample_Outlier_Assessment.html.**
	* **ToxPi_Sample_Classification_by_Metadata.rmd**: Parses lipid identifications by fatty acyl components. Plots biological variability of GDM and PRE diseases by FA classifications. 
* The *analyses/data folder* contains the data used by each analysis script.
	* **Case1_v_Ctrl_Negative.csv**: Output from statistical analysis of Case1 vs. Ctrl comparisons of lipids identified in negative ESI analysis.
	* **Case1_v_Ctrl_Positive.csv**: Output from statistical analysis of Case1 vs. Ctrl comparisons of lipids identified in positive ESI analysis.
	* **Case2_v_Ctrl_Negative.csv**: Output from statistical analysis of Case2 vs. Ctrl comparisons of lipids identified in negative ESI analysis.
	* **Case2_v_Ctrl_Positive.csv**: Output from statistical analysis of Case2 vs. Ctrl comparisons of lipids identified in positive ESI analysis.
	* **All_Lipid_SMILES.csv**: Compiled lipid identifications and SMILES annotations of all lipids identified in GDM vs. Ctrl and PRE vs. Ctrl analyses.
	* **fp_all_lipid.rdata**: Clustering output of all identified lipids. 
	* **Sig_Lipid_SMILES.csv**: Compiled lipid identifications and SMILES annotations of all lipids identified in GDM vs. Ctrl and PRE vs. Ctrl analyses.
	* **fp_sig_lipid.rdata**: Clustering output of significantly idnetified lipids in either GDM vs. Control or PRE vs. Control comparisons. 
	* **lipid_HG_color_classification.csv**: Annotation of lipid head group for differentiation tree nodes by lipid head group classification. 
	* **FA_Heatmap_tail length order_ALL_Lipids.tiff**: Log2FC heatmap grouping of all identified lipids by fatty acyl composition.
	* **FA_Heatmap_tail length order_SIG_Lipids.tiff**: Log2FC heatmap grouping of all significant lipids in Disease versus Control comparison by fatty acyl composition.
	* **FA_across_HG_dist.csv**: Distance matrix for grouping species with shared fatty acyl compositions together to visualize FA variation across HG. 
	* **Log2_Lipid_Abundances.csv**: Example Log2 Lipid abundances for grouping samples by clinical variables.
	* **ToxPi_age_by_5_disease_grouping.csv**: Output from clustering samples by metadata for input into ToxPi software.
	* **Patient_Clustering_ToxPi_input.csv**: Top 20 significant lipids for differentiating two cases (PRE, GDM) from eachother for building clustering pattern based on ToxPi profile similarity. Variance transformed by including max/min values to account for lipid variation across samples. 
	* **Patient_Clustering_ToxPi_results.csv**: Output patient ToxPi profile scores.
	* **ToxPi_metadata_example.csv**: Example of metadata for grouping samples by clinical variables and mapping clinical variables to patient clustering. 