require 'action_mailer'
begin
  require 'pony'
rescue LoadError
  puts 'pony is not installed'
end
require 'yaml'

require 'sms_fu/sms_fu'
require 'sms_fu/sms_fu_helper'
require 'sms_fu/sms_notifier'