require 'cURL'
require 'site'

c = cURL.easy_init()
c:setopt_useragent("Lua WikiBot")
--c:setopt_useragent("Mozilla/5.0 (Windows; U; Windows NT 5.0; de; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6")

Page = {}
Page.__index = Page

function Page:create(site, pageName)
	local page = {}
	setmetatable(page,Page)
	
	local page.site = Site:create("en", "wikibooks")
	local page.name = pageName
	local page.text = ""
	
	return page
end

function extractContent(string)
	
end

function Page:get()
	assert(self, "self has not been created")
	assert(self.site, "site is nil")
	
	c:setopt_url("http://" .. self.site.http .. "/w/api.php")
	--print("site name is: " .. "http://" .. self.site.http)
	
	post_data = "action=query&prop=revisions&rvprop=content&format=xml&titles=" .. self.name
	c:setopt_post(1)
	c:setopt_postfields(post_data)
	c:setopt_postfieldsize(#post_data)
	
	local writefunction = {function(str)
		self.text = extractContent(str)
	end}
	c:perform(writefunction)
end

