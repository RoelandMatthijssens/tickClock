require 'rails_helper'


RSpec.describe User, type: :model do
	before(:each) do
		alice = User.create!(email: "alice@example.com", password:"alicePassword")
		bob = User.create!(email: "bob@example.com", password:"bobPassword")
	end
	it "should describe user relations" do
		alice.supervisors << bob
		alice.reload!
		bob.reload!
		alice.supervisors.should equal([bob])
		bob.subordinates.should equal([alice])
	end
end
