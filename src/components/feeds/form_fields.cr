class Feeds::FormFields < BaseComponent
  needs operation : SaveFeed

  def render
    mount Shared::Field, operation.title, &.text_input(autofocus: "true")
    mount Shared::Field, operation.url
  end
end
