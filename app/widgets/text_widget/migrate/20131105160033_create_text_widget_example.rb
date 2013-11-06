class CreateTextWidgetExample < RailsConnector::Migration
  def up
    homepage = Obj.find_by_path("/website/en")

    add_widget(homepage, "main_content", {
      _obj_class: "TextWidget",
      content: '<p>Nullam sed velit libero. Nullam pharetra metus non justo lobortis, eu vehicula magna
        mollis. Suspendisse feugiat volutpat neque, eget volutpat nulla. Phasellus non ipsum ac
        ipsum venenatis iaculis. Maecenas dictum congue nulla id fringilla. Suspendisse sit amet
        enim dapibus, volutpat dui quis, suscipit nunc. Morbi imperdiet pellentesque augue, at
        ornare mauris consectetur faucibus.</p>'
    })
  end

  private

  def add_widget(obj, attribute, widget)
    widget.reverse_merge!({
      _path: "_widgets/#{obj.id}/#{SecureRandom.hex(8)}",
    })

    widget = create_obj(widget)

    revision_id = RailsConnector::Workspace.current.revision_id
    definition = RailsConnector::CmsRestApi.get("revisions/#{revision_id}/objs/#{obj.id}")

    widgets = definition[attribute] || {}
    widgets['layout'] ||= []
    widgets['layout'] << { widget: widget['id'] }

    update_obj(definition['id'], attribute => widgets)
  end
end