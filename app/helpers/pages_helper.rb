module PagesHelper
  def cargo_description
    [:Cargo1, :Cargo2, :Cargo3, :Cargo4]
  end

  def departments
    [:General, :Crewing, 'Technical department']
  end

  def countries
    @countries ||= Country.where(independent: 1).order("`order` desc, `name_#{I18n.locale}` asc")
  end
  
  def positions
    ['Master','Chief Officer','Second Officer','Third Officer','Boatswain','Able Seaman','Ordinary Seaman','Cook',
     'Able Seaman &#47; Cook','Chief','Engineer','Second Engineer','Third Engineer','Electro Engineer','Motorman',
     'Motorman &#47; Welder','Able Seaman &#47; Welder','Motorman &#47; Turner','Welder','Turner']
  end
  
  def english_levels
    ['Elementary', 'Pre Intermediate', 'Intermediate', 'Upper Intermediate', 'Advanced']
  end
  
  def vessel_type
    ['General Cargo','Dry Cargo','Bulk Carrier','Container','Heavy lift','Multipurpose','Tanker','Chemical Tanker',
     'Oil Tanker','Reefer','RO-RO','LO-RO','Ferry Boat','Off-Shore','AHTS','Supply Vessel','Self-Submerged','Passenger',
     'Dredger','Fishing trawler','Floating Crane','Hydrographic Research','Sailing Ship','Tug','Yacht','Other.']
  end
  
  def vessel_flags
    ['Albania','Antigua & Barbuda','Bahrain','Barbados','Belgium','Belize','Bermuda','Bulgaria','Cambodia','Cayman Islands',
     'China','Comoros','Cyprus','Denmark','Georgia','Germany','Gibraltar','Greece','Holland','Hong Kong','Iran','Ireland',
     'Isle of Man','Israel','Italy','Kazakhstan','Kirgizia','Kiribati','Lebanon','Liberia','Lithuania','Luxemburg','Malta',
     'Marshall islands','Mauritania','Mauritius','Moldova','Mongolia','Monrovia','Namibia','Netherlands','Netherlands Antilles',
     'Nicosia','Norway','Panama','Portugal','Russia','Sierra Leone','Singapore','Slovakia','Sri lanka','St.Kitts & Nevis',
     'St.Vincent & Grenadines','Switzerland','Turkey','UK','Ukraine','USA']
  end
  
  def ranks
    ['Master','Chief Officer','Second Officer','Third Officer','Boatswain','Able Seaman','Ordinary Seaman','Cook',
     'Able Seaman &#47; Cook','Chief','Engineer','Second Engineer','Third Engineer','Electro Engineer','Motorman',
     'Motorman &#47; Welder','Able Seaman &#47; Welder','Motorman &#47; Turner','Welder','Turner']
  end
end
