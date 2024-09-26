-- test.lua

local lu = require('luaunit')

function add(a, b)
    return a + b
end

TestAdd = {}
    function TestAdd:testAddPositive()
        lu.assertEquals(add(1, 1), 2)
    end

    function TestAdd:testAddNegative()
        lu.assertEquals(add(-1, 1), 0)
    end

    function TestAdd:testAddZero()
        lu.assertEquals(add(0, 0), 0)
    end

os.exit(lu.LuaUnit.run())

-- Run tests using: lua test.lua
-- Make sure to install LuaUnit: luarocks install luaunit
