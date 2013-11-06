class CreateGoogleMapsWidget < ::RailsConnector::Migration
  def up
    create_obj_class(
      name: 'GoogleMapsWidget',
      type: 'publication',
      title: 'Google maps widget',
      attributes: [
        {:name=>"address", :type=>:string, :title=>"Address"},
      ],
      preset_attributes: {},
      mandatory_attributes: nil
    )
  end
end
