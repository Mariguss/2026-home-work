local counter = 0

request = function()
    counter = counter + 1
    local method = os.getenv("METHOD") or "GET"

    if method == "PUT" then
        return wrk.format("PUT", "/v0/entity?id=" .. counter, nil, "test_payload_data")
    else
        return wrk.format("GET", "/v0/entity?id=" .. counter)
    end
end
