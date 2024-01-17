using AllenSDK
using PythonCall
using Test

@testset "AllenSDK.jl" begin
    logging = pyimport("logging")
    logging.getLogger().setLevel(logging.DEBUG)
    # Load the test file
    ecephyscache = @test_nowarn pyimport("allensdk.brain_observatory.ecephys.ecephys_project_cache")
    manifestdir = joinpath(dirname(pathof(AllenSDK)), "..", "test", "testdata")
    manifest = joinpath(manifestdir, "manifest.json")
    cache = @test_nowarn ecephyscache.EcephysProjectCache(; manifest)
    @test isfile(manifest)

    sessions = @test_nowarn cache.get_session_table()
    probes = @test_nowarn cache.get_probes()
    channels = @test_nowarn cache.get_channels()


    @test isfile(joinpath(manifestdir, "probes.csv"))
    @test isfile(joinpath(manifestdir, "channels.csv"))
    @test isfile(joinpath(manifestdir, "sessions.csv"))


    # f = behavior_ecephys_session.BehaviorEcephysSession.from_nwb_path(test_file)
    # @test f isa PythonCall.Py
    # @test pyconvert(Array, f.spike_times) isa Vector{Int}
end
