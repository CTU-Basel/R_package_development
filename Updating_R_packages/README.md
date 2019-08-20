
# Updating R packages via R studio

Upon introducing changes to a package, the package documentation needs to be updated, the package needs to be re-built, re-installed, and re-loaded, in order to make it available for immediate use. One can do this either via Rstudio built-in shortcuts, or via the command line.
If you want to use Rstudio's convenient shortcuts, you will need to create a Rstudio project for the package first, then configure the build tools, and finally re-install the updated package. 


## Create a new project
If you already have an RStudio project for your package, skip to section "Configure Build Tools". If you want to add an Rstudio project to an existing package, then follow these steps:

1. In a Rstudio session, go to File > New Project and select "Existing Directory"
2. Browse to your package's root directory, e.g. ~/CTUmethodsR
3. Click "Create Project"

## Configure Build Tools

1. Go to Build > Configure Build Tools and select "Use devtools package functions if available", and "Generate documentation with Roxygen" 
2. Click "Configure" and ensure "Install and Restart" is selected in addition to the default options.

## Make changes to a function

1. Ctrl + O to open file add_one.R
2. Edit the file and Ctrl + S to save.
3. Ctrl + Shift + B to Install and Restart

## Test function
1."Ctrl + Shift + T to test function
2. Check ?add_one
