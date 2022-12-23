class Feeds::New < BrowserAction
  get "/feeds/new" do
    html NewPage, operation: SaveFeed.new
  end
end
