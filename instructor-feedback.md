# Exceeds spec
## At least one piece of functionality has been refactored into a function in its own file
I refactored a function in a separate R script to specifically automate the application of the rolling average function across columns so that each code chunk was clean and did not contain a ton of mutate() lines. This means that the analysis for each script is able to occur in one line each, greatly improving the readability of the cleaning script.

## The code is appropriately commented
I inserted roxygen skeletons with appropriate comments and examples in both of my functions. This is an important aspect of reproducibility, especially if we were creating a package, as this improves the documentation of each function. 

## Collaboration

1. I peer reviewed Joaquin's project. We discussed that something that would help him and allow him to better focus on the rest of the specs was to make sure that all the file and object names were consistent in style. I was able to read through his whole project and edit this aspect across 4 of his files, which allowed him to produce a consistent and clean final paper qmd. 

2. commenting: https://github.com/NatBonnet/hurricane-hugo/issues/20
intermediate outputs: https://github.com/NatBonnet/hurricane-hugo/issues/17
data import and cleaning: https://github.com/NatBonnet/hurricane-hugo/issues/16

3. https://github.com/NatBonnet/hurricane-hugo/commit/9734297584f6e676c827f1f036d80d8f7b4ac191