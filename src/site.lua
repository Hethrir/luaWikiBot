Site = {}
Site.__index = Site

function siteHTTP(lang, family)
	return lang .. "." .. family .. ".org"
end

function Site:create(lang, family)
	site = {}
	setmetatable(site, Site)
	
	site.lang = lang
	site.family = family
	site.http = siteHTTP(lang, family)
	
	return site
end

