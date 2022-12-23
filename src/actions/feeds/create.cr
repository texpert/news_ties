class Feeds::Create < BrowserAction
  post "/feeds" do
    SaveFeed.create(params) do |operation, feed|
      if feed
        flash.success = "The record has been saved"
        redirect Show.with(feed.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
