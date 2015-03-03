require 'rails_helper'
=begin 
Here we will study let, let! and before(:each) and before(:all)
let is lazy execution.. let! will be called like before(:each)
before(:all) will be called once 
Note let, let! : will be chached in per example..


=end

RSpec.feature "LetBefores", type: :feature, focus:true do

  # This is lazy execution 	
  let(:count){ 
  	puts "More values..."
  	$count += 1 
  }
  # just like before :each
  let!(:more_count) {
  	p "This more count"
  	$data +=1 }

# Before :all this will be called before all
 before(:all){$count= 0
 	puts "lokesh"
 	$data = 33
 } 

 subject(:user){ "lokesh jain" }

  describe "#index" do 
  	it "should say one" do 
  		#Note a the will be cached here
  		# expect(count).to eq(1)
  		#This will change
  		# expect(count).not_to eq(2)
  		# expect(count).to eq(1)

  		#Let! will be used
  		# expect(more_count).to eq(34)
  		# expect(more_count).to eq(34)
  		p subject
  	end
  # This will b changed in all the examples	
  subject {"subject changed..."}
  	it "should change value now" do 
  		#this will changed in the example
  		# expect(count).to eq(2)
  		#this will make change
  		# expect(more_count).to eq(35)
  		# expect(more_count).to eq(35)
  		p subject
  	end
  end

  describe "see the subject" do 
  	it "#more value" do 
  		p subject
  	end
  end

end
