# assistant

![R-CMD-Production](https://github.com/cfgo/assistant/workflows/R-CMD-Production/badge.svg)
![R-CMD-Windows](https://github.com/cfgo/assistant/workflows/R-CMD-Windows/badge.svg)
![Code Coverage](https://github.com/cfgo/assistant/workflows/Code%20Coverage/badge.svg)
![lint](https://github.com/cfgo/assistant/workflows/lint/badge.svg)

[![minimal R
version](https://img.shields.io/badge/R%3E%3D-3.6.0-6666ff.svg)](https://cran.r-project.org/)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![packageversion](https://img.shields.io/badge/Package%20version-0.0.3-orange.svg?style=flat-square)](commits/master)

## What is assistant for?
For assisting cfgo-R-Packages in any way. Especially for simplifying and automaing processes.
Example: `assistant::clear_document_reload()` clears the entire R Workspace and environment and loads the package you are currently working in which simplifies and fastens package development processes.

`cfgo_badge` on the other hand enables usage of a lifecycle for both R Packages and Functions similar to the [Tidyverse Lifecycle](https://www.tidyverse.org/lifecycle/)

## How is assistant related to other cfgo packages?
`assistant` is one of the base packages. The only cfgo dependency is `cfgoTest` for testing purpose.

While serving as basic assisting framework, many cfgo packages depend on it. As experimental status basge suggests, this "framework" is just implemented and could be used in several different ways in future.

## On which packages does assistant depends on?

|                |
| :------------- |
| `rstudioapi`   |
| `pkgload`      |
| `roxygen2`     |
| `attempt`      |
| `stringr`      |
| `rlang`        |
| `cfgoTest`     |

## Additional Information

