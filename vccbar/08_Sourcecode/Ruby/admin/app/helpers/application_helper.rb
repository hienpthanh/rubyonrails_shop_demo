module ApplicationHelper

  def header
    render template: "layouts/header"
  end
  def footer
    render template: "layouts/footer"
  end
  def sidebar
    render template: "layouts/sidebar"
  end
  def pageheader
    render template: "layouts/pageheader"
  end
  def error_messages_for
    render template: "shared/error_messages"
  end

end
