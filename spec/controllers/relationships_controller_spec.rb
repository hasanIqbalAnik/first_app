require 'spec_helper'

describe RelationshipsController do
  describe "access control" do
    it "should require signin to create" do

    end
    it "should require signin for destroy" do

    end

  end
  describe "Post 'create'" do
    before(:each) do
      @user = test_sign_in(Factory(:user))
      @followed = Factory(:user, :email => Factory.next(:email))
    end
    it "should create a new relationship" do
      lambda do
        post :create, :relationship => {:followed_id => :followed}
        response.should be_redirect
      end.should change(Relationship, :count).by(1)
    end

    it "should create new relationship using ajax" do
      lambda do
        xhr :post, :create, :relationship => {:followed_id => @follwed}
        response.should be_success

      end.should change(Relationship, :count).by(1)
    end
  end
  describe "Delete 'destroy'" do
    before(:each) do
      @user = test_sign_in(Factory(:user))
      @followed = Factory(:user, :email => Factory.next(:email))
      @user.followed!(@followed)
      @relationship = @user.relationships.find_by_followed_id(@followed)
    end
    it "should destroy a relationship" do
      lambda do
        delete :destroy, :id => @relationship
        response.should be_redirect

      end.should change(Relationship, :count).by(-1)
    end
    it "should destroy a relationship using ajax" do
      lambda do
        xhr :delete, :destroy, :id => @relationship
        response.should be_success
      end.should change(Relationship, :count).by(-1)
    end

  end
end