require 'spec_helper'

describe Timelog do
	before(:each) do
		@alice = User.create!(email:"alice@example.com", password:"alicePassword")
		@start = Timelog.kinds[:start]
		@stop = Timelog.kinds[:stop]
	end

	describe "kind" do
		it "should set the given kind" do
			t = Timelog.create! kind: @start, user: @alice
			t.kind.should eq(@start)
		end
		it "should give the correct next kind" do
			t = Timelog.new kind: @start, user: @alice
			t2 = Timelog.new kind: @stop, user: @alice
			t.next_kind.should eq(@stop)
			t2.next_kind.should eq(@start)
			# Timelog.next_kind(@start).should eq(@stop)
			# Timelog.next_kind(@stop).should eq(@start)
		end
		describe "no kind is given" do
			it "should start with start" do
				t = Timelog.create! user: @alice
				t.kind.should eq(@start)
			end
			it "should give stop when last was start" do
				Timelog.create! user: @alice, kind: @start
				t = Timelog.create! user: @alice
				t.kind.should eq(@stop)
			end
			it "should give start when last was stop" do
				Timelog.create! user: @alice, kind: @stop
				t = Timelog.create! user: @alice
				t.kind.should eq(@start)
			end
		end
	end
end
