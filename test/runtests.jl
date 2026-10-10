using AllenSDK
import HDF5 # after AllenSDK on purpose: this order breaks HDF5_jll if h5py shares its libhdf5
using PythonCall
using Test
using Scratch

@testset "h5py and HDF5.jl keep separate libhdf5" begin
    # A shared libhdf5 also refuses to reopen a file h5py holds open.
    path = tempname() * ".h5"
    HDF5.h5write(path, "x", [1, 2, 3])
    pyfile = AllenSDK.h5py.File(path, "r")
    @test HDF5.h5read(path, "x") == [1, 2, 3]
    pyfile.close()
end

@testset "AllenSDK.jl" begin
    # Load the test file
    ecephyscache = @test_nowarn pyimport("allensdk.brain_observatory.ecephys.ecephys_project_cache")
    behaviorcache = @test_nowarn pyimport("allensdk.brain_observatory.behavior.behavior_project_cache")
    manifestdir = joinpath(get_scratch!("allensdk_test_manifest"), "..", "test", "testdata")
    cache = behaviorcache.VisualBehaviorNeuropixelsProjectCache.from_s3_cache(cache_dir=manifestdir)

    @test isfile(joinpath(manifestdir, pyconvert(String, cache.latest_manifest_file())))

    sessions = @test_nowarn cache.get_ecephys_session_table()
    probes = @test_nowarn cache.get_probe_table()
    channels = @test_nowarn cache.get_channel_table()
    units = @test_nowarn cache.get_unit_table()

    # session = pyconvert(Int, sessions.index[1])
    # session = cache.get_ecephys_session(session)

    # f = behavior_ecephys_session.BehaviorEcephysSession.from_nwb_path(test_file)
    # @test f isa PythonCall.Py
    # @test pyconvert(Array, f.spike_times) isa Vector{Int}
end
