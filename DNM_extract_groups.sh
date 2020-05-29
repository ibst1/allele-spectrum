awk '
    BEGIN {  }
    { if($7 == "Non-CpG" && (($5 =="A" && $6 =="T") || ($5 =="T" && $6 =="A")))  { ++nATnCpG; ++nAT }
        else if($7 == "CpG" && (($5 =="A" && $6 =="T") || ($5 =="T" && $6 =="A")))  { ++nATCpG; ++nAT }

        else if($7 == "Non-CpG" && (($5 =="C" && $6 =="G") || ($5 =="G" && $6 =="C")))  { ++nCGnCpG; ++nCG }
        else if($7 == "CpG" && (($5 =="C" && $6 =="G") || ($5 =="G" && $6 =="C")))  { ++nCGCpG; ++nCG }

        else if($7 == "Non-CpG" && (($5 =="A" && $6 =="G") || ($5 =="G" && $6 =="A")))  { ++nAGCTnCpG; ++nAGCT }
        else if($7 == "CpG" && (($5 =="A" && $6 =="G") || ($5 =="G" && $6 =="A")))  { ++nAGCTCpG; ++nAGCT }
        else if($7 == "Non-CpG" && (($5 =="C" && $6 =="T") || ($5 =="T" && $6 =="C")))  { ++nAGCTnCpG; ++nAGCT }
        else if($7 == "CpG" && (($5 =="C" && $6 =="T") || ($5 =="T" && $6 =="C")))  { ++nAGCTCpG; ++nAGCT }

        else if($7 == "Non-CpG" && (($5 =="A" && $6 =="C") || ($5 =="C" && $6 =="A")))  { ++nACGTnCpG; ++nACGT }
        else if($7 == "CpG" && (($5 =="A" && $6 =="C") || ($5 =="C" && $6 =="A")))  { ++nACGTCpG; ++nACGT }
        else if($7 == "Non-CpG" && (($5 =="G" && $6 =="T") || ($5 =="T" && $6 =="G")))  { ++nACGTnCpG; ++nACGT }
        else if($7 == "CpG" && (($5 =="G" && $6 =="T") || ($5 =="T" && $6 =="G")))  { ++nACGTCpG; ++nACGT }
        }
    END   {print "AT\t", nATnCpG, "\nCG\t", nCGnCpG, "\nAGCT\t", nAGCTnCpG, "\nACGT\t", nACGTnCpG > "DNM_groups_not.in.CpG.tsv";
        print "AT\t", nATCpG, "\nCG\t", nCGCpG, "\nAGCT\t", nAGCTCpG, "\nACGT\t", nACGTCpG > "DNM_groups_in.CpG.tsv";
        print "AT\t", nAT, "\nCG\t", nCG, "\nAGCT\t", nAGCT, "\nACGT\t", nACGT > "DNM_groups_no.CpG.status.tsv";
    }' './DNM/DNM data - new/DNMsByStudy.txt'