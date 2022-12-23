class Feeds::NewPage < MainLayout
  needs operation : SaveFeed
  quick_def page_title, "New Feed"

  def content
    h1 "New Feed"
    render_feed_form(operation)
  end

  def render_feed_form(op)
    form_for Feeds::Create do
      # Edit fields in src/components/feeds/form_fields.cr
      mount Feeds::FormFields, op

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
