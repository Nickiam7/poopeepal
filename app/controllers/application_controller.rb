class ApplicationController < ActionController::Base
   include DeviseAttributes
   include AfterLoginPath
   include SetTimeZone
end
