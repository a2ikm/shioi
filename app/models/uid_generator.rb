class UidGenerator
  def self.generate
    new.generate
  end

  CHARS = [
    ("a".."z").to_a,
    ("A".."Z").to_a,
    (0..9).to_a,
  ].flatten

  LENGTH = 7

  def generate
    10.times do
      if uid = generate_uid
        return uid
      end
    end

    raise "Failed to generate uid"
  end

  private

    def generate_uid
      uid = (1..LENGTH).map { CHARS.sample }.join
      identity = Identity.create(uid: uid)
      return identity.uid if identity.persisted?

      nil
    end
end
