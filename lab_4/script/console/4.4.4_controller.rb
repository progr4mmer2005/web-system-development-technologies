class StaticPagesController < ApplicationController
  def home
  end
end

controller = StaticPagesController.new
p controller.class
p controller.class.superclass
p controller.class.superclass.superclass
p controller.class.superclass.superclass.superclass
p controller.class.superclass.superclass.superclass.superclass
p controller.class.superclass.superclass.superclass.superclass.superclass
p controller.home
