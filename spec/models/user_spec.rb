require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each){
  	@user = User.new(name:"lokesh kuamr jain",email:"lokeshjain2008@gmail.com",
  		password: "lokesh",
  		password_confirmation: "lokesh"
  		)
  }

  	subject{@user}

  describe "#new" do 
  	it{is_expected.to respond_to(:name)}
  	it{is_expected.to respond_to(:email)}
  end

  describe "name should be nil then invalid" do 
  	before {
  		# @user.save
  		@user.name = nil
  		@user.email = nil
  	}
  	it { is_expected.to be_invalid}
  end

  describe "invalid email" do 

  	it{is_expected.to be_valid}
  end

  describe "User should be validated " do 
  	before{@user.save}
  	let(:found_user){User.find_by(email:@user.email)}
  	it{is_expected.to eq(found_user.authenticate(@user.password))}

  end

  describe "email should be unique" do 
    before{
      @user.save
      @user_with_same_email = @user.dup
    }
  
    it "should be invalid" do 
      @user_with_same_email.save
      expect(@user_with_same_email).to be_invalid

    end

    it "should email case insensitive" do 
      @user_with_same_email.email.upcase!
      @user_with_same_email.save
      expect(@user_with_same_email).to be_invalid 

    end

  end

end
