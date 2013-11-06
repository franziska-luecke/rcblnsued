class CreateTeaserWidget < ::RailsConnector::Migration
  def up
    create_obj_class(
      name: 'TeaserWidget',
      type: 'publication',
      title: 'Teaser widget',
      attributes: [
        {:name=>"headline", :type=>:string, :title=>"Headline"},
        {:name=>"content", :type=>:html, :title=>"Content"},
        {:name=>"link_to", :type=>:linklist, :title=>"Link", :max_size=>1},
      ],
      preset_attributes: {},
      mandatory_attributes: nil
    )
  end
end
