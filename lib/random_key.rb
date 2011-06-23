module RandomKey
  def self.included(base)
    base.class_eval do
      validates :random_key, :presence => true, :uniqueness => true
      before_validation(:create_random_key, :on => :create)
    end
  end

  private

  def create_random_key
    seed = SecureRandom.hex( 64 )  # sha512 pattern (128 hex chars)
    ( rand( 5 ) + SecureRandom.random_number( 5 ) + 2 ).times{ seed = seed.sha512 }  # fold it with sha512 algorithm a few times
    self.random_key =  seed.to_i( 16 ).to_s( 36 )[ 0...32 ]
  end
end

