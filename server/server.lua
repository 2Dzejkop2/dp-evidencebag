local registeredStashes = {}
local ox_inventory = exports.ox_inventory
local resourceName = GetCurrentResourceName()
local bagPrefix = 'bag_'

local validChars = {}
for i = 65, 90 do
    validChars[i-64] = string.char(i)
end

local function GenerateText(num)
    if not num or type(num) ~= 'number' then num = 3 end
    
    local str
    repeat 
        local chars = {}
        for i = 1, num do 
            chars[i] = validChars[math.random(1, #validChars)]
        end
        str = table.concat(chars)
    until str ~= 'POL' and str ~= 'EMS'
    
    return str
end

local function GenerateSerial(text)
    local safeText
    if text and type(text) == 'string' and #text > 3 then
        safeText = text
    else
        safeText = GenerateText(3)
    end
    
    local timestamp = tostring(os.time()):sub(-6)
    local randomNum = tostring(math.random(10000, 99999))
    
    return timestamp .. "-" .. safeText .. "-" .. randomNum
end

RegisterServerEvent(resourceName..':openEvidenceBag')
AddEventHandler(resourceName..':openEvidenceBag', function(identifier)
    if not identifier then
        print(_('error_nil_identifier'))
        return
    end
    
    if not registeredStashes[identifier] then
        ox_inventory:RegisterStash(bagPrefix..identifier, _('evidence_bag_label', identifier), 
            Config.EvidenceBagStorage.slots, Config.EvidenceBagStorage.weight, false)
        registeredStashes[identifier] = true
    end
end)

lib.callback.register(resourceName..':getNewIdentifier', function(source, slot)
    if not source or not slot then return nil end
    
    local newId = GenerateSerial()
    local success = ox_inventory:SetMetadata(source, slot, {identifier = newId})
    
    if success then
        ox_inventory:RegisterStash(bagPrefix..newId, _('evidence_bag_label', newId), 
            Config.EvidenceBagStorage.slots, Config.EvidenceBagStorage.weight, false)
        registeredStashes[newId] = true
        return newId
    else
        print(_('error_metadata'))
        return nil
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resourceName ~= resource then return end
    
    Wait(1000) 
    
    print("^2" .. _('system_init') .. "^7")
end)

AddEventHandler('onResourceStop', function(resource)
    if resourceName ~= resource then return end
    
    print("^2" .. _('system_shutdown') .. "^7")
end)