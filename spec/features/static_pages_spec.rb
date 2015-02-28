require 'rails_helper'

=begin 
This is the basic of all the testing.
created simpte static pages.
Now, what, i made no changes in any file . 
There is change in integration tests in rails . first it used to go to the requests 
and now they go to the features

```ruby
rails g spec:feature <name>
```

Now, what i included `guard-respec`

```ruby
guard init rspec
guard
```
See the magic now it runs the tests when there is file changes.

## Webdrivers for the capybara
1. selenium-webdriver : default
2. webkit-driver :chrome
3. poltergeist

```ruby
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
```
in the spec_helper file

Note: poltergeist will not open any visual part. 
it will do the terminal only 
Console.log will be printed to terminal 
page >> page.html
page.direver.render()
page.html wasted my huge time 

capybara --commands
js:true > rspec
@javascript > cucumber
save_page >> will be saved to tmp/capybara/ ::will be displayed to the terminal
save_and_open_page  >> """"
so, we will need gem 'launchy' to open the saved page 


=end

RSpec.feature "StaticPages", type: :feature do
  it "visit home page " do 

  	visit "/static_pages/home"
  	visit static_pages_home_path
  	# page.driver.render
  	# console.log("yes this is working man..")
  	# To launch the page in current state..
  	# save_and_open_page

  	# page.driver.render('_screenshot.png', :full => true)
  	expect(page).to have_content('#home')

  	# for phantom.js
  	# expect(page.html).to have_selector('title',text:"RailsTest")
  	# else
  	expect(page).to have_selector('title',text:"RailsTest")

  	click_link "home"
  	
  end
end
