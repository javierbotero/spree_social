Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu.html.erb',
  name: 'add_social_providers_link_configuration_menu',
  insert_after: 'li.sidebar-menu-item.d-block.w-100.position-relative',
  text: '<li class="sidebar-menu-item d-block w-100 text-muted"><%= configurations_sidebar_menu_item Spree.t(:social_authentication_methods), spree.admin_authentication_methods_path %></li>'
)
