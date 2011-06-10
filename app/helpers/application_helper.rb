module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def suggest_edit_js
    lightbox_js +
    %{
      <script type="text/javascript">
      //<![CDATA[

        document.write('#{suggest_edit_link}');

      //]]>
      </script>
    }
  end

  def suggest_edit_link
    %{
      <a href=\\'javascript:void(showBox("#{new_suggestion_url}"))\\';>Suggest an edit</a>
    }
  end

  def lightbox_js
    %~
      <script type="text/javascript">
      //<![CDATA[

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

          var div = document.createElement('div');
          div.style.zIndex = 3;
          div.id = 'box';
          div.style.position = (navigator.userAgent.indexOf('MSIE 6') > -1) ? 'absolute' : 'fixed';
          div.style.top = '200px';
          div.style.left = (width / 2) - (700 / 2) + 'px';
          div.style.height = '400px';
          div.style.width = '700px';
          div.style.backgroundColor = 'white';
          div.style.border = '2px solid silver';
          div.style.padding = '20px';
          document.body.appendChild(div);

          var p = document.createElement('p');
        //  var iframe = '<iframe src="' + iframe_source + '"></iframe>';
          var iframe = '<iframe src="' + iframe_source + '?url=' + window.location + '" ' +
                  'bordercolor="#000000" vspace="0" hspace="0" marginheight="0" marginwidth="0" style="padding: 0pt; margin: 0pt;" ' +
                  'allowtransparency="true" id="zozi_partner_iframe" frameborder="0" width="100%" height="100%" scrolling="no" ></iframe>';
          console.debug( iframe );
          p.innerHTML = iframe;
          div.appendChild(p);

          var a = document.createElement('a');
          a.innerHTML = 'Close window';
          a.href = 'javascript:void(0)';
          a.onclick = function()
          {
            document.body.removeChild(document.getElementById('layer'));
            document.body.removeChild(document.getElementById('box'));
          };

          div.appendChild(a);
        }

      //]]>
      </script>
    ~
  end
end
