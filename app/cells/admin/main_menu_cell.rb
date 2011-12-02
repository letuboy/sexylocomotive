class Admin::MainMenuCell < ::Admin::MenuCell

  protected

  def build_list
    add :contents, :url => admin_pages_url
    add :photo_galleries, :url => admin_photo_galleries_url
    add :settings, :url => edit_admin_current_site_url
  end

end
