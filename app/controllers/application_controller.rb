class ApplicationController < ActionController::Base
  include Clearance::Controller

  def self.render_component(component)
    render(component, layout: false)
  end
end
