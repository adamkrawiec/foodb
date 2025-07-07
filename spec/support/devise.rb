module Controllers
  module DeviseHelpers
    def set_devise_mapping
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
      end
    end
  end
end
