class Feeds::Update < BrowserAction
  put "/feeds/:feed_id" do
    feed = FeedQuery.find(feed_id)
    SaveFeed.update(feed, params) do |operation, updated_feed|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_feed.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, feed: updated_feed
      end
    end
  end
end
