require 'rails_helper'

RSpec.describe "HomeControllers", type: :request do
  describe "GET /new" do
    expect(response).to render_template(:new)
  end
end
