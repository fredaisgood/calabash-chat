require 'calabash-android/calabash_steps'

Given (/^I am in conversation "(.*?)"$/) do |conversation|
	if element_does_not_exist("* id:'drawer'")
		tap_when_element_exists("Toolbar AppCompatImageButton")
	end

	syntax = "AppCompatTextView id:'name' text:'#{conversation}'"
	q = query(syntax)
	while q.empty?
		scroll_down
		q = query(syntax)
	end
	tap_when_element_exists(syntax)
end

Then (/^I write message "(.*?)"$/) do |input|
	query("MsgMultiAutoCompleteTextView id:'message'", setText:"#{input}")
end

Then (/^I click send button$/) do
	tap_when_element_exists("AppCompatTextView id:'send'")
end

Then (/^I should see message "(.*?)"$/) do |expected|
	lastMessage = query("RecyclerView AppCompatTextView id:'message'").last['text']
	if expected != lastMessage
		raise "I DON'T see #{expected} in last message"
	end
end

Then (/^I should see og "(.*?)"$/) do |expected|
	lastTitle = query("RecyclerView AppCompatTextView id:'title'").last['text']
	if expected != lastTitle
		raise "I DON'T see #{expected} in last title"
	end
end

