require 'spec_helper'
describe "user" do
	before(:each) do
		@alice = User.create!(email:"alice@example.com", password:"alicePassword")
		@bob = User.create!(email:"bob@example.com", password:"bobPassword")
	end

	describe "relations" do

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

	it "shoud get last timelog of user" do
		Timelog.create! user: @alice, kind: Timelog.kinds[:start], time: 1.hour.ago
		expected = Timelog.create! user: @alice, kind: Timelog.kinds[:stop], time: 20.minutes.ago
		Timelog.create! user: @alice, kind: Timelog.kinds[:stop], time: 3.hours.ago
		Timelog.create! user: @bob, kind: Timelog.kinds[:stop], time: 10.minutes.ago
		@alice.last_timelog.should eq(expected)
	end
end
