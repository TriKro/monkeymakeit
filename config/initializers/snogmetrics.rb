module Snogmetrics
  def kissmetrics_api_key
    if Rails.env.production?
      '4c67e3969c626932c5c577b2d8cfb5f67ced6f03'
    elsif Rails.env.staging?
      '98a063516cc865fa31833423a6a418ce5b717b2c'
    elsif Rails.env.development? || Rails.env.test?
      'dcab85462285621097277fae25ca542d32491970'
    end
  end

  def output_strategy
   :live
  end

end