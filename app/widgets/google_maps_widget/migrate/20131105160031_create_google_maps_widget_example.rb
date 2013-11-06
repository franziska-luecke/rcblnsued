class CreateGoogleMapsWidgetExample < ::RailsConnector::Migration
  def up
    homepage = Obj.find_by_path("/website/en")

    add_widget(homepage, "main_content", {
      _obj_class: "GoogleMapsWidget",
      address: 'Infopark, Kitzingstrasse 15, 12277 Berlin'
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
