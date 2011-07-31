require 'spec_helper'

describe 'Sid' do
  before do
    reset_database
  end

  it "should auto increment the sid field of a model" do
    Page.create!(:account_id => 1).sid.should == 1
    Page.create!(:account_id => 1).sid.should == 2
    Page.create!(:account_id => 1).destroy
    Page.create!(:account_id => 1).sid.should == 3

    Page.create!(:account_id => 2).sid.should == 1
    Page.create!(:account_id => 1).sid.should == 4
    Page.create!(:account_id => 2).sid.should == 2

    Page.find_by_sid(2).destroy
    Page.create!(:account_id => 1).sid.should == 5
  end

  it "should allow setting of sid column" do
    Category.create(:account_id => 1).alternative_sid.should == 1
  end

  it "should validate uniqueness of sid within the scope" do
    Page.new(:account_id => 1, :sid => 1).save
    Page.new(:account_id => 1, :sid => 1).should_not be_valid
    Page.new(:account_id => 2, :sid => 1).should be_valid
  end
end
