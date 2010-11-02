# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def random_of(*args)
    args[rand(args.size)]
  end
end
