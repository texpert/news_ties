class Feeds::Show < BrowserAction
  get "/feeds/:feed_id" do
    html ShowPage, feed: FeedQuery.find(feed_id)
  end
end
