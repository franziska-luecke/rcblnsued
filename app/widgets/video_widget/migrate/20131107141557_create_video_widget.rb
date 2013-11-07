class CreateVideoWidget < ::RailsConnector::Migration
  def up
    create_obj_class(
      name: 'VideoWidget',
      type: 'publication',
      title: 'Video widget',
      attributes: [
        {:name=>"source", :type=>:reference, :title=>"Source"},
        {:name=>"poster", :type=>:reference, :title=>"Poster"},
        {:name=>"width", :type=>:string, :title=>"Width"},
        {:name=>"height", :type=>:string, :title=>"Height"},
        {:name=>"autoplay", :type=>:enum, :title=>"Autoplay this video?", :values=>["Yes", "No"]},
      ],
      preset_attributes: {"width"=>660, "height"=>430, "autoplay"=>"No"},
      mandatory_attributes: nil
    )
  end
end
