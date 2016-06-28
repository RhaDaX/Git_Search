require 'rails_helper'

# Test to see if an error raise for no user found on Pages#Home

RSpec.describe PagesController, type: :controller do
  describe "Pages #Home Form" do
    before { @user = Octokit.user "" }
    it "Handle error if no user found" do
      @user.should_not be_valid
    end
  end
end 

