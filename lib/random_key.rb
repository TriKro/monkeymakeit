module RandomKey
  def self.included(base)
    base.class_eval do
      validates :random_key, :presence => true, :uniqueness => true
      before_validation(:create_random_key, :on => :create)
    end
  end

  private

  def create_random_key
    begin
      key_candidate = short_key
    end while ( self.class.where( :random_key => key_candidate ).count > 0 )
    self.random_key = key_candidate
  end

  def short_key( max_length = 32 )
    raise "Please use a max_length of 100 or less" if max_length > 100
    secure_key[ 0...max_length ]
  end

  # Returns: 128 random hex chars (same pattern as a sha512), converted to base 36
  def secure_key
    key_hex = SecureRandom.hex( 64 )
    ( rand( 5 ) + SecureRandom.random_number( 5 ) + 2 ).times{ key_hex = key_hex.sha512 }  # fold it with sha512 algorithm a few times
    key_base_36 = key_hex.to_i( 16 ).to_s( 36 )
    key_base_36
  end
end

