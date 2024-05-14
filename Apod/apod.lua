local apiKey = "api-key"
local url = "https://api.nasa.gov/planetary/apod?api_key=" .. apiKey

function getAPOD()
    local response = http.get(url)
    
    if response then
        local responseBody = response.readAll()
        response.close()
        
        local apodData = textutils.unserializeJSON(responseBody)
        
        local copyright = apodData.copyright or "No copyright information"
        local date = apodData.date or "No date information"
        local explanation = apodData.explanation or "No explanation"
        local title = apodData.title or "No title"

        print("Title: " .. title)
        print("Date: " .. date)
        print("Copyright: " .. copyright)
        print("Explanation: " .. explanation)
        
        local monitor = peripheral.wrap("right")
        monitor.clear()
        monitor.setCursorPos(1, 1)
        monitor.write("Title: " .. title)
        monitor.setCursorPos(1, 2)
        monitor.write("Date: " .. date)
        monitor.setCursorPos(1, 3)
        monitor.write("Copyright: " .. copyright)
        monitor.setCursorPos(1, 4)
        monitor.write("Explanation:")
        local explanationLines = wrapText(explanation, monitor.getSize())
        for i, line in ipairs(explanationLines) do
            monitor.setCursorPos(1, 4 + i)
            monitor.write(line)
        end
    else
        print("Failed to get data from the API.")
    end
end

function wrapText(text, width)
    local lines = {}
    for line in text:gmatch("[^\n]+") do
        while #line > width do
            table.insert(lines, line:sub(1, width))
            line = line:sub(width + 1)
        end
        table.insert(lines, line)
    end
    return lines
end

getAPOD()