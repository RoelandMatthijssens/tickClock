require 'spec_helper'
describe "user" do
	before(:each) do
		@alice = User.create!(email:"alice@example.com", password:"alicePassword")
		@bob = User.create!(email:"bob@example.com", password:"bobPassword")
	end
	it "should create supervisions" do
		expect {@alice.supervisors << @bob}.to change(Supervision, :count).by(1)
	end
	it "should have supervisors" do
		@alice.supervisors << @bob
		@alice.reload
		@alice.supervisors.should eq([@bob])
		@alice.subordinates.should be_empty
	end
	it "should have subordinates" do
		@alice.subordinates << @bob
		@alice.reload
		@alice.subordinates.should eq([@bob])
		@alice.supervisors.should be_empty
	end
	it "should have a bidirectional relation" do
		@alice.supervisors << @bob
		@bob.reload
		@bob.subordinates.should eq([@alice])
	end
end
