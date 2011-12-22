package = "LuaWikibot"
version = "0.1-1"
source = {
	--url = "http://..." -- We don't have on yet
}

description = {
	summary = "A Wikibot library for Lua",
	detailed = [[
		This is a basic wiki bot for making automated edits to sites using the 
		mediawiki API e.g. Wikipedia, Wikibooks, wikinews ...
	]],
	--homepage= "http://...", --still don't have one
	license = "GPLv3",
	maintainer = "Jacob Hacker(Hethrir)"
}
dependencies = {
	"lua >= 5.1",
	"lua-cjson >=  1.0.4",
}
build = {
	type = "builtin",
	modules = {
		wikibot = "src/wikibot.lua",
		page = "src/page.lua",
		site = "src/page.lua"
	}
}
