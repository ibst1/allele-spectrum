# wget --recursive --reject="index.html*" --no-parent -nH --cut-dirs=2 -P primates https://eichlerlab.gs.washington.edu/greatape/data/VCFs/SNPs/ # ~50 GB

# For only Pan troglodytes:
# wget --recursive --reject="index.html*" --no-parent -l1 -nH --cut-dirs=2 -P primates https://eichlerlab.gs.washington.edu/greatape/data/VCFs/SNPs/Pan_troglodytes.vcf.gz

gunzip --keep ./primates/VCFs/SNPs/*.gz