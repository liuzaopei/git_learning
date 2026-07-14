-- Git 学习练习：Lua 测试脚本
-- 运行方式: lua git_practice_test.lua

local M = {}

local pass_count = 0
local fail_count = 0

function M.assert_equal(actual, expected, message)
    if actual == expected then
        pass_count = pass_count + 1
        print(string.format("[PASS] %s", message or "assert_equal"))
        return true
    end

    fail_count = fail_count + 1
    print(string.format(
        "[FAIL] %s | expected: %s, actual: %s",
        message or "assert_equal",
        tostring(expected),
        tostring(actual)
    ))
    return false
end

function M.assert_true(value, message)
    return M.assert_equal(value, true, message)
end

function M.run_all_tests()
    print("========== Git Learning Lua Tests ==========")

    -- 基础运算
    M.assert_equal(1 + 2, 3, "1 + 2 should equal 3")
    M.assert_equal("hello" .. " git", "hello git", "string concat")

    -- 表操作
    local list = { "lua", "git", "github" }
    M.assert_equal(list[1], "lua", "table index 1")
    M.assert_equal(#list, 3, "table length")

    -- 函数测试
    local function greet(name)
        return "Hello, " .. name .. "!"
    end
    M.assert_equal(greet("Git"), "Hello, Git!", "greet function")

    -- 条件分支
    local function is_even(n)
        return n % 2 == 0
    end
    M.assert_true(is_even(4), "4 is even")
    M.assert_equal(is_even(3), false, "3 is not even")

    print(string.format(
        "========== Result: %d passed, %d failed ==========",
        pass_count,
        fail_count
    ))

    return fail_count == 0
end

if arg and arg[0] and string.match(arg[0], "git_practice_test%.lua$") then
    local ok = M.run_all_tests()
    os.exit(ok and 0 or 1)
end

return M
