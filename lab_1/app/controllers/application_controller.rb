class ApplicationController < ActionController::Base
  def hello_world
    render plain: "hello, world!"
  end

  def hello
    render plain: "¡Hola, mundo!"
  end

  def goodbye
    render plain: "goodbye, world!"
  end
end
