require "application_system_test_case"

module Mobile
  class NavigationBarTest < MobileSystemTestCase
    test "can access login page via burger menu" do
      visit root_path

      find(".navbar-toggler").click
      click_on "Einloggen"

      assert_current_path login_path
    end
  end
end
