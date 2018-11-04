class ApplicationController < ActionController::Base
   include DeviseAttributes
   include AfterLoginPath
end
