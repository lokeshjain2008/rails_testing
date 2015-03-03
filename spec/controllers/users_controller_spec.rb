require 'rails_helper'

=begin
for the ajax requets to test
xhr :post, :add_chips, @params
==>This can be other way to do this
	@params = {:chip_color => 'red', :format => 'js'}
...
post :add_chips, @params
Note: format should b included in the params

adding support function for the testing methods
goto 
support/**.rb
need to include them from rails_helper:file


=end

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      check_title
      expect(response).to have_http_status(:success)
    end
  end

end
