awk ' {
    if((($4 =="A" && $5 =="T") || ($4 =="T" && $5 =="A")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nAT }
    else if((($4 =="G" && $5 =="C") || ($4 =="C" && $5 =="G")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nCG }
    else if((($4 =="G" && $5 =="A") || ($4 =="A" && $5 =="G")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nAGCT }
    else if((($4 =="T" && $5 =="C") || ($4 =="C" && $5 =="T")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nAGCT }
    else if((($4 =="C" && $5 =="A") || ($4 =="A" && $5 =="C")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nACGT }
    else if((($4 =="T" && $5 =="G") || ($4 =="G" && $5 =="T")) && ($8 ~ /VT=SNP/) && ($8 !~ /MULTI_ALLELIC/)) { ++nACGT }

    }
    END {
        print "AT\t", nAT, "\nCG\t", nCG, "\nAGCT\t", nAGCT, "\nACGT\t", nACGT > "1000genomes_groups.tsv";
    }
' ./1000genomes/ALL.wgs.phase3_shapeit2_mvncall_integrated_v5b.20130502.sites.vcf

# awk '
#     BEGIN {  }
#     { if(($4 =="A" && $5 =="T") || ($4 =="T" && $5 =="A"))  { ++nAT }
#         else if($7 == "CpG" && (($5 =="A" && $6 =="T") || ($5 =="T" && $6 =="A")))  { ++nATCpG; ++nAT }
#         else if($7 == "Non-CpG" && (($5 =="C" && $6 =="G") || ($5 =="G" && $6 =="C")))  { ++nCGnCpG; ++nCG }
#         else if($7 == "CpG" && (($5 =="C" && $6 =="G") || ($5 =="G" && $6 =="C")))  { ++nCGCpG; ++nCG }
#         else if($7 == "Non-CpG" && (($5 =="A" && $6 =="G") || ($5 =="G" && $6 =="A")))  { ++nAGCTnCpG; ++nAGCT }
#         else if($7 == "CpG" && (($5 =="A" && $6 =="G") || ($5 =="G" && $6 =="A")))  { ++nAGCTCpG; ++nAGCT }
#         else if($7 == "Non-CpG" && (($5 =="C" && $6 =="T") || ($5 =="T" && $6 =="C")))  { ++nAGCTnCpG; ++nAGCT }
#         else if($7 == "CpG" && (($5 =="C" && $6 =="T") || ($5 =="T" && $6 =="C")))  { ++nAGCTCpG; ++nAGCT }
#         else if($7 == "Non-CpG" && (($5 =="A" && $6 =="C") || ($5 =="C" && $6 =="A")))  { ++nACGTnCpG; ++nACGT }
#         else if($7 == "CpG" && (($5 =="A" && $6 =="C") || ($5 =="C" && $6 =="A")))  { ++nACGTCpG; ++nACGT }
#         else if($7 == "Non-CpG" && (($5 =="G" && $6 =="T") || ($5 =="T" && $6 =="G")))  { ++nACGTnCpG; ++nACGT }
#         else if($7 == "CpG" && (($5 =="G" && $6 =="T") || ($5 =="T" && $6 =="G")))  { ++nACGTCpG; ++nACGT }
#         }
#     END   { print "Non-CpG\tAT\t", nATnCpG, "\nNon-CpG\tCG\t", nCGnCpG, "\nNon-CpG\tAGCT\t", nAGCTnCpG, "\nNon-CpG\tACGT\t", nACGTnCpG, "\nCpG\tAT\t", nATCpG, "\nCpG\tCG\t", nCGCpG, "\nCpG\tAGCT\t", nAGCTCpG, "\nCpG\tACGT\t", nACGTCpG > "DNM_groups_CpGstatus.tsv";
#         print "AT\t", nAT, "\nCG\t", nCG, "\nAGCT\t", nAGCT, "\nACGT\t", nACGT > "DNM_groups_noCpGstatus.tsv";
#     }' './DNM/DNM data - new/DNMsByStudy.txt'