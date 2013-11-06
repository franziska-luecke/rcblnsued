class CreateBlog < ::RailsConnector::Migration
  def up
    create_obj_class(
      name: 'Blog',
      type: 'publication',
      title: 'Blog',
      attributes: [
        {:name=>"headline", :type=>:string, :title=>"Headline"},
        {:name=>"disqus_shortname", :type=>:string, :title=>"Disqus Shortname"},
        {:name=>"description", :type=>:text, :title=>"Description"},
      ],
      preset_attributes: {},
      mandatory_attributes: nil
    )
  end
end
