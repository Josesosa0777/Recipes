require "test_helper"

class ChefsEditTest < ActionDispatch::IntegrationTest
	def setup
		@chef = Chef.create!(chefname: "jose", email: "jose@example.com",
                          password: "password", password_confirmation: "password")
	end
	test "reject an invalid edit" do
		get edit_chef_path(@chef)
	    assert_template 'chefs/edit'
	    patch chef_path(@chef), params: { chef: { chefname: " ", 
	                              email: "jose@example.com" } }
	    assert_template 'chefs/edit'
	    assert_select 'h2.panel-title'
	    assert_select 'div.panel-body'
  	end

  	test "accept valid edit" do
  		get edit_chef_path(@chef)
  		assert_template 'chefs/edit'
    	patch chef_path(@chef), params: { chef: { chefname: "jose1", 
                                email: "jose1@example.com" } }
	    assert_redirected_to @chef
	    assert_not flash.empty?
	    @chef.reload
	    assert_match "jose1", @chef.chefname
	    assert_match "jose1@example.com", @chef.email
 	end
  # test "the truth" do
  #   assert true
  # end
end
