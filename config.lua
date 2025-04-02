Config = {}

Config.EvidenceBagItem = 'paperbag' -- Item name of EvidenceBag

Config.EvidenceBagStorage = {
    slots = 30,     -- Slots of EvidenceBag storage
    weight = 34000 -- Total weight for EvidenceBag (in grams)
}

-- Language settings
Config.Language = 'cs' -- Options: 'en', 'cs'

-- Translations
Config.Locales = {
    ['en'] = {
        -- Item
        ['item_label'] = 'Evidence Bag',
        ['item_description'] = 'Used to collect and preserve evidence',
        
        -- Notifications
        ['invalid_bag'] = 'Invalid evidence bag',
        ['failed_identifier'] = 'Failed to generate identifier',
        
        -- Progress Bar
        ['opening_bag'] = 'Opening evidence bag...',
        
        -- Stash Label
        ['evidence_bag_label'] = 'Evidence Bag #%s',
        
        -- Console Messages
        ['system_init'] = 'Evidence Bag System Initialized',
        ['system_shutdown'] = 'Evidence Bag System Shut Down',
        ['error_nil_identifier'] = 'Error: Attempted to open evidence bag with nil identifier',
        ['error_metadata'] = 'Failed to set metadata for evidence bag',
    },
    
    ['cs'] = {
        -- Item
        ['item_label'] = 'Sáček s důkazy',
        ['item_description'] = 'Používá se ke sběru a uchovávání důkazů',
        
        -- Notifications
        ['invalid_bag'] = 'Neplatný sáček s důkazy',
        ['failed_identifier'] = 'Nepodařilo se vygenerovat identifikátor',
        
        -- Progress Bar
        ['opening_bag'] = 'Otevírání sáčku s důkazy...',
        
        -- Stash Label
        ['evidence_bag_label'] = 'Sáček s důkazy #%s',
        
        -- Console Messages
        ['system_init'] = 'Systém sáčků s důkazy inicializován',
        ['system_shutdown'] = 'Systém sáčků s důkazy ukončen',
        ['error_nil_identifier'] = 'Chyba: Pokus o otevření sáčku s důkazy s chybějícím identifikátorem',
        ['error_metadata'] = 'Nepodařilo se nastavit metadata pro sáček s důkazy',
    }
}

Config.DebugMode = false