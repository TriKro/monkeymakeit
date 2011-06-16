module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def collaborate_js_tag(js_tag_params={})
    %{<script type="text/javascript" src="#{root_url}scripts/collaborate.js?#{js_tag_params.to_query}"></script>}
  end

end
