# Hackathon-driven tutorial development

## Authors

- Bruno Grande, Department of Molecular Biology and Biochemistry, Simon Fraser University, Burnaby, British Columbia, Canada
- Anna Cavalla, Department of Bioinformatics, UBC, Vancouver, Canada
- Arjun Baghela, Department of Bioinformatics, UBC, Vancouver, Canada
- Florian Privé, Université Grenoble Alpes, Laboratoire TIMC-IMAG, UMR 5525, France
- Peter Zhang, Department of Medicine, Faculty of Medicine, UBC
- Yisong Zhen, State Key Laboratory of Cardiovascular Disease,Fuwai Hospital, National Center for Cardiovascular Diseases Chinese Academy of Medical Sciences and Peking Union Medical  College, Beijing, 100037, People’s Republic of China

## Introduction

Computational biologists have to rely on advanced domain-specific knowledge of software tools that is often difficult to acquire, especially given the incredible rate at which new methods become available and best practices evolve. This difficulty is in large part due to the lack of documentation online. In the worst cases, software tools offer little to no documentation. Many tools offer the bare minimum by documenting the inputs they expect and the outputs they provide. In the case of R packages, the Comprehensive R Archive Network (CRAN) is the de facto R package repository and requires that submissions include this kind of function documentation. Better yet, some tools offer example use cases, also known as vignettes, that are ideal for new users to get started. For instance, these vignettes are a requirement for submitting R packages to the Bioconductor repository, which has arguably made this resource much more accessible to new users. Outside of Bioconductor though, only a minority of software tools offer detailed vignettes, and when they do, they are mostly unrelated to genomics. This is unfortunate because their utility in genomic data analysis will remain unexplored until computational biologists serendipitously discover their power. 

The aim of this project is to organize this hard-fought collective knowledge into modular tutorials that use a common dataset for internal consistency. This idea is inspired by Software Carpentry's successful approach to developing introductory programming lessons. These tutorials can act as third-party vignettes focused on genomic data analysis. These tutorials are designed to be independent from one another, but their use of a consistent dataset allows them to be combined to form the basis of longer workshops. Ultimately, we wish to help train the current and next generation of computational biologists to use more advanced tools at their disposal. 

The authors developed their first set of advanced R tutorials for genomic data analysis as a project at the Hackseq 2017 genomics hackathon in Vancouver, BC, Canada. In this article, we explore the benefits and challenges associated with so-called hackathon-driven tutorial development. We also comment on remote participation in hackathon specifically in the context of tutorial development. 

## Benefits

There are many benefits to developing tutorials as a group during hackathons. First of all, because everyone is working towards the same goal, it is more motivating than working alone. Second of all, you can cover more ground as a group and result in a more substantial set of tutorials that can gain traction and popularity once published online. Third of all, by working as a group, you gain access to immediate peer review of your tutorials, which allows you to iterate quickly and this ultimately improves the quality of the tutorials. Finally, the most important benefit to hackathon-driven tutorial development is the collective knowledge that is available for the duration of the hackathon. This provides several advantages to working alone. Notably, the tutorial content will benefit from the variety of perspectives provided by individuals from different research groups or, in the event of remote participation, different regions in the world. The tutorials can then be the distillate of this collective knowledge, ensuring the highest possible quality. Furthermore, by having access to this collective knowledge, any encountered problems can more readily be resolved. 

## Challenges

In addition to the benefits of hackathon-driven tutorial development, there are a number of challenges to be mindful of. For one, while having a common dataset for all tutorials is not necessary, it is useful in reducing the overhead associated from reading multiple tutorials, especially in the context of workshops that combine multiple tutorials. When selecting a common dataset, there are a few criteria that should be met: it must be openly accessible; it must be relatively tidy; it must be interesting and relevant to the target audience; it must be multi-dimensional to allow for a wide range of tutorials; and it cannot be too small not too big. Identifying a dataset that satisfies all of these criteria can be challenging depending on your audience. For two, because there is virtually no limit on the number of possible topics, it is imperative to select a unifying theme for the tutorials while considering the target audience. In our case, the hackathon project proposal specified advanced R tutorials for genomic data analysis, which remains fairly broad. When selecting topics that fit within the scope of the hackathon project, you want to avoid reinventing the wheel. There are several vignettes and tutorials available online, so your effort is best spent developing new material that hasn't been covered yet online. If ever a tutorial for a given topic already exists but doesn't focus on genomics, you can opt to adapt the tutorial for genomic data analysis. You can also come across inadequate tutorials (e.g. not detailed enough) and expand on them. In either case, you are building on previous efforts and thus being more efficient. 

## Virtual Participation

Flying to a distant country for a short conference is often difficult, both in regards to personal agenda and travel costs. Promoting remote participation can be a way to overcome these two problems, while being able to attend the conference almost as if you were there in-person. For hackathons, remote participation is even easier. Indeed, people around the world are already used to collaborate on coding projects thanks to platforms such as GitHub, Slack and Skype. GitHub makes it possible to organise the code and the overall project. Slack and Skype makes it possible to communicate within the team. In the special case of making tutorials, remote participation is even easier because tutorials are nearly independent in the content. Moreover, we think that remote attendance is beneficial in terms of work efficiency as one can adjust its schedule at will and is less prone to distractions. Yet, conference are also about socializing and networking, which will always be better achieved in person. And ease of communication with the team may depend on the efforts of the in-person participants to communicate with the remote participants in order to integrate them to the team. So, remote participation has its pros and cons, but we think that it will always be better than not being able to participate at all. 


## Discussion

TODO..

<!--
- Hackathons are a great venue for developing tutorials
- Keeping work parallelized instead of sequential
    - Ensures that everyone is working
- Social/professional platform for establishing new collaborations
- Kaggle-like competitions to solve complex/difficult computational biology problems
-->

## Data and software availability

- Latest source code: https://github.com/hackseq/2017_project_5 
- Archived source code as at time of publication: TODO
- License: MIT License

## Suggested reviewers

- Hadley Wickham
- Greg Wilson
- Jenny Bryan

## References

Baker,M. (2015) Over half of psychology studies fail reproducibility test. Nature News.

Gillespie,C. and Lovelace,R. (2016) Efficient R Programming: A Practical Guide to Smarter Programming “O’Reilly Media, Inc.”

International Consortium of Investigators for Fairness in Trial Data Sharing et al. (2016) Toward Fairness in Data Sharing. N. Engl. J. Med., 375, 405–407.

National Academies of Sciences, Engineering, and Medicine et al. (2016) Statistical Challenges in Assessing and Fostering the Reproducibility of Scientific Results: Summary of a Workshop National Academies Press.

Perez-Riverol,Y. et al. (2016) Ten Simple Rules for Taking Advantage of Git and GitHub. PLoS.Comput.Biol., 12, e1004947.

Prinz,F. et al. (2011) Believe it or not: how much can we rely on published data on potential drug targets? Nat. Rev. Drug Discov., 10, nrd3439–c1.

Stodden,V. et al. (2016) Enhancing reproducibility for computational methods. Science, 354, 1240–1241.

Touma,M. et al. (2016) Decoding the Long Noncoding RNA During Cardiac Maturation: A Roadmap for Functional Discovery. Circ.Cardiovasc.Genet., 9, 395–407.

Wickham,H. (2015) Advanced R CRC Press.

