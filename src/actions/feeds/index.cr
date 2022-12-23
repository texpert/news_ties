class Feeds::Index < BrowserAction
  get "/feeds" do
    html IndexPage, feeds: FeedQuery.new
  end
end
