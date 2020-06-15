# Mutation spectrum similarities as evidence of common descent

## Background
This analysis was made in preparation of a contribution to a book on evolutionary creation (theistic evolution) vs anti-evolutionary creation ("creationism"). A similar analysis was made by  [Steve Schaffner](https://biologos.org/articles/testing-common-ancestry-its-all-about-the-mutations) in 2017 and then replicated by [EvoGrad](https://evograd.wordpress.com/2019/02/20/human-genetics-confirms-mutations-as-the-drivers-of-diversity-and-evolution/) in 2019. I replicate these analyses here and add some additional data sets as well.

When evaluating the genetic evidence for or against common descent, genetic similarities such as ERV/LTR can be a useful tool. Howeber, genetic *differences* between organisms may also provide us with data to assess the theory of common descent.

Genetic differences can arise through different means, one of the being point mutations when one base is substituted for another. Twelve substitutions are possible: A → C, A → G, A → T, C → A, C → T, C → G, etc. As explained by [Schaffner](https://biologos.org/articles/testing-common-ancestry-its-all-about-the-mutations), not all substitutions be distinguished from each other since we do not always know which is the ancestral allele or which of the two complementary strands that were actually changed. We can instead group the substitutions in four classes: 1) A ↔ G and C ↔ T; 2) A ↔ C and G ↔ T; 3) C ↔ G; 4) A ↔ T. The substitutions in the first class are called transitions and the other three classes are called transversions.

Transitions are more frequent than transversions. This is due to a similar chemical structure between A and G (they are called [purines](https://en.wikipedia.org/wiki/Purine)), and likewise C and T are chemically similar (called [pyrimidines](https://en.wikipedia.org/wiki/Pyrimidine)). The consequence is that when a substitution occurs during DNA replication, a purine tends to be substituted by a purine and a pyrimidine tends to be substituted by a pyrimidine. In other words, class 1 (transitions) will be more common than the other classes (transversions). If a genetic difference between two indivduals (or species) is due to mutations, we expect to find a pattern of relatively high A/G and C/T diversity.

# Analyses
## 1. De novo mutations
One possible way to investigated mutation frequency patterns is by sequencing children and parents and identify de novo mutations (DNMs). Smith et al (2018) compiled data from three studies which included more than 130,000 autosomal DNMs. I extracted the mutation classes from this data. When C is followed by G (called CpG island), it is more likely to be converted into a T. In other words, C>T transitions in CpG islands will be more common than in non-CpG areas. Since CpG constitute only a minor part of the genome, the overall pattern is the same whether we include them or not: transitions constitute ~65% of all de novo mutations. In the following analyses all DNMs are included.

<figure>
  <img src="figures/DNMs.png" alt="my alt text" width=150px/>
  <figcaption>This is my caption text.</figcaption>
</figure>

ghjgh

![DNM allele frequency spectrum](figures/DNMs.png) *DNM figure*.

## 2. Human genetic diversity
An alternative method is to look at the genetic diversity in in the human population. This was done in the 1000 genomes project (2015). The data is publicly available and the SNP spectrum can be easily extracted (`1000genomes_data_download.sh`, `1000genomes_extract_groups.sh`). When I did this, the distribution was congruent with the DNM data: A<>G and the C<>T diversity (transitions) are much more common than transversions (fig. 1, medium bars). Once again, this is expected if the diversity is due to mutations.

## 3. Great ape diversity
Finally, we can compare the DNA diversity between different species. The genetic differences will be much bigger than within one species, but if the differences are due to point mutations we expect a similary pattern of the mutation spectrum. REF sequenced the genomes of ... great apes. Filtering on the fixed mutations gives an almost identical resultat to the DNM data and the 1000 genomes data (fig. 1, light bars).

# Results
Det är också exakt vad vi ser. I figur 7 visas att fördelningen av punktmutationer är likadan mellan arterna som inom den mänskliga arten. Detta är en stark indikation på att de genetiska skillnaderna har uppkommit genom samma mekanism.

## Alternative explanations

# Description of files
`DNM_extract_groups.sh` Extraction of DNM 


# References
Smith, Thomas C. A., Peter F. Arndt, and Adam Eyre-Walker. 2018. “Large Scale Variation in the Rate of Germ-Line de Novo Mutation, Base Composition, Divergence and Diversity in Humans.” PLoS Genetics 14 (3): e1007254. [*Link*](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1007254), [*Data*](https://datadryad.org/stash/landing/show?big=showme&id=doi%3A10.5061%2Fdryad.935vc).

1000 Genomes Project Consortium, Adam Auton, Lisa D. Brooks, Richard M. Durbin, Erik P. Garrison, Hyun Min Kang, Jan O. Korbel, et al. 2015. “A Global Reference for Human Genetic Variation.” Nature 526 (7571): 68–74. [*Link*](https://www.nature.com/articles/nature15393), [*Data*](ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502).