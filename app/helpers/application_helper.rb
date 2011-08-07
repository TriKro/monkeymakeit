module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def scripts(scripts_name)
    # TODO: Allow this to pass an array back to layout.
    content_for(:scripts) { scripts_name }
  end

  def stylesheets(stylesheets_name)
    # TODO: Allow this to pass an array back to layout.
    content_for(:stylesheets) { stylesheets_name }
  end

  def fonts(fonts_name)
    # TODO: Allow this to pass an array back to layout.
    content_for(:fonts) { fonts_name }
  end

  def collaborate_js_tag(js_tag_params={})
    %{<script type="text/javascript" src="#{collaborate_js_url(:format => :js)}?#{js_tag_params.to_query}"></script>}
  end

  def auth_providers
    ActiveSupport::OrderedHash[
            :facebook, 'Facebook',
            :twitter,  'Twitter',
#            :open_id,  'OpenID',
    ]
  end

  def facebook_iframe_src(invite_url)
    invite_url = ERB::Util.url_encode(invite_url)
    "http://www.facebook.com/plugins/like.php?href=#{invite_url};send=false&amp;layout=button_count&amp;width=100&amp;show_faces=false&amp;action=recommend&amp;colorscheme=light&amp;font&amp;height=21"
  end

end
