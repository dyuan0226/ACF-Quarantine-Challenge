# require needed files
require 'helpers/deletions'
require 'helpers/activeable'

# create AppHelpers
module AppHelpers
  include AppHelpers::Deletions
  include AppHelpers::Activeable::ClassMethods
  include AppHelpers::Activeable::InstanceMethods
end