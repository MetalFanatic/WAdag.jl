using DataFrames, XLSX
wb = "C://Users//onmyw//Downloads//Craig's Design and Landscaping Services Dec 10, 2021//General_ledger.xlsx"
ws = "General Ledger"
rng = "A5:J452"
x = DataFrame(XLSX.readtable(wb,ws)...)
names(x)

function qb(;wb=missing,ws=missing,rng=missing,teststate=false)
    x = DataFrame(XLSX.readtable(wb,ws)..., header=false)

XLSX.writetable(wb, x, overwrite=true, sheetname=ws,anchor_cell=outcell())
names
