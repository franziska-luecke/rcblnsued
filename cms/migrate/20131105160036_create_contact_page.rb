class CreateContactPage < ::RailsConnector::Migration
  def up
    create_obj_class(
      name: 'ContactPage',
      type: 'publication',
      title: 'Contact',
      attributes: [
        {:name=>"headline", :type=>:string, :title=>"Headline"},
        {:name=>"content", :type=>:html, :title=>"Content"},
        {:name=>"crm_activity_type", :type=>:string, :title=>"CRM Activity Type"},
        {:name=>"show_in_navigation", :type=>:enum, :title=>"Show in navigation", :values=>["Yes", "No"]},
        {:name=>"sort_key", :type=>:string, :title=>"Sort key"},
      ],
      preset_attributes: {},
      mandatory_attributes: nil
    )
  end
end
