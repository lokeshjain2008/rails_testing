require 'rails_helper'

RSpec.feature "UsersFlows", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  #
  subject {page}

  describe "Sign up page" do 
  	before {visit signup_path}

  	it {is_expected.to have_selector('h1', text: 'Signup') }
  	it {is_expected.to have_selector('title', text: "signup page")}

  end

end
