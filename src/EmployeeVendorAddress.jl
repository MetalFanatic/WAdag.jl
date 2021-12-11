function cleanaddress(;wb=missing,ws=missing,rng=missing,teststate=false)
    x = DataFrame(XLSX.readtable(wb,ws)...)
    regAve = r" Avenue"
    regSt = r" Street"
    regCt = r" Court"
    regPkwy = r" Parkway"
    regBlvd = r" Boulevard"
    regDr = r" Drive"
    regLn = r" Lane"
    regHwy = r" Highway"
    regSymbs = r"[,;:. -!@#$%^&()=<>\/]" # + and * cannot be filtered,[] array
    function regexreplace(x)
        x = replace.(x,regAve => " Ave")
        x = replace.(x,regSt => " St")
        x = replace.(x,regCt => " Ct")
        x = replace.(x,regPkwy => " Pkwy")
        x = replace.(x,regBlvd => " Blvd")
        x = replace.(x,regDr => " Dr")
        x = replace.(x,regLn => " Ln")
        x = replace.(x,regHwy => " Hwy")
        x = replace.(x,regSymbs => "")
    end
    x.address = regexreplace(x.address)
    reg2 = r","
    cleanstring(arr) = map(arr) do x
        s = string(x)
        s = Unicode.normalize(x, casefold=true)
    end
    x.address = cleanstring(x.address)
    outcell(; cell = split(rng,":")[1] |> String) = cell #default out location
    if teststate == false
        XLSX.writetable(wb, x, overwrite=true, sheetname=ws,anchor_cell=outcell()) #anchor_cell is the starting cell for pasting data to excel
    elseif teststate == true
        x
    end
end
