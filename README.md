# AllenSDK

<!-- [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://brendanjohnharris.github.io/AllenSDK.jl/stable/) -->
<!-- [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://brendanjohnharris.github.io/AllenSDK.jl/dev/) -->
[![Build Status](https://github.com/brendanjohnharris/AllenSDK.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/brendanjohnharris/AllenSDK.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/brendanjohnharris/AllenSDK.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/brendanjohnharris/AllenSDK.jl)

This small package creates a basic interface to the AllenSDK python package using PythonCall. It exports the top-level `allensdk` module, which can be used to import other submodules. For example:
```julia
using AllenSDK
using PythonCall
ecephyscache = pyimport("allensdk.brain_observatory.ecephys.ecephys_project_cache")
cache = ecephyscache.EcephysProjectCache # This can be used to access neuropixels data
units = cache.get_units() # E.g. get a python dataframe of neuropixels units
```

For more complex usage, please see [AllenNeuropixels.jl](https://www.github.com/brendanjohnharris/AllenNeuropixels.jl), which builds on this package by providing a more Julia-oriented interface to the AllenSDK.

You should have no problems installing this package as usual on Linux and Windows. On MacOS, you may need to install the Python dependencies manually (see `CondaPkg.toml`) in some environment, then set:
```julia
ENV["JULIA_CONDAPKG_ENV"] = "/path/to/some/environemt/"
ENV["JULIA_CONDAPKG_OFFLINE"] = true
```
These environment variables tell [CondaPkg.jl](https://github.com/JuliaPy/CondaPkg.jl) to use a manual python installation and avoid updating.