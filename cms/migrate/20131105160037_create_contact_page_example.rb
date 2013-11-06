class CreateContactPageExample < ::RailsConnector::Migration
  def path
    '/website/en/contact'
  end

  def up
    create_obj(
      _path: path,
      _obj_class: 'ContactPage',
      headline: 'Contact',
      content: '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
        proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',
      'crm_activity_type' => 'contact-form',
      'show_in_navigation' => 'Yes'
    )

    setup_crm
  end

  def setup_crm
    Infopark::Crm::CustomType.find('contact-form')
  rescue ActiveResource::ResourceNotFound
    custom_attributes = [
      { name: 'email', title: 'Email Adress', type: 'string' },
      { name: 'message', title: 'Message', type: 'text', max_length: 1000 }
    ]

    Infopark::Crm::CustomType.create(
      kind: 'Activity',
      name: 'contact-form',
      states: ['open', 'closed'],
      icon_css_class: 'omc_activity_23',
      custom_attributes: custom_attributes
    )
  end
end