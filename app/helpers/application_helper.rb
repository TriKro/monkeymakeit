module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def suggest_edit_js
    %{
      <script type="text/javascript">
      //<![CDATA[

            foo

      //]]>
      </script>
    }
  end
end
