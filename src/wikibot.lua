require 'page'

wikibot = {}
wikibot.__index = wikibot

function wikibot:setUser(userTable)
	assert(userTable ~= nil, "userTable is nil")
	assert(type(userTable) ~= table, "you must give setUser a table, got type " .. type(userTable))
	
	self.site = Site:create(userTable.language, userTable.family)
	self:login(userTable.language, userTable.family)
end

function wikibot:setMessage(message)
	assert(message ~= nil, "you must give setMessage a message")
	assert(type(message) ~= "string", "message must be a string")
	
	
end

function wikibot:run(arg, treat)
	assert(treat, "requires a treat() function")
	assert(#arg > 0, "you must specify a page to work on")
	
	test = Page:create(site, arg[1])
	treat(site, test)
end

function wikibot:login(username, password)
	
end

