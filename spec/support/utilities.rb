def full_title(page_title)
	base_title = "Ruby on Rails Tutorial Sample App"
	if page_title.empty?
		base_titleS
	else
		"#{base_title} | #{page_title}" 
	end
end

def sign_in(user, options={})
	if options[:no_capybara]
		remeber_token = User.new_remember_token
		cookies[:remeber_token] = remember_token
		user.update_attribute(:remember_token, User.hash(remember_token))
	else 
		visit signin_path
		fill_in "Email", with: user.Email
		fill_in "Password", with: user.Password
		click_button "Sign in"
	end
end