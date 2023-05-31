require 'rails_helper'

describe TasksController, type: :controller do
    describe "GET #index" do
        context "get all tasks of user" do
            DatabaseCleaner.clean
            user = FactoryBot.create(:user)
            before do
              sign_in user
              get :index
            end
            it { is_expected.to respond_with :ok }
            it { is_expected.to render_with_layout :application }
            it { is_expected.to render_template :index }
        end
    end
end