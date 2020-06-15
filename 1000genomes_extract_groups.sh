awk ' {
    if((($4 =="A" && $5 =="T") || ($4 =="T" && $5 =="A")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nAT }
    else if((($4 =="G" && $5 =="C") || ($4 =="C" && $5 =="G")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nCG }
    else if((($4 =="G" && $5 =="A") || ($4 =="A" && $5 =="G")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nAGCT }
    else if((($4 =="T" && $5 =="C") || ($4 =="C" && $5 =="T")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nAGCT }
    else if((($4 =="C" && $5 =="A") || ($4 =="A" && $5 =="C")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nACGT }
    else if((($4 =="T" && $5 =="G") || ($4 =="G" && $5 =="T")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nACGT }

    }
    END {
        print "AT\t", nAT, "\nCG\t", nCG, "\nAGCT\t", nAGCT, "\nACGT\t", nACGT > "./outdata/1000genomes_groups.tsv";
    }
' ./1000genomes/ALL.wgs.phase3_shapeit2_mvncall_integrated_v5b.20130502.sites.vcf

