ActiveAdmin.setup do |config|

  config.site_title = "Ono Burrito"
  config.site_title_link = "/items"
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.allow_comments = false
  config.show_comments_in_menu = false
  config.batch_actions = true

end
