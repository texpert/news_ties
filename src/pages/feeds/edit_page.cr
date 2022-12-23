class Feeds::EditPage < MainLayout
  needs operation : SaveFeed
  needs feed : Feed
  quick_def page_title, "Edit Feed with id: #{feed.id}"

  def content
    link "Back to all Feeds", Feeds::Index
    h1 "Edit Feed with id: #{feed.id}"
    render_feed_form(operation)
  end

  def render_feed_form(op)
    form_for Feeds::Update.with(feed.id) do
      # Edit fields in src/components/feeds/form_fields.cr
      mount Feeds::FormFields, op

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
