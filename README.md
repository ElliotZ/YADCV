# YADCV - YADCV is A Developer CV

This is a LaTeX CV template based on [Developer CV](https://www.latextemplates.com/template/developer-cv), with added support for better rendering for unicode characters (via XeLaTeX), tweaked spacing / layout, modularized document structure, and a custom colorbox command.
 
Now with Nord Color scheme integration.

### Dependency
The TeX distribution I use is TeX Live. Minimal distributions may not provide all of the packages used in this template.

### Building pdf
Use `xelatex main.tex` to build. Alternatively, use `latexmk`.

### Customization
Edit files in `sect/` for each section of the CV. Most of the formatting are defined in the class file `yadcv.cls`. More than a few custom commands have optional arguments that are not used in the example, so please refer to the class file for detailed instructions.
To change the icons in the headers, refer to the `fontawesome.pdf` file to find the name of the icon.

### Preview
Click [This](https://raw.githubusercontent.com/ElliotZ/YADCV/master/main.pdf) to download.
[![Résumé](https://raw.githubusercontent.com/ElliotZ/YADCV/master/main-1.png)](https://raw.githubusercontent.com/ElliotZ/YADCV/master/main.pdf)

### LICENSE
This project is released under the MIT License.
