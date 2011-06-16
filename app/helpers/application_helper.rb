module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def lightbox_link( link_text )
    the_link = %{<a href=\\'javascript:void(showBox("#{new_suggestion_url}"))\\';>#{ link_text }</a>}
    %{
      <script type="text/javascript">
      //<![CDATA[
        document.write('#{ the_link }');
      //]]>
      </script>
    }.strip_lines!
  end

  def lightbox_button( button_image )
    button = %{<a href=\\'javascript:void(showBox("#{new_suggestion_url}"))\\'; style="border-bottom: none !important; text-decoration: none;"><img src="#{root_url}images/#{button_image}" /></a>}
     %{
      <script type="text/javascript">
      //<![CDATA[
        document.write('#{button}');
      //]]>
      </script>
    }.strip_lines!
  end

  def lightbox_js( options = {} )
    javascript = %~
      function showBox(iframe_source)
      {
        var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;

        var layer = document.createElement('div');
        layer.style.zIndex = 2;
        layer.id = 'layer';
        layer.style.position = 'absolute';
        layer.style.top = '0px';
        layer.style.left = '0px';
        layer.style.height = document.documentElement.scrollHeight + 'px';
        layer.style.width = width + 'px';
        layer.style.backgroundColor = 'black';
        layer.style.opacity = '.6';
        layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=60)");
        document.body.appendChild(layer);

        var box = document.createElement('div');
        box.style.zIndex = 3;
        box.id = 'box';
        box.style.position = 'absolute';
        box.style.top = '100px';
        box.style.left = (width / 2) - (600 / 2) + 'px';
        box.style.height = '500px';
        box.style.width = '600px';
        box.style.margin = '0 auto';
        box.style.border = '7px solid #00b7fb';
        box.style.backgroundColor = '#e6e6e6';
        document.body.appendChild(box);

        var spinner = document.createElement('img');
        spinner.id = 'spinner';
        spinner.src = '#{root_url}images/spinner.gif';
        spinner.style.position = 'absolute';
        spinner.style.top = '220px';
        spinner.style.left = '260px';
        spinner.style.zIndex = -1;
        box.appendChild(spinner);

        var iframe_span = document.createElement('span');
        var iframe = '<iframe src="' + iframe_source + '?url=#{ options[ :demo ] ? 'http://grasshopperherder.com/' : "' + window.location + '" }" ' +
                'bordercolor="#000000" vspace="0" hspace="0" marginheight="0" marginwidth="0" style="padding: 0pt; margin: 0pt;" ' +
                'allowtransparency="true" id="zozi_partner_iframe" frameborder="0" width="100%" height="500px" scrolling="no" ></iframe>';
        console.debug( iframe );
        iframe_span.innerHTML = iframe;
        box.appendChild(iframe_span);


        var close = document.createElement('a');
        close.id = 'close_button';
        close.innerHTML = '<img src="#{root_url}images/button-closethisoverlay_overdown.png"/>';
        close.style.position = 'absolute';
        close.style.top = '2px';
        close.style.right = '2px';
        close.href = 'javascript:void(0)';
        close.onclick = function()
        {
          document.body.removeChild(document.getElementById('layer'));
          document.body.removeChild(document.getElementById('box'));
        };

        box.appendChild(close);

      }
    ~.compact_whitespace

    %~
      <script type="text/javascript">
      //<![CDATA[
        #{javascript}
      //]]>
      </script>
    ~.strip_lines!
  end
end
