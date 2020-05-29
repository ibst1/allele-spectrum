# keep only fixed alleles

awk ' {
    if((($4 =="A" && $5 =="T") || ($4 =="T" && $5 =="A")) && ($8 ~ /AF=1/)) { ++nAT }
    else if((($4 =="G" && $5 =="C") || ($4 =="C" && $5 =="G")) && ($8 ~ /AF=1/)) { ++nCG }
    else if((($4 =="G" && $5 =="A") || ($4 =="A" && $5 =="G")) && ($8 ~ /AF=1/)) { ++nAGCT }
    else if((($4 =="T" && $5 =="C") || ($4 =="C" && $5 =="T")) && ($8 ~ /AF=1/)) { ++nAGCT }
    else if((($4 =="C" && $5 =="A") || ($4 =="A" && $5 =="C")) && ($8 ~ /AF=1/)) { ++nACGT }
    else if((($4 =="T" && $5 =="G") || ($4 =="G" && $5 =="T")) && ($8 ~ /AF=1/)) { ++nACGT }

    }
    END {
        print "AT\t", nAT, "\nCG\t", nCG, "\nAGCT\t", nAGCT, "\nACGT\t", nACGT;
    }
' $1