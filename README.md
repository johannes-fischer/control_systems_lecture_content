# Julia notebooks for control systems lectures offered by MRT at KIT
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/KIT-MRT/control_systems_lecture_base/HEAD?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252FKIT-MRT%252Fcontrol_systems_lecture_content%26urlpath%3Dlab%252Ftree%252Fcontrol_systems_lecture_content%252F%26branch%3Dgmrt) **Grundlagen der Mess- und Regelungstechnik**

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/KIT-MRT/control_systems_lecture_base/HEAD?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252FKIT-MRT%252Fcontrol_systems_lecture_content%26urlpath%3Dlab%252Ftree%252Fcontrol_systems_lecture_content%252F%26branch%3Dmcs) **Measurement and Control Systems**

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/KIT-MRT/control_systems_lecture_base/HEAD?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252FKIT-MRT%252Fcontrol_systems_lecture_content%26urlpath%3Dlab%252Ftree%252Fcontrol_systems_lecture_content%252F%26branch%3Drtsys) **Regelungstechnik und Systemdynamik**

## Overview

This repository contains interactive Julia notebooks for the lectures 'Grundlagen der Mess- und Regelungstechnik', 'Measurement and Control Systems', and 'Regelungstechnik und Systemdynamik', offered by the Institute of Measurement and Control Systems at Karlsruhe Institute of Technology.

The environment setup is managed by a separated [base repository](https://github.com/KIT-MRT/control_systems_lecture_base), to not require binder to build a new container with every change in a notebook.

## Usage

The notebooks are Jupyter notebooks.
You can find more information on how to navigate and use them [here](https://jupyterlab.readthedocs.io/en/stable/user/interface.html#).

You can find the notebooks for the lectures in the corresponding branches:

- gmrt branch: 'Grundlagen der Mess- und Regelungstechnik'
- mcs branch: 'Measurement and Control Systems'
- rtsys branch: 'Regelungstechnik und Systemdynamik'

You can choose to run the notebooks online using binder or locally on your machine.

### Binder

Using binder allows to run the notebooks online without having to set up anything on your computer.
It can take some time until the environment is loaded, depending on how frequently this repository is used (the more it is used, the better is the availability). Just click on the `launch binder` icon for your lecture at the top of the document and wait until the environment is loaded.

### Local machine

Running the code on your local machine gives you more flexibility, and you don't have to wait until binder is ready to execute your code. The following instructions work for Ubuntu systems. On other operating systems, you might have to adapt them.

Prerequisites:
- Install Julia >= 1.7
  ```
  URL=https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.3-linux-x86_64.tar.gz
  wget -nv $URL -O /tmp/julia.tar.gz
  mkdir ~/julia-1.7.3
  tar -x -f /tmp/julia.tar.gz -C ~/julia-1.7.3 --strip-components 1
  ln -s ~/julia-1.7.3/bin/julia ~/bin/julia
  ```
- Install Juypter lab
  ```
  pip install jupyterlab
  ```

Clone git repositories, install julia environment and run jupyter lab.
Replace <BRANCH_NAME> with the branch corresponding to your lecture, i.e. gmrt, mcs, or rtsys.

```
git clone https://github.com/KIT-MRT/control_systems_lecture_base.git
cd control_systems_lecture_base
git clone https://github.com/KIT-MRT/control_systems_lecture_content.git
cd control_systems_lecture_content
git checkout <BRANCH_NAME> # gmrt, mcs, or rtsys
julia --project=@. -e 'using Pkg; Pkg.instantiate(); Pkg.precompile()'
julia --project=@. -e 'using IJulia; jupyterlab(dir=".")'
```

## Troubleshooting

If you encounter any problems, please open a corresponding issue on github.

- The interactive output plots are not updated when using the sliders.
  - This is most likely an issue with WebIO.jl, which can have problems if metadata of old WebIO elements is still present in the cell output. To resolve this, switch from jupyter lab to the old jupyter notebook view (e.g. by editing the URL: 'lab'->'tree') and clear the output of all cells (maybe additionally do it in jupyter lab). Then restart the kernel and run the cells again.
- How can I generate the binder links?
  - Basic binder links: https://mybinder.org/
  - nbgitpuller links for separated environment and content repositories: https://jupyterhub.github.io/nbgitpuller/link?tab=binder
- Why are there separate environment and content repositories?
  - https://discourse.jupyter.org/t/tip-speed-up-binder-launches-by-pulling-github-content-in-a-binder-link-with-nbgitpuller/922

## License

Unless otherwise stated, this repository is distributed under the 3-Clause BSD License, see [LICENSE](LICENSE).
