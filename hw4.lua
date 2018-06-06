--
-- Created by IntelliJ IDEA.
-- User: Margaret
-- Date: 4/2/2018
-- Time: 2:02 PM
-- To change this template use File | Settings | File Templates.
--

data = {}
function receive (prod)
    local status, value = coroutine.resume(prod)
    return value
end

function send (x)
    coroutine.yield(x)
end

--reads input from the command line, same as producerconsumer producer function
function producer ()
    return coroutine.create(function ()
        while true do
            local x = io.read()     -- produce new value from command line
            send(x)
        end
    end)
end


--go through lines not in kelvin and send to store in table
--if, valid, send to outer function, if invalid, evit program
function filter (prod)
    return coroutine.create(function ()
        local line = 1
        while true do
            local input = receive(prod)   -- get new value
            local x = string.sub(input, 1, 1)
            --io.write(x)
            if x=="c" or x == "C" or x=="f" or x == "F" or x=="k" or x=="K" or x=="e" or x=="E"
                or tonumber(input) ~= nil then
                --convert values to kelvin
                send(input)
            end
        end
    end)
end


function consumer (prod)
    while true do
        local input = receive(prod)
        local x = string.sub(input, 1, 1)
        local temp = ""
        --if its just a number
        if tonumber(input) ~= nil then
            temp = input
            if tonumber(temp) >= 0 then
                --add to table if the number is above or equal to 0
                table.insert(data, temp)
            end

        elseif x=="c" or x == "C" or x=="f" or x == "F" or x=="k" or x=="K" then
            --parse lines and figure out value of temperature
            --get rid of spaces in string input
            input = string.gsub(input, "%s+", "")
            --io.write(input)
            local b = true --checks valid
            local i = string.sub(input, 2, 2) --second character of command, can be - or num
            local index = 1

            for j=2, string.len(input) do
                --check if character is valid
                index = index + 1
                i = string.sub(input, index, index)
                if i == "-" and index == 2 then
                    --fine, add to number
                    temp = temp .. i
                elseif i == "." then
                    --fine, add to number
                    temp = temp .. i
                elseif tonumber(i) ~= nil then
                    --fine, add to number

                    temp = temp .. i
                else
                    b = false
                end
            end

            if b == true then
                --local num = tonumber(temp) --temp is now a number, can be stored as a temperature

                if x=="c" or x == "C" then -- convert from celsius to kelvin
                    temp = temp + 273.15
                elseif  x=="f" or x == "F" then -- convert from fahrenheit to kelvin
                    temp = (temp + 459.67) * 5.0/9.0
                end
                --io.write("\n" .. temp)
                --make sure temp is valid
                if tonumber(temp) >= 0 then
                   --add to table if the number is above or equal to 0
                    table.insert(data, temp)
                end
            end
        elseif x=="e" or x=="E" then
            --prints number of stored value
            n = table.getn(data)
            if n > 0 then
                io.write("Number of samples: " .. n .. "\n")
                for i=1, n do
                    io.write(data[i] .. "\n")
                end
                --print average value
                io.write("Average value: ")
                local average = 0.0
                for i=1, n do
                    average = average + data[i]
                end
                average = average / n
                io.write(average .. "\n")
            else
                io.write("No samples stored\n")
            end
            do return end
        end
    end
end


consumer(filter(producer()))
