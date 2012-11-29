require 'rspec'
require './ChimpMailService'
require 'pry'

describe MoveChimpMailer  do
  before :all do
  	#these are params from http call
  	#Alan needs access to move.com github
  	params = {
  		:to => 'apies@move.com',
  		:text => 'THIS IS A TEST EMAIL!',
  		:subject => 'this is a test subject'
  	}
  	@mailer = MoveChimpMailer.invite_email(params)
  end

  it "should have some content in the template" do
  	@mailer.to_s.should match(/THIS IS A TEST EMAIL!/)
  end

  it "should be able to send an email" do
  	@mailer.deliver.should be_true 
  end

	
end
	
