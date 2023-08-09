using AllenSDK
using Test

@testset "AllenSDK.jl" begin
    # Load the test file
    test_file = joinpath(dirname(pathof(AllenSDK)), "..", "test", "ecephys_session_1152811536.nwb")
    @test isfile(test_file)
    @test_nowarn f = behavior_ecephys_session.BehaviorSession.from_nwb_path(test_file)
end
