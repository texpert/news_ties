class Feeds::IndexPage < MainLayout
  needs feeds : FeedQuery
  quick_def page_title, "All Feeds"

  def content
    h1 "All Feeds"
    link "New Feed", to: Feeds::New
    render_feeds
  end

  def render_feeds
    ul do
      feeds.each do |feed|
        li do
          link feed.title, Feeds::Show.with(feed)
        end
      end
    end
  end
end
