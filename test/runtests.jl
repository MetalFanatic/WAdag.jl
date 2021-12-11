using Revise
using Pkg
using WAdag
using Test
#=
@testset "WAdag.jl" begin
    @test cleanaddress(;wb="us-500-input.xlsx",ws="Sheet1",rng="A1:B501",teststate=true) == DataFrame(XLSX.readtable("us-500-input.xlsx","Sheet1")...)
end
=#

@testset "basicfunc.jl" begin
    @test bfunc(5) == 25
end
