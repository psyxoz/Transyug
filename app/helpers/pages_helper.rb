module PagesHelper
  def cargo_description
    [:Cargo1, :Cargo2, :Cargo3, :Cargo4]
  end

  def departments
    [:Technical, 'Not technical']
  end

  def countries
    @countries ||= Country.where(independent: 1).order("`order` desc, `name_#{I18n.locale}` asc")
  end
  
  def positions
    ['Master','Chief Officer','Second Officer','Third Officer','Boatswain','Able Seaman','Ordinary Seaman','Cook',
     'Able Seaman/Cook','Chief','Engineer','Second Engineer','Third Engineer','Electro Engineer','Motorman',
     'Motorman/Welder','Able Seaman/Welder','Motorman/Turner','Welder','Turner']
  end
  
  def english_levels
    ['Elementary', 'Pre Intermediate', 'Intermediate', 'Upper Intermediate', 'Advanced']
  end
end
