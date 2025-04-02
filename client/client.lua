local ox_inventory = exports.ox_inventory
local resourceName = GetCurrentResourceName()

function OpenEvidenceBag(data, slot)
    if not data or not slot then 
        lib.notify({
            title = _('item_label'),
            description = _('invalid_bag'),
            type = 'error'
        })
        return 
    end
    
    lib.progressBar({
        duration = 1000,
        label = _('opening_bag'),
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
            ox_inventory:openInventory('stash', 'bag_'..identifier)
        else
            lib.notify({
                title = _('item_label'),
                description = _('failed_identifier'),
                type = 'error'
            })
        end
    else
        TriggerServerEvent(resourceName..':openEvidenceBag', slot.metadata.identifier)
        ox_inventory:openInventory('stash', 'bag_'..slot.metadata.identifier)
    end
end

exports('openEvidenceBag', OpenEvidenceBag)
exports('openEvidence', OpenEvidenceBag)