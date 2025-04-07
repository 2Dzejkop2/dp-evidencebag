local ox_inventory = exports.ox_inventory
local resourceName = GetCurrentResourceName()
local bagPrefix = 'bag_'

local itemLabel = _('item_label')
local invalidBag = _('invalid_bag')
local failedIdentifier = _('failed_identifier')
local openingBag = _('opening_bag')
local cannotPlaceBag = _('cannot_place_bag')

function OpenEvidenceBag(data, slot)
    if not data or not slot then 
        lib.notify({
            title = itemLabel,
            description = invalidBag,
            type = 'error'
        })
        return 
    end
    
    lib.progressBar({
        duration = 1000,
        label = openingBag,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer',
        },
    })
    
    if not slot.metadata or not slot.metadata.identifier then
        local identifier = lib.callback.await(resourceName..':getNewIdentifier', 1000, data.slot)
        if identifier then
            ox_inventory:openInventory('stash', bagPrefix..identifier)
        else
            lib.notify({
                title = itemLabel,
                description = failedIdentifier,
                type = 'error'
            })
        end
    else
        TriggerServerEvent(resourceName..':openEvidenceBag', slot.metadata.identifier)
        ox_inventory:openInventory('stash', bagPrefix..slot.metadata.identifier)
    end
end

exports('openEvidenceBag', OpenEvidenceBag)
exports('openEvidence', OpenEvidenceBag)