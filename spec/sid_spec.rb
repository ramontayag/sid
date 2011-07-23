require 'spec_helper'

describe 'Sid' do
  before do
    reset_database
  end

  it "should auto increment the sid field of a model" do
    Page.create(:account_id => 1).sid.should == 1
    Page.create(:account_id => 1).sid.should == 2
    Page.create(:account_id => 1).destroy
    Page.create(:account_id => 1).sid.should == 3

    Page.create(:account_id => 2).sid.should == 1
    Page.create(:account_id => 1).sid.should == 4
    Page.create(:account_id => 2).sid.should == 2

    Page.find_by_sid(2).destroy
    Page.create(:account_id => 1).sid.should == 5
  end
end
