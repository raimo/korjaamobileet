module JokesHelper

  def short_body(body)
    truncate(body, :length => 55, :omission => '...')
  end
end
