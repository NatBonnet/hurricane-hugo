# Peer Assessment for EDS 214 Final Project (Richie)

## Automate 
#### **Running the entire analysis requires rendering one Quarto document**
Meets spec: With rendering one quarto document, the analysis imports the data correctly, wrangles it, uses the function it needs to calculate the moving mean, and then plots it. 

#### The analysis runs without errors
Meets spec: The analysis runs without any errors. 

#### **The analysis produces the expected output**
Not yet: Currently the analysis only produces the line graph for a single chemical concentration at a single site across time. It still needs to produce a plot for the rest of the chemicals and sites. 

#### **Data import/cleaning is handled in its own script(s)**
Not yet: Currently the data importing, filtering, and mutating are done on the same quarto document as the analysis. 

## Organize
#### Raw data is contained in its own folder
Meets spec: Raw data is stored in a folder called "data."

#### Intermediate outputs are created and saved to a separate folder from raw data
Not yet: Currently, intermediate outputs are not saved to an output folder. They are just placed into the environment after a variable is assigned to them. 

#### **At least one piece of functionality has been refactored into a function in its own file**
Meets Spec: The refactoring process was completed successfully. There is a function called rolling_avg that is placed in its own folder "R". 

## Document
#### The repo has a README that explains where to find (1) data, (2) analysis script, (3) supporting code, and (4) outputs
Not yet: The read me for this repo tells you where to find the data and supporting code. It does not mention the paper folder which contains the analysis and does not mention the output folder. 

#### **The README includes a flowchart and text explaining how the analysis works**
Not yet: The README is missing a flowchart and text explaining how the analysis works. 

#### **The code is appropriately commented**
Not yet: While there are some comments at the top of code chunks, it can be improved with more comments. It could also improve with more in-line comments in the analysis (not just the rolling_avg function), and there should be a roxygen skeleton in rolling_avg. 

#### **Variable and function names are descriptive and follow a consistent naming convention**
Meets spec: Variables and function name are all in snake_case, concise, and use intuitive naming conventions. 

## Scale
### After cloning the repo on Workbench:

#### Running the environment initialization script installs all required packages
Not yet: It does not contain the environment initialization script installing all required packages. 

#### The analysis script runs without errors
Skip
