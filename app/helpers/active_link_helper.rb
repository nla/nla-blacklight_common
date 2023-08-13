module ActiveLinkHelper
  def active_link_class_path(path, class_name = "active")
    if current_page?(path)
      class_name
    end
  end

  def active_link_class_controller(controller = [], class_name = "active")
    class_name if controller.include? params[:controller]
  end

  def active_link_class(controller, action, class_name = "active")
    if current_page?(controller: controller, action: action)
      class_name
    end
  end
end
