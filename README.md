# AllenSDK

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://brendanjohnharris.github.io/AllenSDK.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://brendanjohnharris.github.io/AllenSDK.jl/dev/)
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

Note that this package tracks a fork of the AllenSDK for compatibility, found at https://github.com/brendanjohnharris/AllenSDK
