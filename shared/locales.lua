function _(str, ...)
    local locale = Config.Language or 'en'
    local translations = Config.Locales[locale] or Config.Locales['en']
    
    local translation = translations[str] or str
    
    if ... then
        return string.format(translation, ...)
    end
    
    return translation
end