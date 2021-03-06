require 'calabash-android/calabash_steps'

Given (/^I am on the login window$/) do
	wait_for(:timeout => 5) {
		element_exists("* id:'address'")
	}
	check_element_exists("* id:'address'")
end

When (/^I enter address field with "(.*?)"$/) do |input|
	check_element_exists("* id:'address'")
	if (defined? ADDRESS) != nil
		input = ADDRESS
	end
	query("* id:'address'", setText:"#{input}")
end

And (/^I enter account field with "(.*?)"$/) do |input|
	check_element_exists("* id:'account'")
	if (defined? ACCOUNT) != nil
		input = ACCOUNT
	end
	query("* id:'account'", setText:"#{input}")
end

And (/^I enter password field with "(.*?)"$/) do |input|
	check_element_exists("* id:'password'")
	if input != "wrong_password" && (defined? PASSWORD) != nil
		input = PASSWORD
	end
	query("* id:'password'", setText:"#{input}")
end

And (/^I check HTTPS CheckBox$/) do
	check_element_exists("* id:'cb_https'")
	if (!query("* id:'cb_https'").first['checked'])
		tap_when_element_exists("* id:'cb_https'")
	end
end

And (/^I click on LOGIN Button$/) do
	check_element_exists("* id:'btn_login'")
	tap_when_element_exists("* id:'btn_login'")
end

Then (/^I should user login successfully$/) do
	wait_for_element_does_not_exist("DialogTitle id:'alertTitle'", :timeout => 10)
	wait_for_element_exists("DrawerLayout id:'drawer_layout'", :timeout => 10)
end
