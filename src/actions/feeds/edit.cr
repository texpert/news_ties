class Feeds::Edit < BrowserAction
  get "/feeds/:feed_id/edit" do
    feed = FeedQuery.find(feed_id)
    html EditPage,
      operation: SaveFeed.new(feed),
      feed: feed
  end
end
