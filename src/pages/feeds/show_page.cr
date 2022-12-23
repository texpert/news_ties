class Feeds::ShowPage < MainLayout
  needs feed : Feed
  quick_def page_title, "Feed with id: #{feed.id}"

  def content
    link "Back to all Feeds", Feeds::Index
    h1 "Feed with id: #{feed.id}"
    render_actions
    render_feed_fields
  end

  def render_actions
    section do
      link "Edit", Feeds::Edit.with(feed.id)
      text " | "
      link "Delete",
        Feeds::Delete.with(feed.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_feed_fields
    ul do
      li do
        text "title: "
        strong feed.title.to_s
      end
      li do
        text "url: "
        strong feed.url.to_s
      end
    end
  end
end
