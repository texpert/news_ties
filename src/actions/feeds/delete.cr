class Feeds::Delete < BrowserAction
  delete "/feeds/:feed_id" do
    feed = FeedQuery.find(feed_id)
    DeleteFeed.delete(feed) do |_operation, _deleted|
      flash.success = "Deleted the feed"
      redirect Index
    end
  end
end
